import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/guilty_free/guilty_free_repository.dart';
import 'package:planit/repository/main/main_repository.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:planit/ui/main/const/main_enums.dart';
import 'package:planit/utils/date_time.dart';

import 'main_state.dart';

final StateNotifierProvider<MainViewModel, MainState> mainViewModelProvider =
    StateNotifierProvider(
  (ref) => MainViewModel(
    mainRepository: ref.read(mainRepositoryProvider),
    guiltyFreeRepository: ref.read(guiltyFreeRepositoryProvider),
    storageService: ref.read(planitStorageServiceProvider),
  ),
);

class MainViewModel extends StateNotifier<MainState> {
  final MainRepository _mainRepository;
  final GuiltyFreeRepository _guiltyFreeRepository;
  final PlanitStorageService _storageService;

  MainViewModel({
    required MainRepository mainRepository,
    required GuiltyFreeRepository guiltyFreeRepository,
    required PlanitStorageService storageService,
  })  : _mainRepository = mainRepository,
        _guiltyFreeRepository = guiltyFreeRepository,
        _storageService = storageService,
        super(MainState());

  // 화면 진입 시 필요한 작업
  Future<void> init() async {
    getTodayPlans();
    // 배너 보여줄지 확인해 상태 업데이트
    final bool showBanner = await checkShowRecoveryRoutineBanner();
    state = state.copyWith(showRecoveryRoutineBanner: showBanner);
  }

  // 플랜 리스트 불러오기
  Future<void> getTodayPlans() async {
    // API 호출 전 loadingStatus 변경하여 UI에 로딩바 처리
    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    final RepositoryResult<TodayPlanListModel> result =
        await _mainRepository.getMainPlanList();

    switch (result) {
      case SuccessRepositoryResult<TodayPlanListModel>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          plans: result.data,
        );

      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 목록 불러오기에 실패했어요.',
        );
    }
  }

  Future<void> switchRoute({
    required RouteType currentType,
  }) async {
    final bool isSlow = currentType == RouteType.slow;
    bool showBanner = state.showRecoveryRoutineBanner;
    // 열정>천천히 전환 시, 회복루틴 배너 노출할지 확인
    if (!isSlow) {
      showBanner = await checkShowRecoveryRoutineBanner();
    }
    // 천천히>열정 전환 시, 무조건 노출 안 함
    else {
      showBanner = false;
    }
    state = state.copyWith(
      routeType: isSlow ? RouteType.passionate : RouteType.slow,
      showRecoveryRoutineBanner: showBanner,
    );
  }

  // 오늘 회복루틴을 한 번도 사용하지 않았을 때에만 배너 노출
  // TODO: 매번 lastDate 로드, today와 비교해 계산 > 비효율적인 것 같아 개선 필요
  Future<bool> checkShowRecoveryRoutineBanner() async {
    final String lastDateString = await _storageService.getString(
      key: StorageKey.lastRecoveryRoutineDate,
      defaultValue: '',
    );

    // 저장된 날짜가 없다면, 사용하지 않은 것이므로 계산없이 true 반환
    if (lastDateString.isEmpty) {
      return true;
    }

    final DateTime? lastDate = stringToDateTime(lastDateString);
    final DateTime today = DateTime.now();

    if (lastDate!.isBefore(today)) {
      return true;
    }
    return false;
  }

  // Checkbox 클릭 시, id 식별하여 plans 변경
  Future<void> onCheckboxTap({
    required int taskId,
    required bool isCurrentCompleted,
  }) async {
    final RepositoryResult<void> result = await _mainRepository.completeTask(
      id: taskId,
    );
    switch (result) {
      case SuccessRepositoryResult():
        // 리스트 갱신
        await getTodayPlans();
        // 체크 안 함>체크 완료로 상태 변경 시 태스크 완료 토스트 노출되도록 message 변경
        if (!isCurrentCompleted) {
          state = state.copyWith(completeMessage: '짱이야, 해내버렸어요! 😍');
          // 다른 태스크 완료 시에도 동작할 수 있도록 잠시 유지 후 초기화
          Future.delayed(Duration(milliseconds: 2500), () {
            state = state.copyWith(completeMessage: '');
          });
        }
      case FailureRepositoryResult():
        state = state.copyWith(
          errorMessage: result.messages!.first,
        );
    }
  }

  // 길티프리 모드 사용 가능한지 판단
  Future<void> checkCanUseGuiltyFree() async {
    final RepositoryResult<bool> result =
        await _guiltyFreeRepository.getCanUseGuiltyFree();
    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(
          canUseGuiltyFree: result.data,
        );
      case FailureRepositoryResult():
        state = state.copyWith(
          errorMessage: result.messages!.first,
        );
    }
  }
}

typedef OnCheckboxTap = void Function({
  required int taskId,
  required bool isCurrentCompleted,
});

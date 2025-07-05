import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/main/main_repository.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:planit/ui/main/component/task_widget.dart';
import 'package:planit/ui/main/const/main_enums.dart';

import 'main_state.dart';

final StateNotifierProvider<MainViewModel, MainState> mainViewModelProvider =
    StateNotifierProvider(
  (ref) => MainViewModel(
    mainRepository: ref.read(mainRepositoryProvider),
    storageService: ref.read(planitStorageServiceProvider),
  ),
);

class MainViewModel extends StateNotifier<MainState> {
  final MainRepository _mainRepository;
  final PlanitStorageService _storageService;

  MainViewModel({
    required MainRepository mainRepository,
    required PlanitStorageService storageService,
  })  : _mainRepository = mainRepository,
        _storageService = storageService,
        super(MainState());

  // 화면 진입 시 필요한 작업
  Future<void> init() async {
    getMainPlanList();
    // 배너 보여줄지 확인해 상태 업데이트
    final bool showBanner = await checkShowRecoveryRoutineBanner();
    state = state.copyWith(showRecoveryRoutineBanner: showBanner);
  }

  // 플랜 리스트 불러오기
  Future<void> getMainPlanList() async {
    // API 호출 전 loadingStatus 변경하여 UI에 로딩바 처리
    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    final RepositoryResult<List<MainPlanModel>> result =
        await _mainRepository.getMainPlanList();

    switch (result) {
      case SuccessRepositoryResult<List<MainPlanModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          plans: result.data,
        );

      case FailureRepositoryResult<List<MainPlanModel>>():
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

    // TODO: stringToDate 적용
    final DateTime lastDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(
      lastDateString,
    );
    final DateTime today = DateTime.now();

    if (lastDate.isBefore(today)) {
      return true;
    }
    return false;
  }

  // Checkbox 클릭 시, planIndex & taskIndex 함께 사용해 할 일 식별하여 plans 변경
  void onCheckboxTap({
    required int planIndex,
    required int taskIndex,
    required bool isCurrentCompleted,
  }) {
    // isCompleted 값이 업데이트 된 새로운 plan 리스트 구성
    final updatedPlans = state.plans
        .asMap()
        .entries
        .map((MapEntry<int, MainPlanModel> planEtries) {
      // planIndex로 플랜 우선 식별하여 변경
      if (planEtries.key == planIndex) {
        // 해당 플랜의 tasks 수정
        final List<TempTaskModel> updatedTasks = planEtries.value.tasks
            .asMap()
            .entries
            .map((MapEntry<int, TempTaskModel> taskEntries) {
          // 식별된 플랜 내에서 taskIndex로 태스크 식별
          if (taskEntries.key == taskIndex) {
            // isCompleted 변경된 태스크 반환
            return TempTaskModel(
              isCompleted: !isCurrentCompleted,
              task: taskEntries.value.task,
            );
          } else {
            // 그 외 태스크 유지
            return taskEntries.value;
          }
        }).toList();
        // 변경된 플랜 반환
        return MainPlanModel(
          planTitle: planEtries.value.planTitle,
          tasks: updatedTasks,
          dDay: planEtries.value.dDay,
        );
      } else {
        // 그 외 플랜 유지
        return planEtries.value;
      }
    }).toList();
    // 변경된 플랜 리스트로 state 업데이트
    state = state.copyWith(plans: updatedPlans);

    // 체크 안 함>체크 완료로 상태 변경 시 태스크 완료 토스트 노출되도록 message 변경
    if (!isCurrentCompleted) {
      state = state.copyWith(completeMessage: '짱이야, 해내버렸어요! 😍');
      // 다른 태스크 완료 시에도 동작할 수 있도록 잠시 유지 후 초기화
      Future.delayed(Duration(milliseconds: 2500), () {
        state = state.copyWith(completeMessage: '');
      });
    }
  }
}

typedef OnCheckboxTap = void Function({
  required int planIndex,
  required int taskIndex,
  required bool isCurrentCompleted,
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/main/main_repository.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/ui/main/const/main_enums.dart';

import 'main_state.dart';

final StateNotifierProvider<MainViewModel, MainState> mainViewModelProvider =
    StateNotifierProvider(
  (ref) => MainViewModel(
    mainRepository: ref.read(mainRepositoryProvider),
  ),
);

class MainViewModel extends StateNotifier<MainState> {
  final MainRepository _mainRepository;

  MainViewModel({
    required MainRepository mainRepository,
  })  : _mainRepository = mainRepository,
        super(MainState());

  // 화면 진입 시 필요한 작업
  void init() {
    getMainPlanList();
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

  // TODO: 방향에 따라 전환 애니메이션 추가
  void switchToLeft({
    required RouteType currentType,
  }) {
    state = state.copyWith(
      routeType: (currentType == RouteType.slow)
          ? RouteType.passionate
          : RouteType.slow,
    );
  }

  // TODO: 방향에 따라 전환 애니메이션 추가
  void switchToRight({
    required RouteType currentType,
  }) {
    state = state.copyWith(
      routeType: (currentType == RouteType.slow)
          ? RouteType.passionate
          : RouteType.slow,
    );
  }
}

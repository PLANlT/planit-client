import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/main/main_repository.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/ui/main/component/task_widget.dart';
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

  // Checkbox 클릭 시, planIndex & taskIndex 함께 사용해 할 일 식별하여 plans 변경
  void onCheckboxTap ({
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
  }
}

typedef OnCheckboxTap = void Function({
  required int planIndex,
  required int taskIndex,
  required bool isCurrentCompleted,
});

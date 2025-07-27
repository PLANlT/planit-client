import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/repository/task/task_repository.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_state.dart';

//플랜 메인화면 -> 플랜 상세화면으로 넘어갈때 , planID를 넘겨주기 위헤 family로 동적으로 넣어줄 수 있게 함.
final planDetailViewModelProvider =
    StateNotifierProvider.family<PlanDetailViewModel, PlanDetailState, int>(
  (ref, planId) => PlanDetailViewModel(
      planId: planId,
      planRepository: ref.read(planRepositoryProvider),
      taskRepositroy: ref.read(taskRepositoryProvider)),
);

class PlanDetailViewModel extends StateNotifier<PlanDetailState> {
  final TaskRepository _taskRepository;
  final PlanRepository _planRepository;

  final int _planId;

  PlanDetailViewModel(
      {required int planId,
      required PlanRepository planRepository,
      required TaskRepository taskRepositroy})
      : _planRepository = planRepository,
        _planId = planId,
        _taskRepository = taskRepositroy,
        super(PlanDetailState());

  void init() {
    getPlanDetail();
  }

  Future<void> getPlanDetail() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final RepositoryResult<PlanDetailModel> planDetailResult =
        await _planRepository.getPlanDetailByPlanId(_planId);
    switch (planDetailResult) {
      case SuccessRepositoryResult<PlanDetailModel>():
        state = state.copyWith(
            loadingStatus: LoadingStatus.success,
            planDetail: planDetailResult.data);
      case FailureRepositoryResult<PlanDetailModel>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 목록 불러오기에 실패했어요.',
        );
    }
  }



  Future<void> clickAddButton(String title) async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    final taskAddResult =
        await _taskRepository.addTask(title: title, planId: _planId);

    if (taskAddResult is SuccessRepositoryResult<TaskModel>) {
      final planDetailResult =
          await _planRepository.getPlanDetailByPlanId(_planId);

      if (planDetailResult is SuccessRepositoryResult<PlanDetailModel>) {
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          planDetail: planDetailResult.data,
        );
      } else {
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 상세 정보 갱신 실패했어요',
        );
      }
    } else {
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        errorMessage: '작업 추가 실패했어요',
      );
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_state.dart';

//플랜 메인화면 -> 플랜 상세화면으로 넘어갈때 , planID를 넘겨주기 위헤 family로 동적으로 넣어줄 수 있게 함.
final planDetailViewModelProvider =
    StateNotifierProvider.family<PlanDetailViewModel, PlanDetailState, int>(
  (ref, planId) => PlanDetailViewModel(
    planId: planId,
    planRepository: ref.read(planRepositoryProvider),
  ),
);

class PlanDetailViewModel extends StateNotifier<PlanDetailState> {
  final PlanRepository _planRepository;
  final int _planId;

  PlanDetailViewModel({
    required int planId,
    required PlanRepository planRepository,
  })  : _planRepository = planRepository,
        _planId = planId,
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
}

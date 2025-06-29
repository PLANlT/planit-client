import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_overview_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_main/plan_state.dart';

final StateNotifierProvider<PlanViewModel, PlanState> planViewModelProvider =
    StateNotifierProvider(
  (ref) => PlanViewModel(
    planRepository: ref.read(planRepositoryProvider),
  ),
);

class PlanViewModel extends StateNotifier<PlanState> {
  final PlanRepository _planRepository;

  PlanViewModel({
    required PlanRepository planRepository,
  })  : _planRepository = planRepository,
        super(PlanState());

  void init() {
    getPlanList();
  }

  Future<void> getPlanList() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final RepositoryResult<List<PlanOverviewModel>> ActivePlanresult =
        await _planRepository.getActivePlanList();
    final RepositoryResult<List<PlanOverviewModel>> PausePlanresult =
        await _planRepository.getActivePlanList();
//ActivePlanList 불러오기 파트
    switch (ActivePlanresult) {
      case SuccessRepositoryResult<List<PlanOverviewModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          activePlans: ActivePlanresult.data,
          pausePlans: ActivePlanresult.data,
        );
      case FailureRepositoryResult<List<PlanOverviewModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 목록 불러오기에 실패했어요.',
        );
    }
//PausePlanList 불러오기 파트
    switch (PausePlanresult) {
      case SuccessRepositoryResult<List<PlanOverviewModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          activePlans: PausePlanresult.data,
          pausePlans: PausePlanresult.data,
        );
      case FailureRepositoryResult<List<PlanOverviewModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 목록 불러오기에 실패했어요.',
        );
    }
//PausePla
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
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
    final RepositoryResult<List<PlanModel>> activePlanresult =
        await _planRepository.getActivePlanList();

    final RepositoryResult<List<PlanModel>> pausePlanresult =
        await _planRepository.getPausePlanList();
//ActivePlanList 불러오기 파트
    switch (activePlanresult) {
      case SuccessRepositoryResult<List<PlanModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          activePlans: activePlanresult.data,
        );
      case FailureRepositoryResult<List<PlanModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 목록 불러오기에 실패했어요.',
        );
    }
//PausePlanList 불러오기 파트
    switch (pausePlanresult) {
      case SuccessRepositoryResult<List<PlanModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          pausePlans: pausePlanresult.data,
        );
      case FailureRepositoryResult<List<PlanModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 목록 불러오기에 실패했어요.',
        );
    }
//PausePla
  }
}

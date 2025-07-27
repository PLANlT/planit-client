import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_more/plan_more_bottom_sheet_state.dart';

final planMoreBottomSheetViewModelProvider = StateNotifierProvider<
    PlanMoreBottomSheetViewModel, PlanMoreBottomSheetState>(
  (ref) {
    final planRepository = ref
        .watch(planRepositoryProvider); // planRepositoryProvider는 기존에 정의돼 있어야 함
    return PlanMoreBottomSheetViewModel(planRepository: planRepository);
  },
);

class PlanMoreBottomSheetViewModel
    extends StateNotifier<PlanMoreBottomSheetState> {
  final PlanRepository _planRepository;

  PlanMoreBottomSheetViewModel({required PlanRepository planRepository})
      : _planRepository = planRepository,
        super(const PlanMoreBottomSheetState()); // 초기 상태 설정

  Future<void> clickDeletePlan(int planId) async {
    // 로딩 시작
    state =
        state.copyWith(loadingStatus: LoadingStatus.loading, errorMessage: '');

    final result = await _planRepository.removePlan(planId: planId);

    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(loadingStatus: LoadingStatus.success);

      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 삭제에 실패했어요.',
        );
    }
  }

  Future<void> clickCompletePlan(int planId) async {
    state =
        state.copyWith(loadingStatus: LoadingStatus.loading, errorMessage: '');

    final result = await _planRepository.completePlanByPlanId(planId);

    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(loadingStatus: LoadingStatus.success);

      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 성공에 실패했어요.',
        );
    }
  }
}

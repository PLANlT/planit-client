import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_create/plan_create_state.dart';
import 'package:planit/ui/plan/plan_main/plan_state.dart';

final StateNotifierProvider<PlanCreateViewModel, PlanCreateState>
    planViewModelProvider = StateNotifierProvider(
  (ref) => PlanCreateViewModel(
    planRepository: ref.read(planRepositoryProvider),
  ),
);

class PlanCreateViewModel extends StateNotifier<PlanCreateState> {
  final PlanRepository _planRepository;

  PlanCreateViewModel({
    required PlanRepository planRepository,
  })  : _planRepository = planRepository,
        super(PlanCreateState());

  void init() {}
  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateMotivation(String motivation) {
    state = state.copyWith(motivation: motivation);
  }

  void updateIcon(String icon) {
    state = state.copyWith(icon: icon);
  }

  void updateDday(String dDay) {
    state = state.copyWith(dDay: dDay);
  }

  void updatePlanStatus(String planStatus) {
    state = state.copyWith(planStatus: planStatus);
  }

  void makePlan() {}
}

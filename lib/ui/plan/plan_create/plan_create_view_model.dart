import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_create/plan_create_state.dart';
import 'package:planit/ui/plan/plan_main/plan_state.dart';

//StateNotifierProvider 생성자에 타입 명시하는 걸 추가하여 타입 안정성 향상
final StateNotifierProvider<PlanCreateViewModel, PlanCreateState>
    planViewModelProvider =
    StateNotifierProvider<PlanCreateViewModel, PlanCreateState>(
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
    state = state.copyWith(
        title: title,
        isNextEnabled: updateIsNextEnabled(
            title: title, icon: state.icon, planStatus: state.planStatus));
  }

  void updateMotivation(String motivation) {
    state = state.copyWith(motivation: motivation);
  }

  void updateIcon(String icon) {
    state = state.copyWith(
        icon: icon,
        isNextEnabled: updateIsNextEnabled(
            title: state.title, icon: icon, planStatus: state.planStatus));
  }

  void updateDday(String dDay) {
    state = state.copyWith(dDay: dDay);
  }

  void updatePlanStatus(String planStatus) {
    state = state.copyWith(
        planStatus: planStatus,
        isNextEnabled: updateIsNextEnabled(
            title: state.title, icon: state.icon, planStatus: planStatus));
  }

  bool updateIsNextEnabled({
    required String title,
    required String icon,
    required String planStatus,
  }) {
    return title.isNotEmpty && icon.isNotEmpty && planStatus.isNotEmpty;
  }

  void makePlan() {}
}

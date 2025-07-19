import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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

  Future<void> uploadPlan() async {
    // 필요한 값들을 state에서 가져옵니다.
    final title = state.title;
    final motivation = state.motivation;
    final icon = state.icon;
    final planStatus = state.planStatus;
    final startedAt = DateFormat('yyyy-MM-dd')
        .format(DateTime.now()); // 예시: 시작일을 selectedDate로 사용
    final finishedAt =
        state.selectedDate; // PlanCreateState에 finishedDate가 있다고 가정

    // 로딩 상태로 변경
    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    final result = await _planRepository.createPlan(
      title: title,
      motivation: motivation,
      icon: icon,
      planStatus: planStatus,
      startedAt: startedAt,
      finishedAt: finishedAt!,
    );
    state = state.copyWith(loadingStatus: LoadingStatus.success);
  }

  void updatePlanStatus(String planStatus) {
    state = state.copyWith(
        planStatus: planStatus,
        isNextEnabled: updateIsNextEnabled(
            title: state.title, icon: state.icon, planStatus: planStatus));
  }

  void updateSelectedDate(String selecetedDate) {
    state = state.copyWith(selectedDate: selecetedDate);
  }

  void updateClickedNext() {
    state = state.copyWith(isClickedNext: true);
  }

  bool updateIsNextEnabled({
    required String title,
    required String icon,
    required String planStatus,
  }) {
    return title.isNotEmpty && icon.isNotEmpty && planStatus.isNotEmpty;
  }

  void calculateDday(DateTime selectedDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

    final diff = dateOnly.difference(today).inDays;

    state = state.copyWith(
      dDay: diff.toString(),
    );
  }
}

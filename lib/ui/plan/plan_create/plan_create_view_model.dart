import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_create/plan_create_state.dart';

//StateNotifierProvider 생성자에 타입 명시하는 걸 추가하여 타입 안정성 향상
final AutoDisposeStateNotifierProvider<PlanCreateViewModel, PlanCreateState>
    planViewModelProvider =
    StateNotifierProvider.autoDispose<PlanCreateViewModel, PlanCreateState>(
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

  Future<void> init(int planId) async {
    await getPlanCreateInfo(planId);
  }

  Future<bool> updatePlanCreateInfo(int planId) async {
    if (state.selectedDate == null) {
      state = state.copyWith(loadingStatus: LoadingStatus.error);
      return false;
    }

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

    final result = await _planRepository.editPlanCreateState(
        planId: planId,
        title: title,
        motivation: motivation,
        icon: icon,
        planStatus: planStatus,
        startedAt: startedAt,
        finishedAt: finishedAt!);

    if (!mounted) return false;
    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(loadingStatus: LoadingStatus.success);
        return true;
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 수정에 오류가 발생했어요. 다시 시도해주세요.',
        );
        return false;
    }
  }

  // void calculateFinalDate(String dDayString) {
  //   final dDayValue =
  //       int.tryParse(dDayString.replaceAll('D-', '').replaceAll('D+', ''));

  //   if (dDayValue == null) {
  //     return;
  //   }

  //   final now = DateTime.now();
  //   final targetDate = now.add(Duration(days: dDayValue));

  //   final finalDay =
  //       '${targetDate.year.toString().padLeft(4, '0')}-${targetDate.month.toString().padLeft(2, '0')}-${targetDate.day.toString().padLeft(2, '0')}';
  //   state = state.copyWith(selectedDate: finalDay);
  //   return;
  // }

  void calculateFinalDate(String dDayString) {
    final input = dDayString.trim().toUpperCase();
    final now = DateTime.now();

    // 형식: D-10 / D+3
    final match = RegExp(r'^D([+-])(\d+)$').firstMatch(input);
    DateTime targetDate;
    if (match != null) {
      final sign = match.group(1)!; // '-' or '+'
      final days = int.parse(match.group(2)!);
      // D-10: 10일 남음 → +10
      // D+3 : 3일 지남 → -3
      final delta = sign == '-' ? days : -days;
      targetDate = now.add(Duration(days: delta));
    } else {
      // 숫자만 들어오는 경우도 허용
      final parsed = int.tryParse(input);
      if (parsed == null) {
        return;
      }
      targetDate = now.add(Duration(days: parsed));
    }

    final finalDay = DateFormat('yyyy-MM-dd').format(targetDate);
    state = state.copyWith(selectedDate: finalDay);
  }

  Future<void> getPlanCreateInfo(int planId) async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final result = await _planRepository.getPlanDetailByPlanId(planId);
    if (!mounted) return;
    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          title: result.data.title,
          motivation: result.data.motivation,
          icon: result.data.icon,
        );
        break;
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 업로드에 오류가 발생했어요. 다시 시도해주세요.',
        );
        break;
    }
  }

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
    if (state.selectedDate == null) {
      state = state.copyWith(loadingStatus: LoadingStatus.error);
      return;
    }

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
        finishedAt: finishedAt!);

    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(loadingStatus: LoadingStatus.success);
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '플랜 업로드에 오류가 발생했어요. 다시 시도해주세요.',
        );
    }
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
    final enabled = state.title.isNotEmpty &&
        state.icon.isNotEmpty &&
        state.planStatus.isNotEmpty;
    state = state.copyWith(isNextEnabled: enabled);
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

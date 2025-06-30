import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_edit/plan_edit_bottom_sheet_state.dart';

final planEditViewModelProvider = StateNotifierProvider.family<
    PlanEditBottomSheetViewModel, PlanEditBottomSheetState, int>(
  (ref, taskId) => PlanEditBottomSheetViewModel(
    taskId: taskId,
    planRepository: ref.read(planRepositoryProvider),
  ),
);

class PlanEditBottomSheetViewModel
    extends StateNotifier<PlanEditBottomSheetState> {
  final PlanRepository _planRepository;
  final int _taskId;

  PlanEditBottomSheetViewModel(
      {required PlanRepository planRepository, required int taskId})
      : _planRepository = planRepository,
        _taskId = taskId,
        super(PlanEditBottomSheetState());

//월화수목금토일 버튼 하나 누를때 추가/삭제
  void toggleDay(String day) {
    final updated = [...state.routinDayList];
    if (updated.contains(day)) {
      updated.remove(day);
    } else {
      updated.add(day);
    }
    state = state.copyWith(routinDayList: updated);
  }

//서버에서 Type을 리스트가 아닌 "ALL", "LOW", "HIGH" 형태의 문자열로 전달해서 Repository에서 변환 로직을 구현해야댐
  void toggleType(String type) {
    final updated = [...state.taskType];
    if (updated.contains(type)) {
      updated.remove(type);
    } else {
      updated.add(type);
    }
    state = state.copyWith(taskType: updated);
  }

  void saveEditedRoutine() {}
  void toggleTimeSetting() {
    state = state.copyWith(timeSetting: !state.timeSetting);
  }
}

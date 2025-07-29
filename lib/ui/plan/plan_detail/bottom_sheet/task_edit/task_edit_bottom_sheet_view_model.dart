import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/task/model/routine_model.dart';
import 'package:planit/repository/task/task_repository.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_edit/task_edit_bottom_sheet_state.dart';

final taskEditViewModelProvider = StateNotifierProvider.autoDispose
    .family<TaskEditBottomSheetViewModel, TaskEditBottomSheetState, int>(
  (ref, taskId) => TaskEditBottomSheetViewModel(
    taskId: taskId,
    taskRepository: ref.read(taskRepositoryProvider),
  ),
);

class TaskEditBottomSheetViewModel
    extends StateNotifier<TaskEditBottomSheetState> {
  final TaskRepository _taskRepository;
  final int _taskId;

  TaskEditBottomSheetViewModel(
      {required TaskRepository taskRepository, required int taskId})
      : _taskRepository = taskRepository,
        _taskId = taskId,
        super(TaskEditBottomSheetState());

  void init() {
    fetchRoutineBytaskId();
  }

  // 시간 리스트 업데이트 함수 추가
  void updateSelectedTime(String time) {
    // 예: 시간은 한 개만 저장한다고 가정하고 리스트 교체
    state = state.copyWith(time: time);
  }

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

  void saveEditedRoutine() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    // taskType 설정
    final taskTypeSet = state.taskType.toSet();
    late final String taskType;
    if (taskTypeSet.containsAll(['HIGH', 'LOW']) && taskTypeSet.length == 2) {
      taskType = 'ALL';
    } else if (taskTypeSet.contains('HIGH')) {
      taskType = 'PASSIONATE';
    } else {
      taskType = 'SLOW';
    }

    // 요일 매핑
    const dayMap = {
      '월': 'MONDAY',
      '화': 'TUESDAY',
      '수': 'WEDNESDAY',
      '목': 'THURSDAY',
      '금': 'FRIDAY',
      '토': 'SATURDAY',
      '일': 'SUNDAY',
    };

    final routineDay = state.routinDayList
        .where(dayMap.containsKey)
        .map((d) => dayMap[d]!)
        .toList();

    // 서버 요청
    final editRoutineResult = await _taskRepository.setRoutine(
      taskId: _taskId,
      routineModel: RoutineModel(
        taskType: taskType,
        routineTimeString: state.time,
        routineDay: routineDay,
      ),
    );
    if (!mounted) return;
    // 결과 처리
    switch (editRoutineResult) {
      case SuccessRepositoryResult():
        state = state.copyWith(loadingStatus: LoadingStatus.success);
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '루틴 설정에 실패했어요',
        );
    }
  }

  void toggleTimeSetting() {
    state = state.copyWith(timeSetting: !state.timeSetting);
  }

  void fetchRoutineBytaskId() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final routineResult =
        await _taskRepository.getRoutinebyTaskId(taskId: _taskId);
    if (!mounted) return;
    switch (routineResult) {
      case SuccessRepositoryResult():
        late List<String> tasktype;
        if (routineResult.data.taskType == 'PASSIONATE') tasktype = ['HIGH'];
        if (routineResult.data.taskType == 'SLOW') tasktype = ['LOW'];
        if (routineResult.data.taskType == 'ALL') tasktype = ['LOW', 'HIGH'];
        final String routineTime =
            routineResult.data.routineTimeString ?? '00:00';
        const dayMap = {
          'MONDAY': '월',
          'TUESDAY': '화',
          'WEDNESDAY': '수',
          'THURSDAY': '목',
          'FRIDAY': '금',
          'SATURDAY': '토',
          'SUNDAY': '일',
        };

        final List<String> routineDayList =
            routineResult.data.routineDay.map((e) => dayMap[e] ?? e).toList();
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          routinDayList: routineDayList,
          taskType: tasktype,
          time: routineTime,
          timeSetting: routineTime.isNotEmpty, // 서버에서 줘야함
        );
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '루틴 불러오기에 실패했어요',
        );
    }
  }
}

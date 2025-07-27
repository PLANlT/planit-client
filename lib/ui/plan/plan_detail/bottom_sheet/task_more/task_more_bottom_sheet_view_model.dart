import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/task/task_repository.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_more/task_more_bottom_sheet_state.dart';

final taskMoreBottomSheetViewModelProvider = StateNotifierProvider.autoDispose
    .family<TaskMoreBottomSheetViewModel, TaskMoreBottomSheetState, int>(
  (ref, taskId) => TaskMoreBottomSheetViewModel(
    taskRepository: ref.read(taskRepositoryProvider),
    taskid: taskId,
  ),
);

class TaskMoreBottomSheetViewModel
    extends StateNotifier<TaskMoreBottomSheetState> {
  final TaskRepository _taskRepository;
  final int _taskId;

  TaskMoreBottomSheetViewModel(
      {required TaskRepository taskRepository, required int taskid})
      : _taskRepository = taskRepository,
        _taskId = taskid,
        super(TaskMoreBottomSheetState());

  void clickDeleteTask() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    final result = await _taskRepository.removeTask(taskId: _taskId);
    if (!mounted) return;
    switch (result) {
      case SuccessRepositoryResult():
        state = state.copyWith(loadingStatus: LoadingStatus.success);

      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '작업 삭제에 실패했어요.',
        );
    }
  }
}

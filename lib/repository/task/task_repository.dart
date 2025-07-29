import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/error_message.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/task/request_body/routine_request_body.dart';
import 'package:planit/data_source/task/request_body/task_request_body.dart';
import 'package:planit/data_source/task/response_body/routine_response_body.dart';
import 'package:planit/data_source/task/response_body/task_create_response_body.dart';
import 'package:planit/data_source/task/task_data_source.dart';
import 'package:planit/repository/task/model/routine_model.dart';
import 'package:planit/repository/task/model/task_model.dart';

final AutoDisposeProvider<TaskRepository> taskRepositoryProvider =
    Provider.autoDispose<TaskRepository>(
  (ref) => TaskRepository(taskDataSource: ref.read(taskDataSourceProvider)),
);

class TaskRepository {
  final TaskDataSource _taskDataSource;

  const TaskRepository({
    required TaskDataSource taskDataSource,
  }) : _taskDataSource = taskDataSource;

  Future<RepositoryResult<RoutineModel>> getRoutinebyTaskId(
      {required int taskId}) async {
    try {
      final ApiResponse<RoutineResponseBody> result =
          await _taskDataSource.getRoutine(taskId: taskId);
      final model = RoutineModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<void>> removeTask({required int taskId}) async {
    try {
      await _taskDataSource.deleteTask(taskId: taskId);
      return const SuccessRepositoryResult(data: null);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  Future<RepositoryResult<RoutineModel>> setRoutine(
      {required int taskId, required RoutineModel routineModel}) async {
    try {
      final ApiResponse<RoutineResponseBody> result =
          await _taskDataSource.patchRoutine(
        taskId: taskId,
        body: RoutineRequestBody(
            routineDay: routineModel.routineDay,
            taskType: routineModel.taskType,
            routineTime: routineModel.routineTimeString),
      );
      final model = RoutineModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<TaskModel>> addTask({
    required String title,
    required int planId,
    required String taskType,
  }) async {
    try {
      final ApiResponse<TaskCreateResponseBody> result =
          await _taskDataSource.createTask(
        planId: planId,
        body: TaskRequestBody(
          title: title,
          taskType: taskType,
        ),
      );
      final model = TaskModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }
}

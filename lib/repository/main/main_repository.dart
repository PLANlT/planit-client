import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/main/main_data_source.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';

import '../../core/error_message.dart';
import '../../data_source/main/reponse_body/today_tasks_response_body.dart';

final AutoDisposeProvider<MainRepository> mainRepositoryProvider =
    Provider.autoDispose<MainRepository>(
  (ref) => MainRepository(
    mainDataSource: ref.read(mainDataSourceProvider),
  ),
);

class MainRepository {
  final MainDataSource _mainDataSource;

  const MainRepository({
    required MainDataSource mainDataSource,
  }) : _mainDataSource = mainDataSource;

  Future<RepositoryResult<TodayPlanListModel>> getMainPlanList() async {
    try {
      final ApiResponse<TodayPlanListResponseBody> result =
          await _mainDataSource.getTodayTasks();
      final TodayPlanListModel data = TodayPlanListModel.fromResponse(
        result.data,
      );
      return SuccessRepositoryResult<TodayPlanListModel>(data: data);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  Future<RepositoryResult<void>> completeTask({required int id}) async {
    try {
      await _mainDataSource.completeTask(taskId: id);
      return SuccessRepositoryResult(
        data: null,
      );
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }
}

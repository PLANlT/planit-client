import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data_source/main/reponse_body/today_tasks_response_body.dart';
import 'package:planit/data_source/task/request_body/routine_request_body.dart';
import 'package:planit/data_source/task/response_body/routine_response_body.dart';
import 'package:planit/data_source/task/response_body/task_create_response_body.dart';
import 'package:planit/service/network/dio_service.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api_response.dart';

part 'task_data_source.g.dart';

final Provider<TaskDataSource> taskDataSourceProvider =
    Provider<TaskDataSource>(
  (ref) => TaskDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class TaskDataSource {
  factory TaskDataSource(Dio dio) = _TaskDataSource;

  @POST('/planit/tasks')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<TaskCreateResponseBody>> createTask(
    @Query('planId') int planId,
    @Query('title') String title,
  );

  @PATCH('/planit/tasks/{taskId}/routine')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<RoutineResponseBody>> patchRoutine({
    @Path('taskId') int taskId,
    @Body() required RoutineRequestBody body,
  });
}

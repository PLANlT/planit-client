import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data_source/main/reponse_body/today_tasks_response_body.dart';
import 'package:planit/service/network/dio_service.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api_response.dart';

part 'main_data_source.g.dart';

final Provider<MainDataSource> mainDataSourceProvider =
    Provider<MainDataSource>(
  (ref) => MainDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class MainDataSource {
  factory MainDataSource(Dio dio) = _MainDataSource;

  @GET('/planit/plans/today')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<TodayPlanListResponseBody>> getTodayTasks();

  @POST('/planit/tasks/{taskId}/complete')
  @Headers({'accessToken': 'true'})
  Future<void> completeTask({
    @Path('taskId') required int taskId,
  });
}

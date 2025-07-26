import 'package:dio/dio.dart' hide Headers;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/data_source/archiving/response_body/archiving_restart_plan_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/archiving_complete_plan_response_body.dart';
import 'package:planit/data_source/archiving/response_body/archiving_plan_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_create_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_response_body.dart';
import 'package:planit/service/network/dio_service.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'archiving_data_source.g.dart';

final Provider<ArchivingDataSource> archivingDataSourceProvider =
    Provider<ArchivingDataSource>(
  (ref) => ArchivingDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class ArchivingDataSource {
  factory ArchivingDataSource(Dio dio) = _ArchivingDataSource;

  @GET('/planit/archives')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<ArchivingPlanResponseBody>> getArchivingPlanLists();

  @PATCH('/planit/plans/{planId}/restart')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<ArchivingRestartPlanResponseBody>> restartPlan({
    @Path('planId') required int planId,
  });
}

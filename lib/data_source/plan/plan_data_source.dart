import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/data_source/plan/reponse_body/plan_create_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_detail_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_response_body.dart';
import 'package:planit/data_source/plan/request_%20body/plan_request_body.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/service/network/dio_service.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/api_response.dart';

part 'plan_data_source.g.dart';

final Provider<PlanDataSource> planDataSourceProvider =
    Provider<PlanDataSource>(
  (ref) => PlanDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class PlanDataSource {
  factory PlanDataSource(Dio dio) = _PlanDataSource;

  @GET('/planit/plans')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<PlanListResponseBody>> getPlanLists(
    @Query('planStatus') String planStatus,
  );

  @GET('/planit/plans/{planId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<PlanDetailResponseBody>> getPlanDetails(
    @Path('planId') int planId,
  );

  @POST('/planit/plans')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<PlanCreateResponseBody>> postPlan({
    @Body() required PlanCreateRequestBody body,
  });
}

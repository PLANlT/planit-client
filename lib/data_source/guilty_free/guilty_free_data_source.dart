import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/data_source/guilty_free/response_body/guilty_free_date_response_body.dart';
import 'package:planit/data_source/guilty_free/response_body/guilty_free_reason_list_response_body.dart';
import 'package:planit/service/network/dio_service.dart';
import 'package:retrofit/retrofit.dart';

part 'guilty_free_data_source.g.dart';

final Provider<GuiltyFreeDataSource> guiltyFreeDataSourceProvider =
    Provider<GuiltyFreeDataSource>(
        (ref) => GuiltyFreeDataSource(ref.read(dioServiceProvider)));

@RestApi()
abstract class GuiltyFreeDataSource {
  factory GuiltyFreeDataSource(Dio dio) = _GuiltyFreeDataSource;

  @GET('/planit/guilty-free')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<GuiltyFreeDateResponseBody>> getGuiltyFreeDate();

  @PATCH('/planit/guilty-free')
  @Headers({'accessToken': 'true'})
  Future<void> activateGuiltyFree({
    @Query('reason') required String reason,
  });

  @GET('/planit/guilty-free/list')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<GuiltyFreeReasonListResponseBody>>
      getGuiltyFreeReasonList();
}

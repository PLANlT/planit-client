import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data_source/mypage/response_body/consecutive_days_response_body.dart';
import 'package:planit/data_source/mypage/response_body/my_info_response_body.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api_response.dart';
import '../../service/network/dio_service.dart';

part 'mypage_data_source.g.dart';

final Provider<MypageDataSource> mypageDataSourceProvider =
    Provider<MypageDataSource>(
  (ref) => MypageDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class MypageDataSource {
  factory MypageDataSource(Dio dio) = _MypageDataSource;

  @GET('/planit/members')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<MyInfoResponseBody>> getMyInfo();

  @GET('/planit/members/consecutive-days')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<ConsecutiveDaysResponseBody>> getConsecutiveDays();

  @PATCH('/planit/members/delete')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<void>> delete();
}

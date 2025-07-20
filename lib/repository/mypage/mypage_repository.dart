import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/mypage/mypage_data_source.dart';
import 'package:planit/data_source/mypage/response_body/consecutive_days_response_body.dart';
import 'package:planit/data_source/mypage/response_body/my_info_response_body.dart';
import 'package:planit/repository/mypage/model/consecutive_days_model.dart';
import 'package:planit/repository/mypage/model/my_info_model.dart';

import '../../core/error_message.dart';

final AutoDisposeProvider<MypageRepository> mypageRepositoryProvider =
    Provider.autoDispose<MypageRepository>(
  (ref) => MypageRepository(
    mypageDataSource: ref.read(mypageDataSourceProvider),
  ),
);

class MypageRepository {
  final MypageDataSource _mypageDataSource;

  const MypageRepository({
    required MypageDataSource mypageDataSource,
  }) : _mypageDataSource = mypageDataSource;

  Future<RepositoryResult<MyInfoModel>> getMyInfo() async {
    try {
      final ApiResponse<MyInfoResponseBody> result =
          await _mypageDataSource.getMyInfo();
      final MyInfoModel data = MyInfoModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: data);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  Future<RepositoryResult<ConsecutiveDaysModel>> getConsecutiveDays() async {
    try {
      final ApiResponse<ConsecutiveDaysResponseBody> result =
          await _mypageDataSource.getConsecutiveDays();
      final data = ConsecutiveDaysModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: data);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }
}

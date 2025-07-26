import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/guilty_free_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/guilty_free/guilty_free_data_source.dart';
import 'package:planit/data_source/guilty_free/response_body/guilty_free_date_response_body.dart';
import 'package:planit/data_source/guilty_free/response_body/guilty_free_reason_list_response_body.dart';
import 'package:planit/repository/guilty_free/model/guilty_free_date_model.dart';
import 'package:planit/repository/guilty_free/model/guilty_free_reason_list_model.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';

import '../../core/error_message.dart';
import '../../service/app/app_service.dart';
import '../../utils/date_time.dart';

final AutoDisposeProvider<GuiltyFreeRepository> guiltyFreeRepositoryProvider =
    Provider.autoDispose<GuiltyFreeRepository>(
  (ref) => GuiltyFreeRepository(
    planitStorageService: ref.read(planitStorageServiceProvider),
    appService: ref.read(appServiceProvider.notifier),
    guiltyFreeDataSource: ref.read(guiltyFreeDataSourceProvider),
  ),
);

class GuiltyFreeRepository {
  final PlanitStorageService _planitStorageService;
  final AppService _appService;
  final GuiltyFreeDataSource _guiltyFreeDataSource;

  GuiltyFreeRepository({
    required PlanitStorageService planitStorageService,
    required AppService appService,
    required GuiltyFreeDataSource guiltyFreeDataSource,
  })  : _planitStorageService = planitStorageService,
        _appService = appService,
        _guiltyFreeDataSource = guiltyFreeDataSource;

  // 길티프리 사용일 조회
  // 로그인 시 호출하여 로컬에 저장
  Future<RepositoryResult<GuiltyFreeDateModel>> getGuiltyFreeDate() async {
    try {
      final ApiResponse<GuiltyFreeDateResponseBody> result =
          await _guiltyFreeDataSource.getGuiltyFreeDate();
      // 성공 시 로컬에 저장
      _planitStorageService.setString(
        key: StorageKey.lastGuiltyFreeDate,
        value: result.data.activatedAt,
      );
      final data = GuiltyFreeDateModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: data);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  // 길티프리 활성화
  Future<RepositoryResult<void>> startGuiltyFree({
    required String reason,
  }) async {
    try {
      await _guiltyFreeDataSource.activateGuiltyFree(reason: reason);
      // API 실패 시 길티프리를 시작하지 않음
      // API 성공 시에만 로컬에 길티프리 시작일 저장
      final DateTime today = DateTime.now();
      _planitStorageService.setString(
        key: StorageKey.lastGuiltyFreeDate,
        value: today.toString(),
      );
      // 길티프리 상태 전역관리를 위해 AppState에 반영
      _appService.updateGuiltyFreeStatus(newStatus: GuiltyFreeStatus.ing);
      return const SuccessRepositoryResult(
        data: null,
      );
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  // 길티프리 종료
  RepositoryResult<void> endGuiltyFree() {
    // 길티프리 상태 전역관리를 위해 AppState에 반영
    _appService.updateGuiltyFreeStatus(newStatus: GuiltyFreeStatus.end);
    return const SuccessRepositoryResult(
      data: null,
    );
  }

  // lastGuiltyFreeMode 이후 일주일이 지났는지 확인>길티프리 사용 가능 여부 판단
  // 예상 문제: 기기 변경/재설치로 로컬 데이터가 없다면, 실제로 사용 불가하나 가능한 것으로 판단될 수 있음
  // 해결 방안: 로그인 시 API 호출하여 로컬에 저장
  Future<RepositoryResult<bool>> getCanUseGuiltyFree() async {
    try {
      final lastGuiltyFreeDateString = await _planitStorageService.getString(
        key: StorageKey.lastGuiltyFreeDate,
        defaultValue: '',
      );
      // 길티프리를 사용한 적 없다면 > 사용 가능
      if (lastGuiltyFreeDateString.isEmpty) {
        return SuccessRepositoryResult(
          data: true,
        );
      }

      // 길티프리를 사용한 적 있다면 > 오늘 날짜와 비교
      final DateTime today = DateTime.now();
      final DateTime? lastGuiltyFreeDate = stringToDateTime(
        lastGuiltyFreeDateString,
      );

      // 변환 실패 시 > 에러 처리
      if (lastGuiltyFreeDate == null) {
        return FailureRepositoryResult(
          messages: ['일시적인 오류가 발생했어요.\n오류가 반복된다면 고객센터로 문의해주세요.'],
        );
      }

      // 7일 이상 지났는지 확인 > 지났다면 사용 가능, 지나지 않았다면 불가능
      Duration duration = today.difference(lastGuiltyFreeDate);
      if (duration.inDays >= 6) {
        return SuccessRepositoryResult(
          data: true,
        );
      } else {
        return SuccessRepositoryResult(
          data: false,
        );
      }
    } catch (e) {
      debugPrint('MainRepository:getCanUseGuiltyFree:$e');
      return FailureRepositoryResult(
        messages: ['일시적인 오류가 발생했어요.\n오류가 반복된다면 고객센터로 문의해주세요.'],
      );
    }
  }

  // 길티프리 이유 목록 조회
  Future<RepositoryResult<GuiltyFreeReasonListModel>>
      getGuiltyFreeReasons() async {
    try {
      final ApiResponse<GuiltyFreeReasonListResponseBody> result =
          await _guiltyFreeDataSource.getGuiltyFreeReasonList();
      final GuiltyFreeReasonListModel data =
          GuiltyFreeReasonListModel.fromResponse(
        result.data,
      );
      return SuccessRepositoryResult<GuiltyFreeReasonListModel>(data: data);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }
}

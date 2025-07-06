import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/guilty_free_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';

import '../../service/app/app_service.dart';
import '../../utils/date_time.dart';

final AutoDisposeProvider<GuiltyFreeRepository> guiltyFreeRepositoryProvider =
    Provider.autoDispose<GuiltyFreeRepository>(
  (ref) => GuiltyFreeRepository(
    planitStorageService: ref.read(planitStorageServiceProvider),
    appService: ref.read(appServiceProvider.notifier),
  ),
);

class GuiltyFreeRepository {
  final PlanitStorageService _planitStorageService;
  final AppService _appService;

  GuiltyFreeRepository({
    required PlanitStorageService planitStorageService,
    required AppService appService,
  })  : _planitStorageService = planitStorageService,
        _appService = appService;

  RepositoryResult<void> startGuiltyFree({
    required String reason,
  }) {
    // TODO: API 호출 먼저
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
  }

  RepositoryResult<void> endGuiltyFree() {
    // TODO: API 호출 먼저
    // API 실패 시 길티프리를 강제 종료하지 않음
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
      // 길티프리를 사용한 적 없다면 > 에러 처리
      if (lastGuiltyFreeDateString.isEmpty) {
        return FailureRepositoryResult(
          messages: ['일시적인 오류가 발생했어요.\n오류가 반복된다면 고객센터로 문의해주세요.'],
        );
      }

      // 길티프리를 사용한 적 있다면 > 오늘 날짜와 비교
      final DateTime today = DateTime.now();
      final DateTime? lastGuiltyFreeDate = stringToDateTime(
        lastGuiltyFreeDateString,
      );

      // 변환 실패 시 > 사용 가능
      if (lastGuiltyFreeDate == null) {
        return SuccessRepositoryResult(
          data: true,
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
}

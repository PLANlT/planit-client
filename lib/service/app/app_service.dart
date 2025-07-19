import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/service/app/app_state.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/secure_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:planit/utils/date_time.dart';

import '../../core/guilty_free_status.dart';

// AppService를 싱글톤으로 관리하는 provider
final StateNotifierProvider<AppService, AppState> appServiceProvider =
    StateNotifierProvider<AppService, AppState>(
  (ref) => AppService(
    secureStorageService: ref.watch(secureStorageServiceProvider),
    planitStorageService: ref.watch(planitStorageServiceProvider),
  ),
);

// AppState를 제어하는 StateNotifier
class AppService extends StateNotifier<AppState> {
  final SecureStorageService _secureStorageService;
  final PlanitStorageService _planitStorageService;

  AppService({
    required SecureStorageService secureStorageService,
    required PlanitStorageService planitStorageService,
  })  : _secureStorageService = secureStorageService,
        _planitStorageService = planitStorageService,
        super(AppState());

  bool isSignedIn() {
    return state.isSignedIn;
  }

  // 앱이 켜질 때, 로그인 상태를 확인해 AppState에 저장
  Future<void> checkLoginStatus() async {
    // accessToken과 refreshToken이 모두 저장되어 있다면 로그인 상태로 판단
    final String? accessToken = await _secureStorageService.getString(
      key: StorageKey.accessTokenKey,
    );
    final String? refreshToken = await _secureStorageService.getString(
      key: StorageKey.refreshTokenKey,
    );
    if (accessToken != null && refreshToken != null) {
      state = state.copyWith(isSignedIn: true);
    }
  }

  Future<void> signIn({
    required String accessToken,
    required String refreshToken,
  }) async {
    // 토큰 저장
    await _secureStorageService.setString(
      key: StorageKey.accessTokenKey,
      value: accessToken,
    );

    await _secureStorageService.setString(
      key: StorageKey.refreshTokenKey,
      value: refreshToken,
    );

    // AppState 변경
    state = state.copyWith(isSignedIn: true);
  }

  Future<void> signOut() async {
    // AppState 변경
    state = state.copyWith(isSignedIn: false);

    // 토큰 삭제
    await _secureStorageService.clearAll();

    debugPrint('AppService:로그아웃 완료');
  }

  // Splash에서 호출하여, GuiltyFree 상태 확인
  // none > 디폴트
  // ing > 메인에 길티프리 노출
  // end > 길티프리 완료 화면으로 redirect
  Future<void> getGuiltyFreeStatus() async {
    final String statusString = await _planitStorageService.getString(
      key: StorageKey.guiltyFreeStatus,
      defaultValue: GuiltyFreeStatus.none.name,
    );

    // String을 enum으로 변환
    GuiltyFreeStatus status = GuiltyFreeStatus.values.byName(
      statusString,
    );

    // ing이라면, 길티프리가 끝난 건 아닌지 확인
    // lastDate가 어제 또는 그 이전이고, 현재 시각이 오전 6시 이후라면 end로 변경
    if (status == GuiltyFreeStatus.ing) {
      final DateTime today = DateTime.now();
      final String lastDateString = await _planitStorageService.getString(
        key: StorageKey.lastGuiltyFreeDate,
      );
      final DateTime? lastDate = stringToDateTime(lastDateString);

      if (lastDate != null && lastDate.isBefore(today) && today.hour >= 6) {
        status = GuiltyFreeStatus.end;
        _planitStorageService.setString(
          key: StorageKey.guiltyFreeStatus,
          value: status.name,
        );
      }
    }

    state = state.copyWith(guiltyFreeStatus: status);
    debugPrint('AppService:getGuiltyFreeStatus:status=$status');
  }

  // 길티프리 모드 시작 시 사용 > ing으로 변경
  // 길티프리 종료 화면 노출 시 사용 > none으로 변경
  void updateGuiltyFreeStatus({
    required GuiltyFreeStatus newStatus,
  }) {
    state = state.copyWith(guiltyFreeStatus: newStatus);
    _planitStorageService.setString(
      key: StorageKey.guiltyFreeStatus,
      value: newStatus.name,
    );
  }
}

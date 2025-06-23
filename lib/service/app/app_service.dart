import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/service/app/app_state.dart';
import 'package:planit/service/storage/secure_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';

// AppService를 싱글톤으로 관리하는 provider
final StateNotifierProvider<AppService, AppState> appServiceProvider =
StateNotifierProvider<AppService, AppState>(
      (ref) =>
      AppService(
        secureStorageService: ref.watch(secureStorageServiceProvider),
        state: const AppState(),
      ),
);

// AppState를 제어하는 StateNotifier
class AppService extends StateNotifier<AppState> {
  final SecureStorageService _secureStorageService;

  AppService({
    required SecureStorageService secureStorageService,
    required AppState state,
  })
      : _secureStorageService = secureStorageService,
        super(state);

  bool isSignedIn() {
    return state.isSignedIn;
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
  }
}

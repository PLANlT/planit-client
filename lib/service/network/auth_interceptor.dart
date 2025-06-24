import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/service/app/app_service.dart';
import 'package:planit/service/storage/secure_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Provider<AuthInterceptor> authInterceptorProvider =
    Provider<AuthInterceptor>(
  (ref) => AuthInterceptor(
    secureStorageService: ref.watch(secureStorageServiceProvider),
    appService: ref.read(appServiceProvider.notifier),
  ),
);

class AuthInterceptor extends QueuedInterceptor {
  final SecureStorageService _secureStorageService;
  final AppService _appService;

  AuthInterceptor({
    required SecureStorageService secureStorageService,
    required AppService appService,
  })  : _secureStorageService = secureStorageService,
        _appService = appService;

  // 요청을 보낼 때, SercureStorage에 저장된 토큰을 읽어 헤더에 넣어줍니다
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // accessToken이 필요한지 확인
    if (options.headers['accessToken'] == 'true') {
      // 임시값 제거
      options.headers.remove('accessToken');

      final token = await _secureStorageService.getString(
        key: StorageKey.accessTokenKey,
      );

      // SecureStorage에 저장된 accessToken 헤더에 추가
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    super.onRequest(options, handler);
  }

  // 토큰 인증 오류을 처리합니다
  // 401 에러 > refreshToken으로 accessToken 갱신
  // 갱신 실패 > 로그아웃 처리 (AppService로 AppState 관리)
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 토큰 갱신이 필요한/가능한 상태인지 확인
    final isStatus401 = err.response?.statusCode == 401;
    // TODO: API에 따라 변경 필요
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isPathRefresh) {
      // 별도의 dio 생성
      final Dio dio = Dio()
        ..options = BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        )
        ..interceptors.addAll(
          <Interceptor>[
            if (kDebugMode)
              PrettyDioLogger(
                requestHeader: true,
                requestBody: true,
              ),
          ],
        );

      final refreshToken = await _secureStorageService.getString(
        key: StorageKey.refreshTokenKey,
      );

      // refreshToken이 없다면 갱신 시도X 및 로그아웃 처리
      if (refreshToken == null) {
        _appService.signOut();
        return handler.reject(err);
      }

      try {
        // TODO: API 호출해 새로운 accessToken 얻기

        // TODO: 새로운 accessToken 헤더에 삽입
        final options = err.requestOptions;
        options.headers.addAll({
          'Authorization': 'Bearer ',
        });

        // TODO: 새로운 accessToken 저장
        await _secureStorageService.setString(
          key: StorageKey.accessTokenKey,
          value: 'accessToken',
        );

        // 갱신된 토큰으로 재요청
        final response = await dio.fetch(options);
        handler.resolve(response);
      } on DioException catch (e) {
        // 실패 시 로그아웃
        _appService.signOut();
        handler.reject(e);
      }
    }

    return handler.next(err);
  }
}

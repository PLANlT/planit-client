import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'auth_interceptor.dart';

// dio를 싱글톤으로 관리합니다
final dioServiceProvider = Provider(
  (ref) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 30000),
        contentType: Headers.jsonContentType,
      );

    // 토큰 처리용 인터셉터 주입
    dio.interceptors.add(ref.watch(authInterceptorProvider));

    // 개발 환경일 때에만 로그 출력용 인터셉터 주입
    if (kDebugMode) {
      dio.interceptors.add(
          // 개발 중에만 로그 출력용 인터셉터 주입
          PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  },
);

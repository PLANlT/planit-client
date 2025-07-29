import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../service/app/app_service.dart';
import '../service/app/app_state.dart';

class AppRouterInterceptor {
  final Ref _ref;

  const AppRouterInterceptor({
    required Ref ref,
  }) : _ref = ref;

  // 라우트의 이동마다 호출되어, 로그인 상태가 아니라면 로그인 페이지로 이동하게 합니다
  // 로그인이 완료되면 홈으로 이동하게 합니다
  String? redirect(BuildContext context, GoRouterState state) {
    final AppState appState = _ref.read(appServiceProvider);
    final bool isSignedIn = appState.isSignedIn;

    if (!isSignedIn) {
      // 현 위치가 로그인, 스플래시, 온보딩 페이지라면 리다이렉트하지 않음
      // 웹뷰 화면도 리다이렉트 하지 않음 (회원가입 도중 약관 웹뷰를 열기 때문)
      if (state.fullPath?.startsWith('/login') == false &&
          state.fullPath?.startsWith('/splash') == false &&
          state.fullPath?.startsWith('/onboarding') == false&&
          state.fullPath?.startsWith('/webView') == false) {
        return '/login';
      }
    } else {
      // 로그인 상태이고, 로그인 페이지에 있음 > 홈으로 리다이렉트
      if (state.fullPath != null && state.fullPath!.startsWith('/login')) {
        return '/';
      }
    }

    // 그 외 리다이렉트 하지 않음
    return null;
  }
}

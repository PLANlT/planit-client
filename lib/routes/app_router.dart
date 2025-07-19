import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/routes/redirect_notifier.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/login/login_view.dart';
import 'package:planit/ui/login/tos_view.dart';
import 'package:planit/ui/onboarding/onboarding_view.dart';
import 'package:planit/ui/splash_view.dart';

import 'app_router_interceptor.dart';

final Provider<AppRouter> appRouterProvider =
    Provider<AppRouter>((ref) => AppRouter(
          appRouterInterceptor: AppRouterInterceptor(ref: ref),
          refreshListenable: ref.read(redirectNotifierProvider),
        ));

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  AppRouter({
    required Listenable refreshListenable,
    required AppRouterInterceptor appRouterInterceptor,
  })  : _refreshListenable = refreshListenable,
        _appRouterInterceptor = appRouterInterceptor;

  final Listenable _refreshListenable;
  final AppRouterInterceptor _appRouterInterceptor;

  late final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Internal Error'),
      ),
    ),
    redirect: (context, state) => _appRouterInterceptor.redirect(
      context,
      state,
    ),
    refreshListenable: _refreshListenable,
    initialLocation: '/splash',
    routes: [
      // 루트탭 > 마이페이지, 플랜, 아카이빙
      GoRoute(
        path: '/',
        name: RootTab.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: RootTab(),
        ),
        routes: [],
      ),
      // 스플래시
      GoRoute(
        path: '/splash',
        name: SplashView.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SplashView(),
        ),
      ),
      // 온보딩
      GoRoute(
        path: '/onboarding',
        name: OnboardingView.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: OnboardingView(),
        ),
      ),
      // 로그인 > 약관
      GoRoute(
        path: '/login',
        name: LoginView.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: LoginView(),
        ),
        routes: [
          GoRoute(
            path: '/tos',
            name: TosView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: TosView(),
            ),
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}

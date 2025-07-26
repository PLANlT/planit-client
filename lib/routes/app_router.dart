import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/routes/redirect_notifier.dart';
import 'package:planit/ui/common/const/web_view_params.dart';
import 'package:planit/ui/common/view/planit_web_view.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/guilty_free/ing/history/guilty_free_history_view.dart';
import 'package:planit/ui/guilty_free/start/view/guilty_free_blocked_view.dart';
import 'package:planit/ui/guilty_free/start/view/guilty_free_intro_view.dart';
import 'package:planit/ui/guilty_free/start/view/guilty_free_reason_view.dart';
import 'package:planit/ui/login/login_view.dart';
import 'package:planit/ui/login/tos_view.dart';
import 'package:planit/ui/mypage/view/mypage_account_view.dart';
import 'package:planit/ui/mypage/view/mypage_customer_view.dart';
import 'package:planit/ui/mypage/view/mypage_view.dart';
import 'package:planit/ui/onboarding/onboarding_view.dart';
import 'package:planit/ui/recovery/recovery_complete_view.dart';
import 'package:planit/ui/recovery/recovery_deep_breath_view.dart';
import 'package:planit/ui/recovery/recovery_description_view.dart';
import 'package:planit/ui/recovery/recovery_small_action_view.dart';
import 'package:planit/ui/recovery/recovery_stop_phone_view.dart';
import 'package:planit/ui/splash_view.dart';

import '../ui/recovery/recovery_intro_view.dart';
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
        routes: [
          // 마이페이지
          GoRoute(
            path: 'main/mypage',
            name: MypageView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: MypageView(),
            ),
            routes: [
              GoRoute(
                path: 'customer',
                name: MypageCustomerView.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: MypageCustomerView(),
                ),
              ),
              GoRoute(
                path: 'account',
                name: MypageAccountView.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: MypageAccountView(),
                ),
              ),
            ],
          ),
          // 길티프리
          GoRoute(
            path: 'guilty-intro',
            name: GuiltyFreeIntroView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: GuiltyFreeIntroView(),
            ),
            routes: [
              GoRoute(
                path: '/reason',
                name: GuiltyFreeReasonView.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: GuiltyFreeReasonView(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'guilty-blocked',
            name: GuiltyFreeBlockedView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: GuiltyFreeBlockedView(),
            ),
          ),
          GoRoute(
            path: 'guilty-history',
            name: GuiltyFreeHistoryView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: GuiltyFreeHistoryView(),
            ),
          ),
          // 회복루틴
          GoRoute(
            path: 'intro',
            name: RecoveryIntroView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RecoveryIntroView(),
            ),
          ),
          GoRoute(
            path: 'intro/phone',
            name: RecoveryStopPhoneView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RecoveryStopPhoneView(),
            ),
          ),
          GoRoute(
            path: 'intro/phone/description',
            name: RecoveryDescriptionView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RecoveryDescriptionView(),
            ),
          ),
          GoRoute(
            path: 'intro/phone/description/breath',
            name: RecoveryDeepBreathView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RecoveryDeepBreathView(),
            ),
          ),
          GoRoute(
            path: 'intro/phone/description/breath/small',
            name: RecoverySmallActionView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RecoverySmallActionView(),
            ),
          ),
          GoRoute(
            path: 'intro/phone/description/breath/small/complete',
            name: RecoveryCompleteView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RecoveryCompleteView(),
            ),
          ),
        ],
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
      // 웹뷰
      GoRoute(
        path: '/webView',
        name: PlanitWebView.routeName,
        builder: (context, state) => PlanitWebView(
          params: state.extra as WebViewParams,
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

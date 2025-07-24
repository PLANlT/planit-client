import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/routes/redirect_notifier.dart';
import 'package:planit/ui/common/const/web_view_params.dart';
import 'package:planit/ui/common/view/planit_web_view.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/login/login_view.dart';
import 'package:planit/ui/login/tos_view.dart';
import 'package:planit/ui/mypage/view/mypage_account_view.dart';
import 'package:planit/ui/mypage/view/mypage_customer_view.dart';
import 'package:planit/ui/mypage/view/mypage_view.dart';
import 'package:planit/ui/onboarding/onboarding_view.dart';
import 'package:planit/ui/plan/plan_create/plan_create_view.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_view.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';
import 'package:planit/ui/plan/plan_template/plan_teamplate_view.dart';
import 'package:planit/ui/plan/plan_template/plan_template.dart';
import 'package:planit/ui/plan/plan_template/plan_template_detail_view.dart';
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
    navigatorKey: rootNavigatorKey,
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
          GoRoute(
            path: 'plan',
            name: PlanView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: PlanView(), // Plan 목록이나 메인
            ),
            routes: [
              GoRoute(
                path: 'all/:isActive',
                name: PlanViewAll.routeName,
                pageBuilder: (context, state) {
                  final planList = state.extra as List<PlanModel>? ?? [];
                  final isActiveStr = state.pathParameters['isActive']!;
                  final isActive = bool.parse(isActiveStr);
                  return NoTransitionPage(
                      child: PlanViewAll(
                    planList: planList,
                    isActive: isActive,
                  ));
                },
              ),
              GoRoute(
                  path: 'detail/:planStatus/:planId',
                  name: 'plan_detail',
                  pageBuilder: (context, state) {
                    final planStatus = state.pathParameters['planStatus']!;
                    final planIdStr = state.pathParameters['planId']!;
                    final planId = int.parse(planIdStr);
                    return NoTransitionPage(
                      child: PlanDetailView(
                        planId: planId,
                        planStatus: planStatus,
                      ),
                    );
                  }),
              GoRoute(
                path: 'create',
                name: PlanCreateView.routeName,
                pageBuilder: (context, state) {
                  final planIdStr = state.uri.queryParameters['planId'];
                  final planId =
                      planIdStr != null ? int.tryParse(planIdStr) : null;
                  return NoTransitionPage(
                    child: PlanCreateView(planId: planId), // null 허용
                  );
                },
              ),
              GoRoute(
                  path: 'template/:templateName',
                  name: PlanTeamplateView.routeName,
                  pageBuilder: (context, state) {
                    final templateName = state.pathParameters['templateName']!;
                    return NoTransitionPage(
                      child: PlanTeamplateView(
                        templateName: templateName,
                      ),
                    );
                  }),
              GoRoute(
                  path: 'templateDetail',
                  name: PlanTemplateDetailView.routeName,
                  pageBuilder: (context, state) {
                    final templateDetail = state.extra as PlanTemplateDetail;
                    return NoTransitionPage(
                        child: PlanTemplateDetailView(
                            templateDetai: templateDetail));
                  }),
            ],
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
            path: 'tos',
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

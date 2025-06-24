import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_router_interceptor.dart';

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final appRouterInterceptor = AppRouterInterceptor(ref: ref);

  return GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Internal Error'),
      ),
    ),
    redirect: (context, state) => appRouterInterceptor.redirect(context, state),
    routes: [],
  );
});

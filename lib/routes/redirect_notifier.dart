import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/service/app/app_state.dart';

import '../service/app/app_service.dart';

final redirectNotifierProvider = ChangeNotifierProvider<RedirectNotifier>(
  (ref) => RedirectNotifier(ref: ref),
);

// AppState가 변경되면 router가 refresh되게 합니다
class RedirectNotifier extends ChangeNotifier {
  final Ref _ref;

  RedirectNotifier({
    required Ref<Object?> ref,
  }) : _ref = ref {
    // AppState의 isSignedIn 변경 감지
    _ref.listen(
      appServiceProvider.select((AppState value) => value.isSignedIn),
      (bool? previous, bool next) {
        // 값이 변경되면 GoRouter 초기화되도록 알림
        if (previous != next) {
          notifyListeners();
        }
      },
    );
  }
}

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
    _ref.listen(
        appServiceProvider.select((AppState value) => value.isSignedIn),
        (bool? previous, bool next) {
      notifyListeners();
    });
  }
}

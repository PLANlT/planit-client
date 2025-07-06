import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/ui/mypage/mypage_state.dart';

final AutoDisposeStateNotifierProvider<MypageViewModel, MypageState>
    mypageViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => MypageViewModel(),
);

class MypageViewModel extends StateNotifier<MypageState> {
  MypageViewModel() : super(MypageState());

  void initMypage() {
    if (mounted) {
      state = state.copyWith(
        userName: '플래닛',
        userEmail: 'planit@plan.it',
        currentConsecutiveDays: 10,
        maxConsecutiveDays: 20,
        perfectConsecutiveDays: 2,
        appVersion: 'v1.0.0',
        isSystemPushAccept: false,
      );
    }
  }

  void initAccountPage() {
    if (mounted) {
      state = state.copyWith(
        registrationDate: '2025.07.06',
        oAuthType: 'Google',
      );
    }
  }

  void toggleTaskAlarm(bool newStatus) {
    if (mounted) {
      state = state.copyWith(isTaskPushAccept: newStatus);
    }
  }

  void toggleGuiltyFreeAlarm(bool newStatus) {
    if (mounted) {
      state = state.copyWith(isGuiltyFreePushAccept: newStatus);
    }
  }
}

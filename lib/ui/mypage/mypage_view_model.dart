import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/ui/mypage/mypage_state.dart';

final AutoDisposeStateNotifierProvider<MypageViewModel, MypageState>
    mypageViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => MypageViewModel(),
);

class MypageViewModel extends StateNotifier<MypageState> {
  MypageViewModel() : super(MypageState());

  void init() {
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

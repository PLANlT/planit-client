import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/mypage/component/planit_alarm_allow_widget.dart';
import 'package:planit/ui/mypage/component/system_alarm_allow_widget.dart';
import 'package:planit/ui/mypage/mypage_state.dart';
import 'package:planit/ui/mypage/mypage_view_model.dart';

class MypageAlarmView extends HookConsumerWidget {
  const MypageAlarmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MypageViewModel viewModel = ref.read(
      mypageViewModelProvider.notifier,
    );
    final MypageState state = ref.watch(mypageViewModelProvider);

    return DefaultLayout(
        title: '알림 설정',
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20.0),
          child: Column(
            spacing: 20.0,
            children: [
              // 시스템 알림 미동의 상태에만 구좌 노출
              if (!state.isSystemPushAccept)
                SystemAlarmAllowWidget(
                  onButtonTap: () {},
                ),
              PlanitAlarmAllowWidget(
                title: '오늘의 할 일',
                isAllowed: state.isTaskPushAccept,
                onToggle: (bool newStatus) => viewModel.toggleTaskAlarm(
                  newStatus,
                ),
              ),
              PlanitAlarmAllowWidget(
                title: '길티프리 모드',
                isAllowed: state.isGuiltyFreePushAccept,
                onToggle: (bool newStatus) => viewModel.toggleGuiltyFreeAlarm(
                  newStatus,
                ),
              ),
            ],
          ),
        ));
  }
}

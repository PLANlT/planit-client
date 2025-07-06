import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/ui/mypage/view/mypage_alarm_view.dart';

import '../../common/comopnent/planit_toast.dart';
import '../../common/view/default_layout.dart';
import '../component/mypage_bottom_info_widget.dart';
import '../component/mypage_menu_button_widget.dart';
import '../component/user_account_info_widget.dart';
import '../component/user_consecutive_days_widget.dart';
import '../mypage_state.dart';
import '../mypage_view_model.dart';

class MypageView extends HookConsumerWidget {
  const MypageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MypageViewModel viewModel = ref.read(
      mypageViewModelProvider.notifier,
    );
    final MypageState state = ref.watch(mypageViewModelProvider);

    final toast = FToast().init(context);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.initMypage();
      });
      return null;
    }, []);

    useEffect(() {
      if (state.errorMessage.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          toast.showToast(child: PlanitToast(label: state.errorMessage));
        });
      }
      return null;
    }, [state.errorMessage]);

    return DefaultLayout(
      title: '마이페이지',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20.0),
            child: Column(
              spacing: 40.0,
              children: [
                UserAccountInfoWidget(
                  userName: state.userName,
                  userEmail: state.userEmail,
                ),
                UserConsecutiveDaysWidget(
                  currentConsecutiveDays: state.currentConsecutiveDays,
                  maxConsecutiveDays: state.maxConsecutiveDays,
                  perfectConsecutiveDays: state.perfectConsecutiveDays,
                ),
                Column(
                  spacing: 12.0,
                  children: [
                    MypageMenuButtonWidget(
                      label: '앱 사용 가이드 보기',
                      onTap: () {},
                    ),
                    MypageMenuButtonWidget(
                      label: '알림 설정',
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MypageAlarmView(),
                        ),
                      ),
                    ),
                    MypageMenuButtonWidget(
                      label: '고객 문의',
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          MypageBottomInfoWidget(
            appVersion: state.appVersion,
          ),
        ],
      ),
    );
  }
}

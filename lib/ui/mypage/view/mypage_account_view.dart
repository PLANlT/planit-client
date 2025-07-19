import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/mypage/component/account_info_widget.dart';
import 'package:planit/ui/mypage/component/account_name_widget.dart';

import '../mypage_state.dart';
import '../mypage_view_model.dart';

class MypageAccountView extends HookConsumerWidget {
  const MypageAccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MypageState state = ref.watch(mypageViewModelProvider);

    return DefaultLayout(
      title: '계정 관리',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20.0),
        child: Column(
          spacing: 40.0,
          children: [
            // 닉네임
            AccountNameWidget(
              userName: state.userName,
            ),
            // 계정
            AccountInfoWidget(
              userEmail: state.registrationDate,
              oAuthType: state.oAuthType,
              registrationDate: state.registrationDate,
            ),
            // 버튼
            Column(
              spacing: 12.0,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () {},
                    buttonColor: PlanitButtonColor.black,
                    buttonSize: PlanitButtonSize.large,
                    label: '로그아웃',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () {},
                    buttonColor: PlanitButtonColor.red,
                    buttonSize: PlanitButtonSize.large,
                    label: '회원탈퇴',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

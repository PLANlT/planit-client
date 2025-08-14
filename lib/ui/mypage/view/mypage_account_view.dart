import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/mypage/component/account_info_widget.dart';

import '../mypage_state.dart';
import '../mypage_view_model.dart';

class MypageAccountView extends HookConsumerWidget {
  static String get routeName => 'account';

  const MypageAccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MypageViewModel viewModel = ref.read(
      mypageViewModelProvider.notifier,
    );
    final MypageState state = ref.watch(mypageViewModelProvider);

    return DefaultLayout(
      title: '계정 관리',
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20.0),
            child: Column(
              spacing: 40.0,
              children: [
                // 계정
                AccountInfoWidget(
                  userName: state.userName,
                  userEmail: state.userEmail,
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
                        onPressed: () => viewModel.signOut(),
                        buttonColor: PlanitButtonColor.black,
                        buttonSize: PlanitButtonSize.large,
                        label: '로그아웃',
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PlanitButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => PlanitBottomSheet(
                              content: Padding(
                                padding: EdgeInsetsGeometry.only(
                                  top: 16.0,
                                  bottom: 24.0,
                                ),
                                child: Column(
                                  children: [
                                    PlanitText(
                                      '정말 회원 탈퇴를 진행할까요?',
                                      style: PlanitTypos.title3.copyWith(
                                        color: PlanitColors.red,
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    BottomSheetBtn(
                                      label: '네, 진행할게요',
                                      onTap: viewModel.withdraw,
                                      labelColor: PlanitColors.red,
                                    ),
                                    Divider(
                                      color: PlanitColors.white03,
                                      height: 0.5,
                                    ),
                                    BottomSheetBtn(
                                      label: '아니오',
                                      onTap: context.pop,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
          if (state.loadingStatus == LoadingStatus.loading)
            Center(
              child: PlanitLoading(),
            ),
        ],
      ),
    );
  }
}

class BottomSheetBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color labelColor;

  const BottomSheetBtn({
    super.key,
    required this.label,
    required this.onTap,
    this.labelColor = PlanitColors.black01,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: PlanitColors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        child: PlanitText(
          label,
          style: PlanitTypos.body2.copyWith(
            color: labelColor,
          ),
        ),
      ),
    );
  }
}

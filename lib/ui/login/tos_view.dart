import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/const/planit_urls.dart';
import 'package:planit/ui/common/const/web_view_params.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/planit_web_view.dart';

import '../common/comopnent/planit_checkbox.dart';
import '../common/view/root_tab.dart';
import 'login_state.dart';
import 'login_view_model.dart';

class TosView extends HookConsumerWidget {
  static String get routeName => 'tos';

  const TosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginViewModel viewModel = ref.read(loginViewModelProvider.notifier);
    final LoginState state = ref.watch(loginViewModelProvider);

    useEffect(() {
      if (state.isLoginCompleted != null) {
        // 로그인이 완료되었다면 루트탭으로 이동
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.goNamed(RootTab.routeName);
          viewModel.routingRefresh();
        });
      }
      return null;
    }, [state.isLoginCompleted]);

    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
          bottom: 100.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            PlanitText(
              '서비스 약관에\n동의해주세요',
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              decoration: BoxDecoration(
                color: PlanitColors.white02,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                spacing: 12.0,
                children: [
                  _CheckRow(
                    text: '서비스 이용약관',
                    isChecked: state.isTermOfInfoAgreed,
                    onCheckTap: () => viewModel.agreeTermOfInfo(),
                    onChevronTap: () => context.pushNamed(
                      PlanitWebView.routeName,
                      extra: WebViewParams(
                        title: '서비스 이용약관',
                        url: PlanitUrls.termOfUse,
                      ),
                    ),
                  ),
                  _CheckRow(
                    text: '개인정보처리방침',
                    isChecked: state.isTermOfUseAgreed,
                    onCheckTap: () => viewModel.agreeTermOfUse(),
                    onChevronTap: () => context.pushNamed(
                      PlanitWebView.routeName,
                      extra: WebViewParams(
                        title: '개인정보처리방침',
                        url: PlanitUrls.termOfInfo,
                      ),
                    ),
                  ),
                  _CheckRow(
                    text: '개인정보 수집 및 이용',
                    isChecked: state.isTermOfPrivacyAgreed,
                    onCheckTap: () => viewModel.agreeTermOfPrivacy(),
                    onChevronTap: () => context.pushNamed(
                      PlanitWebView.routeName,
                      extra: WebViewParams(
                        title: '개인정보 수집 및 이용',
                        url: PlanitUrls.termOfPrivacy,
                      ),
                    ),
                  ),
                  _CheckRow(
                    text: '개인정보 제3자 동의 이용',
                    isChecked: state.isThirdPartyAdConsent,
                    onCheckTap: () => viewModel.agreeThirdPartyAdConsent(),
                    onChevronTap: () => context.pushNamed(
                      PlanitWebView.routeName,
                      extra: WebViewParams(
                        title: '개인정보 제3자 동의 이용',
                        url: PlanitUrls.thirdPartyConsent,
                      ),
                    ),
                  ),
                  _CheckRow(
                    text: '만 14세 이상입니다',
                    isChecked: state.isAgeRestrictionAgreed,
                    onCheckTap: () => viewModel.agreeAgeRestriction(),
                    onChevronTap: () => {},
                    showChevron: false,
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () => viewModel.appSignUp(),
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '가입 완료',
                enabled: state.isAgeRestrictionAgreed &&
                    state.isTermOfPrivacyAgreed &&
                    state.isThirdPartyAdConsent &&
                    state.isTermOfUseAgreed &&
                    state.isTermOfInfoAgreed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  final String text;
  final bool isChecked;
  final VoidCallback onCheckTap;
  final VoidCallback onChevronTap;
  final bool showChevron;

  const _CheckRow({
    required this.text,
    required this.isChecked,
    required this.onCheckTap,
    required this.onChevronTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onCheckTap,
              child: PlanitCheckbox(
                isChecked: isChecked,
              ),
            ),
            SizedBox(width: 12.0),
            PlanitText(
              text,
              style: PlanitTypos.body3.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            PlanitText(
              '*',
              style: PlanitTypos.body3.copyWith(
                color: PlanitColors.alert,
              ),
            ),
          ],
        ),
        if (showChevron)
          GestureDetector(
            onTap: onChevronTap,
            child: SvgPicture.asset(
              Assets.chevronRight,
              width: 24.0,
              height: 24.0,
            ),
          ),
      ],
    );
  }
}

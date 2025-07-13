import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/login/login_state.dart';
import 'package:planit/ui/login/login_view_model.dart';

import '../common/assets.dart';
import 'component/login_buttons.dart';

class LoginView extends HookConsumerWidget {
  static String get routeName => 'login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginViewModel viewModel = ref.read(loginViewModelProvider.notifier);
    final LoginState state = ref.watch(loginViewModelProvider);

    return DefaultLayout(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Spacer(),
                PlanitText(
                  'PLANIT',
                  style: PlanitTypos.blackHansSansRegular48.copyWith(
                    color: PlanitColors.black01,
                  ),
                ),
                SizedBox(height: 20.0),
                PlanitText(
                  '그냥 딱 한 걸음만,\n오늘은 그걸로 충분해요',
                  textAlign: TextAlign.center,
                  style: PlanitTypos.body1.copyWith(
                    color: PlanitColors.black01,
                  ),
                ),
                SizedBox(height: 60.0),
                SvgPicture.asset(Assets.mascotLogin),
                SizedBox(height: 60.0),
                // 로그인 버튼
                Column(
                  spacing: 12.0,
                  children: [
                    GoogleButton(
                      onPressed: () => viewModel.googleLogin,
                    ),
                    KakaoButton(
                      onPressed: () => viewModel.kakaoLogin(),
                    ),
                    NaverButton(
                      onPressed: () => viewModel.naverLogin(),
                    ),
                  ],
                ),
                Spacer(),
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

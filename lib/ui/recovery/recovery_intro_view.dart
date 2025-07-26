import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/recovery/recovery_stop_phone_view.dart';

class RecoveryIntroView extends StatelessWidget {
  static String get routeName => 'intro';

  const RecoveryIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20.0,
          right: 20.0,
          bottom: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            PlanitText(
              '할 일 시작이\n어려우신가요?',
              textAlign: TextAlign.center,
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            Spacer(),
            SvgPicture.asset(Assets.mascotThinking),
            Spacer(),
            PlanitText(
              '그럴 땐 억지로 밀어붙이지 말고,\n가볍게 몸과 마음부터 깨워볼까요?',
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black02,
              ),
            ),
            Spacer(),
            // Buttons
            Column(
              spacing: 20.0,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () => context.goNamed(
                      RecoveryStopPhoneView.routeName,
                    ),
                    buttonColor: PlanitButtonColor.black,
                    buttonSize: PlanitButtonSize.large,
                    label: '회복 루틴 시작',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () => Navigator.of(context).pop(),
                    buttonColor: PlanitButtonColor.white,
                    buttonSize: PlanitButtonSize.large,
                    label: '닫기',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

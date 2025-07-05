import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/ui/recovery/recovery_description_view.dart';

import '../../theme/planit_colors.dart';
import '../../theme/planit_typos.dart';
import '../common/assets.dart';
import '../common/comopnent/planit_button.dart';
import '../common/comopnent/planit_text.dart';
import '../common/const/planit_button_style.dart';
import '../common/view/default_layout.dart';

class RecoveryStopPhoneView extends StatelessWidget {
  const RecoveryStopPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '회복 루틴',
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 40.0,
        ),
        child: Column(
          children: [
            PlanitText(
              '우선,\n화면에서 눈을 떼볼게요',
              textAlign: TextAlign.center,
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            Spacer(),
            SvgPicture.asset(Assets.imgRecoveryRoutinePhone),
            Spacer(),
            PlanitText(
              '계속 폰을 들여다보면\n현실과의 감각이 조금씩 멀어져요.\n지금은 내 몸과 마음에 잠시 집중할 시간이에요.',
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black02,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecoveryDescriptionView(),
                  ),
                ),
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '다음',
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';

import 'guilty_free_reason_view.dart';

class GuiltyFreeIntroView extends StatelessWidget {
  const GuiltyFreeIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '길티프리 모드',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ).copyWith(top: 20.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlanitText(
              '길티프리 모드를 시작할까요?',
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              Assets.mascotSleeping,
            ),
            Spacer(),
            PlanitText(
              '길티프리 모드는 죄책감 없이\n스스로를 쉴 수 있게 도와주는 기능이에요.',
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black03,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: PlanitColors.white02,
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              margin: EdgeInsetsGeometry.only(top: 20.0),
              child: Column(
                spacing: 4.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlanitText(
                    '✅ 연속일이 끊어지는 것을 방지할 수 있어요.',
                    style: PlanitTypos.body2.copyWith(
                      color: PlanitColors.black02,
                    ),
                  ),
                  PlanitText(
                    '✅ 주 1회만 사용 가능해요.',
                    style: PlanitTypos.body2.copyWith(
                      color: PlanitColors.black02,
                    ),
                  ),
                  PlanitText(
                    '✅ 할 일 알림이 오지 않아요.',
                    style: PlanitTypos.body2.copyWith(
                      color: PlanitColors.black02,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GuiltyFreeReasonView(),
                  ),
                ),
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '시작하기',
              ),
            )
          ],
        ),
      ),
    );
  }
}

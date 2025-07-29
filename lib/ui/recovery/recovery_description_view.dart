import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/recovery/recovery_deep_breath_view.dart';

import '../../theme/planit_colors.dart';
import '../../theme/planit_typos.dart';
import '../common/comopnent/planit_button.dart';
import '../common/comopnent/planit_text.dart';
import '../common/const/planit_button_style.dart';
import '../common/view/default_layout.dart';

class RecoveryDescriptionView extends StatelessWidget {
  static String get routeName => 'description';

  const RecoveryDescriptionView({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlanitText(
              '다시 시작할 힘을\n만드는 작은 루틴이에요',
              textAlign: TextAlign.center,
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            Spacer(),
            // 회복 루틴 단계 설정
            Column(
              spacing: 12.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _TextBox(
                  title: '숨 고르기',
                  time: '1분',
                ),
                SvgPicture.asset(Assets.chevronDown),
                _TextBox(
                  title: '작은 행동',
                  time: '2분',
                ),
              ],
            ),
            Spacer(),
            PlanitText(
              '3분 동안 따라만 와주세요.\n해야 할 일을 피하지 않게,\n당신을 부드럽게 이끌어드릴게요.',
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black02,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () => context.goNamed(
                  RecoveryDeepBreathView.routeName,
                ),
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '시작하기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  final String title;
  final String time;

  const _TextBox({
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(20.0),
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlanitText(
            title,
            style: PlanitTypos.title3.copyWith(
              color: PlanitColors.black01,
            ),
          ),
          PlanitText(
            time,
            style: PlanitTypos.title3.copyWith(
              color: PlanitColors.black01,
            ),
          ),
        ],
      ),
    );
  }
}

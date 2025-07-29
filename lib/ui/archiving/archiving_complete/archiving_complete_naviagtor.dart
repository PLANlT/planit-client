import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/root_tab.dart';

class ArchivingCompleteNavigator extends StatelessWidget {
  static String get routeName => 'archiving-complete-navigator';
  final String icon;
  final String title;

  const ArchivingCompleteNavigator(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: PlanitColors.white02,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    height: 276,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('$icon.svg'),
                        const SizedBox(height: 8),
                        PlanitText(title, style: PlanitTypos.title2),
                        PlanitText(
                          '${DateFormat('yyyy-MM-dd').format(DateTime.now())} 완료',
                          style: PlanitTypos.body3.copyWith(
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PlanitText(
                  '이 플랜은 아카이브에 저장되었어요.',
                  style: PlanitTypos.body2.copyWith(
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 32,
            child: Column(
              spacing: 12,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () {
                      context.pushNamed(RootTab.routeName);
                    },
                    buttonColor: PlanitButtonColor.black,
                    buttonSize: PlanitButtonSize.large,
                    label: '아카이브에서 내 행성 보기',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () {
                      context.pushNamed(RootTab.routeName);
                    },
                    buttonColor: PlanitButtonColor.white,
                    buttonSize: PlanitButtonSize.large,
                    label: '홈으로 돌아가기',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

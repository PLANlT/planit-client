import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_main/archiving_view.dart';
import 'package:planit/ui/archiving/archiving_restart/archiving_restart_view_model.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';

class ArchivingCompleteNavigator extends StatelessWidget {
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
                          '${DateTime.now().toIso8601String().substring(0, 10)} 완료',
                          style: PlanitTypos.body3
                              .copyWith(color: Color(0xFF666666)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PlanitText(
                  '이 플랜은 아카이브에 저장되었어요.',
                  style: PlanitTypos.body2.copyWith(color: Color(0xFF666666)),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 32,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RootTab();
                      }));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RootTab();
                      }));
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

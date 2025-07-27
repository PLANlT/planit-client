import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_complete/archiving_complete_naviagtor.dart';
import 'package:planit/ui/archiving/archiving_main/archiving_view.dart';
import 'package:planit/ui/archiving/archiving_restart/archiving_restart_view_model.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';

class ArchivingCompleteView extends StatelessWidget {
  final String icon;
  final String title;
  const ArchivingCompleteView(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return DefaultLayout(
      child: Stack(
        children: [
          // running 이미지 (밑에)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/mascots/restart.svg',
                width: deviceWidth - 48, // 좌우 padding 고려
                fit: BoxFit.contain,
              ),
            ),
          ),

          // PlaniT 로고 (위에)
          Positioned(
            top: 96,
            left: 24,
            right: 24,
            child: PlanitText(
              'PLAN\nIT!',
              style: PlanitTypos.blackHansSansRegular120.copyWith(
                color: PlanitColors.black01,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // 버튼은 화면 아래에 고정
          Positioned(
            bottom: 80,
            left: 12,
            right: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ArchivingCompleteNavigator(icon: icon, title: title);
                  }));
                },
                child: Container(
                    decoration: BoxDecoration(color: PlanitColors.white02),
                    width: double.infinity,
                    height: 103,
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlanitText('플랜 $title ', style: PlanitTypos.title2),
                        PlanitText('하나의 행성계를 이루었어요!', style: PlanitTypos.body2)
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

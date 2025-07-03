// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/custom_chip.dart';
import 'package:planit/ui/plan/component/plan_warp_grid.dart';

class PlanCreateView extends StatelessWidget {
  const PlanCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Column(
      children: [
        AppBar(
            backgroundColor: PlanitColors.transparent,
            title: PlanitText('내 플랜 만들기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ))),
        Column(
          spacing: 9.0,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText('플랜 제목',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: PlanitColors.black02)),
              ],
            ),
            SizedBox(
                width: 385,
                height: 52,
                child: PlanitTextField(
                  hintText: '당신의 목표는 무엇인가요?',
                )),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText('다짐 문장',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: PlanitColors.black02)),
                PlanitText(' (20자 내)',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: PlanitColors.black02)),
              ],
            ),
            SizedBox(
                width: 385,
                height: 52,
                child: PlanitTextField(
                  hintText: '이 플랜을 지속할 수 있는 요소가 있나요?',
                )),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText('행성 아이콘 선택',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: PlanitColors.black02)),
              ],
            ),
            PlanetWrapGrid(),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText('목표일 설정',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: PlanitColors.black02)),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                GestureDetector(
                    onTap: () {
                      //DatePickerUI 구현
                    },
                    child: PlanCreateChip(
                      bordercolor: PlanitColors.black03,
                      title: '25.05.01',
                      textcolor: PlanitColors.black03,
                      backgroundcolor: PlanitColors.white01,
                    )),
                PlanitText('까지 | D-',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: PlanitColors.black03)),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText('플랜 진행 여부',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: PlanitColors.black02)),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitChip(chipColor: PlanitChipColor.black, label: '진행 중'),
                SizedBox(
                  width: 10,
                ),
                PlanitChip(chipColor: PlanitChipColor.gray, label: '중단'),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 370,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(37.0),
                    color: PlanitColors.black01),
                child: Center(
                  child: PlanitText(
                    '플랜 만들기',
                    style: PlanitTypos.body3.copyWith(
                      color: PlanitColors.white01,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

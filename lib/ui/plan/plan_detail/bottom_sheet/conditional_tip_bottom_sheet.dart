import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/plan/component/condition_tip_table_row.dart';

class ConditionTipBottomSheet extends StatelessWidget {
  const ConditionTipBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanitBottomSheet(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanitText(
              '컨디션을 정하는 팁?',
              style: PlanitTypos.title2.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            SizedBox(height: 32),
            PlanitChip(
              chipColor: PlanitChipColor.gray,
              label: '🔥 힘이 넘칠 때',
            ),
            SizedBox(height: 12),
            PlanitText(
              '플랜의 핵심 목표 달성을 위한 기본 루틴이에요.',
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black02,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: PlanitColors.white02,
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              width: double.infinity,
              child: Column(
                spacing: 10,
                children: [
                  ConditionTipTableRow(left: '자기소개서 플랜', right: '도입부 1차 완성'),
                  ConditionTipTableRow(left: '운동 플랜', right: '근력운동 30분'),
                  ConditionTipTableRow(left: '취업 플랜', right: '포트폴리오 항목 1개 정리'),
                ],
              ),
            ),
            SizedBox(height: 32),
            PlanitChip(
              chipColor: PlanitChipColor.gray,
              label: '💧 지쳤을 때',
            ),
            SizedBox(height: 12),
            PlanitText(
              '본격적으로 플랜을 진행할 때 첫 시작이 버겁죠.\n시작의 문을 여는 일을 적으면 좋아요',
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black02,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: PlanitColors.white02,
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              width: double.infinity,
              child: Column(
                spacing: 10,
                children: [
                  ConditionTipTableRow(left: '자기소개서 플랜', right: '항목 별 키워드만 정리'),
                  ConditionTipTableRow(left: '운동 플랜', right: '스트레칭 5분'),
                  ConditionTipTableRow(left: '취업 플랜', right: '지원 기업 리스트 적기'),
                ],
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '닫기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

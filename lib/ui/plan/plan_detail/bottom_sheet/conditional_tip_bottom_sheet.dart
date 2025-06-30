import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/plan/component/condition_tip_table_row.dart';

class ConditionTipBottomSheet extends StatelessWidget {
  const ConditionTipBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanitBottomSheet(
      height: 760.0,
      content: Column(
        spacing: 8.0,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 32),
            child: Row(
              children: [
                PlanitText('컨디션을 정하는 팁?', style: PlanitTypos.title2),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 32),
            child: Row(
              children: [
                PlanitChip(
                  chipColor: PlanitChipColor.gray,
                  label: '🔥 힘이 넘칠 때',
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 12),
            child: Row(
              children: [
                PlanitText('플랜의 핵심 목표 달성을 위한 기본 루틴이에요.',
                    style:
                        PlanitTypos.body2.copyWith(color: PlanitColors.black02))
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: PlanitColors.white02,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  conditionTipTableRow('자기소개서 플랜', '도입부 1차 완성'),
                  conditionTipTableRow('운동 플랜', '근력운동 30분'),
                  conditionTipTableRow('취업 플랜', '포트폴리오 항목 1개 정리'),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 32),
            child: Row(
              children: [
                PlanitChip(
                  chipColor: PlanitChipColor.gray,
                  label: '💧 지쳤을 때',
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 4),
            child: Row(
              children: [
                PlanitText('본격적으로 플랜을 진행할 때 첫 시작이 버겁죠.\n시작의 문을 여는 일을 적으면 좋아요',
                    style:
                        PlanitTypos.body2.copyWith(color: PlanitColors.black02))
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: PlanitColors.white02,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  conditionTipTableRow('자기소개서 플랜', '항목 별 키워드만 정리'),
                  conditionTipTableRow('운동 플랜', '스트레칭 5분'),
                  conditionTipTableRow('취업 플랜', '지원 기업 리스트 적기'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(36.0),
                      color: PlanitColors.black01),
                  child: Center(
                    child: PlanitText(
                      '닫기',
                      style: PlanitTypos.body3.copyWith(
                        color: PlanitColors.white01,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

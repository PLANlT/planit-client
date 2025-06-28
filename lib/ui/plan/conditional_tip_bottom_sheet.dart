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
      height: 750.0,
      content: Column(
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
              PlanitText('컨디션을 정하는 팁?',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20
              ),
              PlanitChip(
                chipColor: PlanitChipColor.gray,
                label: '🔥 힘이 넘칠 때',
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitText('플랜의 핵심 목표 달성을 위한 기본 루틴이에요.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: PlanitColors.black02))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: PlanitColors.white02,
            ),
            width: 380,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                conditionTipTableRow('자기소개서 플랜', '도입부 1차 완성'),
                conditionTipTableRow('운동 플랜', '근력운동 30분'),
                conditionTipTableRow('취업 플랜', '포트폴리오 항목 1개 정리'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitChip(
                chipColor: PlanitChipColor.gray,
                label: '💧 지쳤을 때',
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitText('본격적으로 플랜을 진행할 때 첫 시작이 버겁죠.\n시작의 문을 여는 일을 적으면 좋아요',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: PlanitColors.black02))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: PlanitColors.white02,
            ),
            width: 380,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                conditionTipTableRow('자기소개서 플랜', '항목 별 키워드만 정리'),
                conditionTipTableRow('운동 플랜', '스트레칭 5분'),
                conditionTipTableRow('취업 플랜', '지원 기업 리스트 적기'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 370,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(37.0),
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
        ],
      ),
    );
  }
}


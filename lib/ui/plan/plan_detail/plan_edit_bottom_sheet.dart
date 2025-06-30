import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_toggle.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/plan/plan_detail/conditional_tip_bottom_sheet.dart';



class PlanEditBottomSheet extends StatefulWidget {
  const PlanEditBottomSheet({super.key});

  @override
  State<PlanEditBottomSheet> createState() => _PlanEditBottomSheetState();
}

class _PlanEditBottomSheetState extends State<PlanEditBottomSheet> {
  final Set<int> selectedDayIndexes = {};
  final Set<String> selectedConditions = {};
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return PlanitBottomSheet(
      height: 605.0,
      content: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitText('루틴 설정',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitText('반복 요일',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: PlanitColors.black03)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(7, (index) {
              final isSelected = selectedDayIndexes.contains(index);
              const days = ['월', '화', '수', '목', '금', '토', '일'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedDayIndexes.remove(index);
                    } else {
                      selectedDayIndexes.add(index);
                    }
                  });
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      isSelected ? PlanitColors.black01 : PlanitColors.white02,
                  child: PlanitText(days[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? PlanitColors.white01
                            : PlanitColors.black02,
                      )),
                ),
              );
            }),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitText('시간 설정',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: PlanitColors.black03)),
              SizedBox(
                width: 10,
              ),
              PlanitToggle(
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  isOn: isSwitched)
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: PlanitColors.white02),
                width: 55,
                height: 40,
                child: Center(
                  child: PlanitText('8:00',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: PlanitColors.black04)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              PlanitText('이 할일은 어떤 컨디션일때 하기 좋아요?',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: PlanitColors.black03)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedConditions.contains('힘이 넘칠 때')) {
                      selectedConditions.remove('힘이 넘칠 때');
                    } else {
                      selectedConditions.add('힘이 넘칠 때');
                    }
                  });
                },
                child: PlanitChip(
                  chipColor: selectedConditions.contains('힘이 넘칠 때')
                      ? PlanitChipColor.black
                      : PlanitChipColor.gray,
                  label: '🔥 힘이 넘칠 때',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedConditions.contains('지쳤을 때')) {
                      selectedConditions.remove('지쳤을 때');
                    } else {
                      selectedConditions.add('지쳤을 때');
                    }
                  });
                },
                child: PlanitChip(
                  chipColor: selectedConditions.contains('지쳤을 때')
                      ? PlanitChipColor.black
                      : PlanitChipColor.gray,
                  label: '💧 지쳤을 때',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PlanitColors.transparent,
                  border: Border.all(
                    color: PlanitColors.black03,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: PlanitText('?',
                      style: TextStyle(
                          color: PlanitColors.black03,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => ConditionTipBottomSheet(),
                  );
                },
                child: PlanitText('컨디션을 정하는 팁',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: PlanitColors.black03)),
              ),
            ],
          ),
          SizedBox(
            height: 90,
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
                  '저장',
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_chips.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_toggle.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class PlanDetailView extends StatelessWidget {
  const PlanDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'title': '아침 식단 기록하기',
        'iconPaths': ['assets/icons/high.svg', 'assets/icons/low.svg'],
      },
      {
        'title': '30분 산책하기',
        'iconPaths': ['assets/icons/low.svg'],
      },
      {
        'title': '저녁 과식 피하기',
        'iconPaths': ['assets/icons/high.svg'],
      },
    ];
    return DefaultLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
        ),
        SvgPicture.asset(
          'assets/planets/planet1.svg',
          width: 119,
          height: 119,
        ),
        SizedBox(
          height: 20,
        ),
        PlanitText('다이어트',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
        SizedBox(
          height: 10,
        ),
        PlanitText('매일 조금씩, 꾸준히 나아가자',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: PlanitColors.black03)),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 500,
          height: 300,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: todoCard(
                      title: item['title'], iconPaths: item['iconPaths']),
                );
              }),
        )
      ],
    ));
  }
}

class todoCard extends StatelessWidget {
  final String title;
  final List<String> iconPaths;

  const todoCard({super.key, required this.title, required this.iconPaths});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: PlanitColors.white02),
        width: 320,
        height: 56,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: PlanitText(title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            for (var iconPath in iconPaths)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SvgPicture.asset(iconPath, width: 20, height: 20),
              ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return PlanMoreBottomSheet();
                    },
                  );
                },
                child: SvgPicture.asset('assets/icons/more.svg')),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class PlanMoreBottomSheet extends StatelessWidget {
  const PlanMoreBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanitBottomSheet(
      height: 237.0,
      content: Column(
        spacing: 9.0,
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => PlanEditBottomSheet(),
              );
            },
            child: PlanitText('플랜 수정',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Divider(
            color: PlanitColors.white03,
          ),
          PlanitText('플랜 삭제',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: PlanitColors.alert)),
          Divider(
            color: PlanitColors.white03,
          ),
          PlanitText('🎉 목표 달성하기 🎉',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}

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
                child: PlanitChips(
                  chipsColor: selectedConditions.contains('힘이 넘칠 때')
                      ? PlanitChipsColor.black
                      : PlanitChipsColor.gray,
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
                child: PlanitChips(
                  chipsColor: selectedConditions.contains('지쳤을 때')
                      ? PlanitChipsColor.black
                      : PlanitChipsColor.gray,
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
                  Navigator.pop(context);
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
                width: 20,
              ),
              PlanitChips(
                chipsColor: PlanitChipsColor.gray,
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
                _buildAlignedRow('자기소개서 플랜', '도입부 1차 완성'),
                _buildAlignedRow('운동 플랜', '근력운동 30분'),
                _buildAlignedRow('취업 플랜', '포트폴리오 항목 1개 정리'),
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
              PlanitChips(
                chipsColor: PlanitChipsColor.gray,
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
                _buildAlignedRow('자기소개서 플랜', '항목 별 키워드만 정리'),
                _buildAlignedRow('운동 플랜', '스트레칭 5분'),
                _buildAlignedRow('취업 플랜', '지원 기업 리스트 적기'),
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

Widget _buildAlignedRow(String left, String right) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Table(
      columnWidths: {
        0: FlexColumnWidth(4),
        1: FixedColumnWidth(4),
        2: FlexColumnWidth(6),
      },
      children: [
        TableRow(children: [
          PlanitText(
            left,
            style: TextStyle(
              color: PlanitColors.black03,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right_sharp,
                size: 18,
                color: PlanitColors.black03,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: PlanitText(
              right,
              style: TextStyle(
                color: PlanitColors.black03,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ],
    ),
  );
}

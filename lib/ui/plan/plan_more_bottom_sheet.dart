
import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_edit_bottom_sheet.dart';

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

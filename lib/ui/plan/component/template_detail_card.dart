import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_more/plan_more_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_more/task_more_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_template/plan_template_detail_view.dart';

class TemplateDetailCard extends StatelessWidget {
  final String title;
  final String taskType;

  const TemplateDetailCard(
      {super.key, required this.title, required this.taskType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlanTemplateDetailView()));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: PlanitColors.white02),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PlanitText('다이어트', style: PlanitTypos.title3),
                      PlanitText('식단 + 운동 병행 플랜',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                SvgPicture.asset(Assets.chevronRight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_more/plan_more_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_more/task_more_bottom_sheet_view.dart';

class taskCard extends StatelessWidget {
  final String title;
  final String taskType;

  const taskCard({super.key, required this.title, required this.taskType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: PlanitColors.white02),
        width: double.infinity,
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: PlanitText(title, style: PlanitTypos.body3),
              ),
              if (taskType == 'ALL') //나중에 서버님들한테 taskType 뭐 있는 지 물어보기
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: SvgPicture.asset(Assets.high),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SvgPicture.asset(Assets.low),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: false,
                        builder: (context) {
                          return TaskMoreBottomSheetView();
                        },
                      );
                    },
                    child: SvgPicture.asset(Assets.more)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_more/task_more_bottom_sheet_view.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String taskType;
  final int taskId;
  final bool showMore;

  const TaskCard({
    super.key,
    required this.title,
    required this.taskId,
    required this.taskType,
    this.showMore = true,
  });

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: PlanitText(title, style: PlanitTypos.body3),
              ),
              if (taskType == 'ALL') ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: SvgPicture.asset(Assets.high),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: SvgPicture.asset(Assets.low),
                ),
              ] else if (taskType == 'SLOW') ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: SvgPicture.asset(Assets.low),
                ),
              ] else if (taskType == 'PASSIONATE') ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: SvgPicture.asset(Assets.high),
                ),
              ],
              if (showMore)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: false,
                        builder: (context) {
                          return TaskMoreBottomSheetView(
                            taskId: taskId,
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(Assets.more),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

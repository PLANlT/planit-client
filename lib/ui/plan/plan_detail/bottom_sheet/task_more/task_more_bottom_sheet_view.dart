import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_edit/task_edit_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_more/task_more_bottom_sheet_view_model.dart';

class TaskMoreBottomSheetView extends HookConsumerWidget {
  final int taskId;
  const TaskMoreBottomSheetView({
    super.key,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TaskMoreBottomSheetViewModel viewmodel =
        ref.read(taskMoreBottomSheetViewModelProvider(taskId).notifier);
    return Wrap(children: [
      PlanitBottomSheet(
        content: Column(
          spacing: 8.0,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => TaskEditBottomSheetView(
                      taskId: taskId,
                    ),
                  );
                },
                child: PlanitText('수정', style: PlanitTypos.body2),
              ),
            ),
            Divider(
              color: PlanitColors.white03,
            ),
            GestureDetector(
              onTap: () {
                viewmodel.clickDeleteTask();
              },
              child: PlanitText('삭제',
                  style: PlanitTypos.body2.copyWith(color: PlanitColors.alert)),
            )
          ],
        ),
      ),
    ]);
  }
}

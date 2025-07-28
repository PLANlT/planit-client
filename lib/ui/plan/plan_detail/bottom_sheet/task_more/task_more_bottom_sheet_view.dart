import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return Wrap(
      children: [
        PlanitBottomSheet(
          content: Column(
            children: [
              GestureDetector(
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
                // 터치 영역 확장 위해 흰색 컨테이너 사용
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: PlanitColors.white01,
                  child: PlanitText(
                    '할 일 상세 설정',
                    style: PlanitTypos.body2.copyWith(
                      color: PlanitColors.black01,
                    ),
                  ),
                ),
              ),
              Divider(
                color: PlanitColors.white03,
              ),
              GestureDetector(
                onTap: () async {
                  final result = await viewmodel.clickDeleteTask();
                  if (!context.mounted) return;
                  if (result) {
                    context.pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('삭제에 실패했어요.')),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: PlanitColors.white01,
                  child: PlanitText(
                    '삭제',
                    style: PlanitTypos.body2.copyWith(
                      color: PlanitColors.alert,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

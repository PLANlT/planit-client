import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_edit/plan_edit_bottom_sheet_view.dart';

class TaskMoreBottomSheetView extends HookConsumerWidget {
  const TaskMoreBottomSheetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    builder: (context) => PlanEditBottomSheetView(),
                  );
                },
                child: PlanitText('수정', style: PlanitTypos.body2),
              ),
            ),
            Divider(
              color: PlanitColors.white03,
            ),
            PlanitText('삭제',
                style: PlanitTypos.body2.copyWith(color: PlanitColors.alert))
          ],
        ),
      ),
    ]);
  }
}

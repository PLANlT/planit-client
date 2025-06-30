import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_edit/plan_edit_bottom_sheet_view.dart';

class TaskMoreBottomSheetView extends HookConsumerWidget {
  const TaskMoreBottomSheetView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  
    return PlanitBottomSheet(
      height: 181.0,
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
                builder: (context) => PlanEditBottomSheetView(),
              );
            },
            child: PlanitText('수정',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Divider(
            color: PlanitColors.white03,
          ),
          PlanitText('삭제',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: PlanitColors.alert)),
        ],
      ),
    );
  }
}

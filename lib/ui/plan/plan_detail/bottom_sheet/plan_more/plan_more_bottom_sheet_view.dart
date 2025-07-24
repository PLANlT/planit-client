import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_create/plan_create_view.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_edit/task_edit_bottom_sheet_view.dart';

class PlanMoreBottomSheet extends HookConsumerWidget {
  final void Function(int planId) onClick;
  final int planId;
  final String planStatus;
  const PlanMoreBottomSheet(
      {super.key,
      required this.onClick,
      required this.planId,
      required this.planStatus});

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
                  context.pushNamed(
                    PlanCreateView.routeName,
                    queryParameters: {'planId': planId.toString()},
                  );
                },
                child: PlanitText('플랜 수정', style: PlanitTypos.body2),
              ),
            ),
            Divider(
              color: PlanitColors.white03,
            ),
            GestureDetector(
              onTap: () {
                onClick(planId);
                Navigator.pop(context);
              },
              child: PlanitText(
                '플랜 삭제',
                style: PlanitTypos.body2.copyWith(color: PlanitColors.alert),
              ),
            ),
            Divider(
              color: PlanitColors.white03,
            ),
            PlanitText('🎉 목표 달성하기 🎉', style: PlanitTypos.body2)
          ],
        ),
      ),
    ]);
  }
}

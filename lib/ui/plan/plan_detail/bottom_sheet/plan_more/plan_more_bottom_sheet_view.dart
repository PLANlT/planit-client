import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_complete/archiving_complete_view.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/plan/plan_create/plan_create_view.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_more/plan_more_bottom_sheet_view_model.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';

class PlanMoreBottomSheet extends HookConsumerWidget {
  final int planId;
  final String planStatus;
  final String icon;
  final String title;
  const PlanMoreBottomSheet(
      {super.key,
      required this.title,
      required this.planId,
      required this.planStatus,
      required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(planMoreBottomSheetViewModelProvider.notifier);

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
              onTap: () async {
                final success = await viewmodel.clickDeletePlan(planId);
                if (!context.mounted) return;
                context.pushNamed(
                  RootTab.routeName,
                );
                if (success) {
                  Navigator.pop(context);
                } else {
                  final state = ref.read(planMoreBottomSheetViewModelProvider);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              child: PlanitText(
                '플랜 삭제',
                style: PlanitTypos.body2.copyWith(color: PlanitColors.alert),
              ),
            ),
            Divider(
              color: PlanitColors.white03,
            ),
            GestureDetector(
                onTap: () async {
                  final success = await viewmodel.clickCompletePlan(planId);
                  if (!context.mounted) return;

                  if (success) {
                    context.pushNamed(
                      ArchivingCompleteView.routeName,
                      pathParameters: {'title': title, 'icon': icon},
                    );
                  } else {
                    final state =
                        ref.read(planMoreBottomSheetViewModelProvider);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                child: PlanitText('🎉 목표 달성하기 🎉', style: PlanitTypos.body2))
          ],
        ),
      ),
    ]);
  }
}

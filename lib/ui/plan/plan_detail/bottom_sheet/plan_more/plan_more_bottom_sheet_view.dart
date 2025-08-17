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

import '../../../../archiving/archiving_complete/archiving_complete_view.dart';

class PlanMoreBottomSheet extends HookConsumerWidget {
  final int planId;
  final String planStatus; //플랜 수정할때 넘겨줘야함
  final String? dDay; // 플랜 수정할때 넘겨줘야함
  final String icon; //아카이빙 완료할때 넘겨줘야함
  final String title; //아카이빙 완료 할때 넘겨줘어함
  const PlanMoreBottomSheet(
      {super.key,
      required this.dDay,
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
                onTap: () async {
                  final params = <String, String>{
                    'planId': planId.toString(),
                    'planStatus': planStatus,
                    if (dDay != null) 'dDay': dDay!,
                  };
                  final result = await context.pushNamed(
                    PlanCreateView.routeName,
                    queryParameters: params,
                  );

                  if (!context.mounted) {
                    return;
                  }
                  if (result == true) {
                    context.pop(true);
                  }
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
                if (success) {
                  context.pop(true);
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
                    final result = await context.pushNamed(
                      ArchivingCompleteView.routeName,
                      pathParameters: {'title': title, 'icon': icon},
                    );
                    if (result == true) {
                      context.pop(true);
                    } else if (result == 'goToArchiving') {
                      context.pop('goToArchiving');
                    }
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

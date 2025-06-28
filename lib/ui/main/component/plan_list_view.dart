import 'package:flutter/material.dart';
import 'package:planit/ui/main/component/recovery_routine_banner.dart';
import 'package:planit/ui/main/component/task_widget.dart';

import '../../../repository/main/model/main_plan_model.dart';
import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';

class PlanListView extends StatelessWidget {
  final List<MainPlanModel> plans;
  final bool showRecoveryRoutineBanner;

  const PlanListView({
    super.key,
    required this.plans,
    required this.showRecoveryRoutineBanner,
  });

  @override
  Widget build(BuildContext context) {
    // 불러올 플랜이 없는 경우
    bool hasNothing = plans.isEmpty;

    // 회복 루틴 배너가 있을 경우에도 전체 플랜 노출되도록 itemCount 1 증가
    int itemCount = showRecoveryRoutineBanner ? plans.length + 1 : plans.length;

    return hasNothing
        ? Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              spacing: 10.0,
              children: [
                Text(
                  '아직 플랜이\n존재하지 않아요!',
                  style: PlanitTypos.body3.copyWith(
                    color: PlanitColors.black03,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '새 플랜 제작하기',
                  style: PlanitTypos.caption.copyWith(
                    color: PlanitColors.black03,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : Expanded(
            child: ListView.separated(
              padding: EdgeInsetsGeometry.only(
                left: 12.0,
                right: 12.0,
                top: 20.0,
                bottom: 40.0,
              ),
              itemCount: itemCount,
              separatorBuilder: (context, index) => SizedBox(
                height: 12.0,
              ),
              itemBuilder: (context, index) {
                // 회복 루틴 배너가 노출될 때
                if (showRecoveryRoutineBanner) {
                  if (index == 0) {
                    return RecoveryRoutineBanner();
                  } else {
                    final MainPlanModel plan = plans[index - 1];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TaskWidget(
                        planTitle: plan.planTitle,
                        tasks: plan.tasks,
                        dDay: plan.dDay,
                      ),
                    );
                  }
                }
                // 회복 루틴 배너가 노출되지 않을 때
                else {
                  final MainPlanModel plan = plans[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TaskWidget(
                      planTitle: plan.planTitle,
                      tasks: plan.tasks,
                      dDay: plan.dDay,
                    ),
                  );
                }
              },
            ),
          );
  }
}

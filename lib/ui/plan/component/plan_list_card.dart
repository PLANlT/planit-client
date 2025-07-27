import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/ui/plan/component/plan_main_chip.dart';

class PlanListCard extends StatelessWidget {
  final PlanModel plan;
  final String planStatus;

  const PlanListCard({super.key, required this.plan, required this.planStatus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'plan_detail',
          pathParameters: {
            'planId': plan.planId.toString(),
            'planStatus': planStatus, 
          },
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: PlanitColors.white02,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset('${plan.icon}.svg'),
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlanitText(plan.title, style: PlanitTypos.title3),
                    PlanitText(plan.motivation,
                        style: PlanitTypos.caption
                            .copyWith(color: PlanitColors.black02)),
                    PlanitText('${plan.totalTask}개 루틴',
                        style: PlanitTypos.caption
                            .copyWith(color: PlanitColors.black02))
                  ],
                ),
              ),
              if (plan.dday != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: PlanMainchip(
                    bordercolor: PlanitColors.white01,
                    title: '${plan.dday}',
                    backgroundcolor: PlanitColors.white01,
                    textcolor: PlanitColors.black03,
                  ),
                ),
            ],
          )),
    );
  }
}

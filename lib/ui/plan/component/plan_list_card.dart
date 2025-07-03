import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/repository/plan/model/plan_overview_model.dart';
import 'package:planit/ui/plan/component/custom_chip.dart';
import 'package:planit/ui/plan/component/plan_main_chip.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_view.dart';

class PlanListCard extends StatelessWidget {
  final plan;

  const PlanListCard({
    super.key,
    this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanDetailView(),
          ),
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
                child: SvgPicture.asset(plan.imagePath),
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlanitText(plan.title, style: PlanitTypos.title3),
                    PlanitText(plan.subtitle,
                        style: PlanitTypos.caption
                            .copyWith(color: PlanitColors.black02)),
                    PlanitText('${plan.routinNum}개 루틴',
                        style: PlanitTypos.caption
                            .copyWith(color: PlanitColors.black02))
                  ],
                ),
              ),
              if (plan.dDay != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: PlanMainchip(
                    bordercolor: PlanitColors.white01,
                    title: 'D-${plan.dDay}',
                    backgroundcolor: PlanitColors.white01,
                    textcolor: PlanitColors.black03,
                  ),
                ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/template_detail_card.dart';
import 'package:planit/ui/plan/plan_template/plan_template.dart';

class PlanTeamplateView extends StatelessWidget {
  static String get routeName => 'plan_template';
  final String templateName;
  const PlanTeamplateView({required this.templateName, super.key});

  @override
  Widget build(BuildContext context) {
    late final PlanTemplate template;

    switch (templateName) {
      case '운동':
        template = PlanTemplates.exercisePlanTemplate;
        break;
      case '마음 정리':
        template = PlanTemplates.emotionPlanTemplate;
        break;
      case '재정':
        template = PlanTemplates.financePlanTemplate;
        break;
      case '관계':
        template = PlanTemplates.relationshipPlanTemplate;
        break;
      case '자기계발':
        template = PlanTemplates.selfGrowthPlanTemplate;
        break;
      default:
        throw Exception('알 수 없는 템플릿 이름입니다: $templateName');
    }

    return DefaultLayout(
        child: Column(children: [
      AppBar(
        backgroundColor: PlanitColors.transparent,
        title: PlanitText(template.title,
            style: PlanitTypos.body2.copyWith(color: PlanitColors.black01)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: template.templateDetails.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TemplateDetailCard(
                templateDetail: template.templateDetails[index],
              ),
            );
          },
        ),
      ),
    ]));
  }
}

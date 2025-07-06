import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/template_detail_card.dart';

class PlanTeamplateView extends StatelessWidget {
  const PlanTeamplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Column(children: [
      AppBar(
        backgroundColor: PlanitColors.transparent,
        title: PlanitText('운동 템플릿',
            style: PlanitTypos.body2.copyWith(color: PlanitColors.black01)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TemplateDetailCard(title: 'title', taskType: 'ALL'),
            );
          },
        ),
      ),
    ]));
  }
}

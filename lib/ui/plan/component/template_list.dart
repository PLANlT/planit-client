import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/ui/plan/plan_template/plan_teamplate_view.dart';

class TemplateList extends StatelessWidget {
  const TemplateList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> templateImage = [
      'assets/templates/health.svg',
      'assets/templates/mediation.svg',
      'assets/templates/money.svg',
      'assets/templates/self_development.svg',
      'assets/templates/social.svg',
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: templateImage.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlanTeamplateView()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SvgPicture.asset(templateImage[index]),
                ),
              );
            }),
      ),
    );
  }
}

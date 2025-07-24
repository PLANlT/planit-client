import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/ui/plan/plan_template/plan_teamplate_view.dart';

class TemplateList extends StatelessWidget {
  const TemplateList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> templateImage = [
      'assets/templates/health.svg', // 운동
      'assets/templates/mediation.svg', // 마음 정리
      'assets/templates/money.svg', // 재정
      'assets/templates/self_development.svg', // 자기계발 (필요시 추가)
      'assets/templates/social.svg', // 관계
    ];

    // 이미지 인덱스별 템플릿 이름 매핑
    final List<String> templateNames = [
      '운동',
      '마음 정리',
      '재정',
      '자기계발',
      '관계',
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: templateImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  PlanTeamplateView.routeName,
                  pathParameters: {'templateName': templateNames[index]},
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SvgPicture.asset(templateImage[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

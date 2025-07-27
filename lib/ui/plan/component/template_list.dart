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

    return SizedBox(
      height: 112,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: templateImage.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                PlanTeamplateView.routeName,
                pathParameters: {'templateName': templateNames[index]},
              );
            },
            child: Padding(
              // 첫번째 아이템에만 좌측 패딩
              padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
              child: SvgPicture.asset(
                templateImage[index],
                height: 112,
                width: 144,
              ),
            ),
          );
        },
      ),
    );
  }
}

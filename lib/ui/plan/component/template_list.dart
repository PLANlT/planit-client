import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class templateList extends StatelessWidget {
  const templateList({super.key});

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
        height: 100, //가로 스크롤이라 heigh 만 지정
        child: ListView.builder(
            shrinkWrap: true, //width는 shrinkWrap으로 조정
            scrollDirection: Axis.horizontal,
            itemCount: templateImage.length,
            itemBuilder: (context, index) {
              return SvgPicture.asset(templateImage[index]);
            }),
      ),
    );
  }
}

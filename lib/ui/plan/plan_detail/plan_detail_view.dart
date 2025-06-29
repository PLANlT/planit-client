import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/to_do_card.dart';

class PlanDetailView extends StatelessWidget {
  const PlanDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'title': '아침 식단 기록하기',
        'iconPaths': ['assets/icons/high.svg', 'assets/icons/low.svg'],
      },
      {
        'title': '30분 산책하기',
        'iconPaths': ['assets/icons/low.svg'],
      },
      {
        'title': '저녁 과식 피하기',
        'iconPaths': ['assets/icons/high.svg'],
      },
    ];
    return DefaultLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
        ),
        SvgPicture.asset(
          'assets/planets/planet1.svg',
          width: 119,
          height: 119,
        ),
        SizedBox(
          height: 20,
        ),
        PlanitText('다이어트',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
        SizedBox(
          height: 10,
        ),
        PlanitText('매일 조금씩, 꾸준히 나아가자',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: PlanitColors.black03)),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 500,
          height: 300,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: todoCard(
                      title: item['title'], iconPaths: item['iconPaths']),
                );
              }),
        )
      ],
    ));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/plan_list_card.dart';
import 'package:planit/ui/plan/component/template_list.dart';
import 'package:planit/ui/plan/plan_create_view.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> plan = [
      {
        'title': 'TOEIC 고득점',
        'subtitle': '매일 조금씩 나아지는..',
        'routinNum': 5,
        'dDay': 12,
        'imagePath': 'assets/planets/planet1.svg',
      },
      {
        'title': '독서 습관',
        'subtitle': '독서 습관을 기르자',
        'routinNum': 2,
        'dDay': 7,
        'imagePath': 'assets/planets/planet3.svg',
      },
      {
        'title': '헬스장 꾸준히 가기',
        'subtitle': '작심삼일 10번이면 한달이다',
        'routinNum': 3,
        'dDay': 20,
        'imagePath': 'assets/planets/planet6.svg',
      },
    ];
    final List<Map<String, dynamic>> pausePlan = [
      {
        'title': '헬스장 꾸준히 가기',
        'subtitle': '작심삼일 10번이면 한달이다',
        'routinNum': 3,
        'dDay': 20,
        'imagePath': 'assets/planets/planet6.svg',
      },
    ];
    final List<String> templateImage = [
      'assets/templates/health.svg',
      'assets/templates/mediation.svg',
      'assets/templates/money.svg',
      'assets/templates/self_development.svg',
      'assets/templates/social.svg',
    ];

    return DefaultLayout(
      // TODO(창민): child 부터 수정하여 구현해주시면 됩니다!
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              toolbarHeight: 92,
              backgroundColor: PlanitColors.white02,
              automaticallyImplyLeading: false,
              title: PlanitText('내 플랜',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              actions: [
                PlanitButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanCreateView(),
                          ));
                    },
                    buttonColor: PlanitButtonColor.black,
                    buttonSize: PlanitButtonSize.small,
                    label: '+ 새 플랜'),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText(
                  '진행 중인 플랜',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            SizedBox(
              width: 360,
              height: 400,
              child: ListView.builder(
                  itemCount: plan.length,
                  itemBuilder: (context, index) {
                    final item = plan[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: planListCard(
                          title: item['title'],
                          subtitle: item['subtitle'],
                          dDay: item['dDay'],
                          imagePath: item['imagePath'],
                          routinNum: item['routinNum']),
                    );
                  }),
            ),
            //리스트뷰
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText(
                  '잠시 중단한 플랜',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              width: 360,
              height: 170,
              child: ListView.builder(
                  itemCount: pausePlan.length,
                  itemBuilder: (context, index) {
                    final item = pausePlan[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: planListCard(
                          title: item['title'],
                          subtitle: item['subtitle'],
                          dDay: item['dDay'],
                          imagePath: item['imagePath'],
                          routinNum: item['routinNum']),
                    );
                  }),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                PlanitText(
                  '템플릿',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            templateList(imagePath: templateImage)
          ],
        ),
      ),
    );
  }
}

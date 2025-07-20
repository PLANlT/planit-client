import 'package:flutter/material.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/task_card.dart';
import 'package:planit/ui/plan/component/template_detail_card.dart';

class PlanTemplateDetailView extends StatelessWidget {
  const PlanTemplateDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: PlanitColors.transparent,
            title: PlanitText('운동 템플릿',
                style: PlanitTypos.body2.copyWith(color: PlanitColors.black01)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 32),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanitText('설명', style: PlanitTypos.title3),
                PlanitText('식단 관리와 가벼운 유산소 운동으로 구성된 건강한 다이어트 플랜입니다.',
                    style: PlanitTypos.body2)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24)
                .copyWith(top: 32, bottom: 12),
            child: PlanitText('미리보기', style: PlanitTypos.title3),
          ),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TaskCard(
                      title: 'title',
                      taskType: 'ALL',
                      taskId: 2,
                    ));
              },
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              child: PlanitButton(
                  onPressed: () {},
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '이 템플릿으로 플랜 만들기'),
            ),
          )
        ],
      ),
    );
  }
}

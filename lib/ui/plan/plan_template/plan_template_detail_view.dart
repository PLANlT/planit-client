import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_toast.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/task_card.dart';
import 'package:planit/ui/plan/component/template_detail_card.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';
import 'package:planit/ui/plan/plan_template/plan_template.dart';
import 'package:planit/ui/plan/plan_template/plan_template_detail_view_model.dart';

class PlanTemplateDetailView extends HookConsumerWidget {
  final PlanTemplateDetail templateDetai;
  const PlanTemplateDetailView({required this.templateDetai, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(planTemplateViewModelProvider.notifier);

    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: PlanitColors.transparent,
            title: PlanitText(templateDetai.title,
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
                PlanitText(templateDetai.descriptionLong,
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
              itemCount: templateDetai.tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TaskCard(
                      title: templateDetai.tasks[index].title,
                      taskType: templateDetai.tasks[index].taskType,
                      taskId: index,
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
                  onPressed: () async {
                    try {
                      await viewmodel.createPlanAndAddTask(templateDetai);
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlanView()),
                        );
                      }
                    } catch (e) {
                      // 에러 처리 로직 추가
                      PlanitToast(
                        label: '플랜 만들기에 실패했습니다',
                      );
                    }
                  },
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

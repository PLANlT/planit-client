// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/custom_chip.dart';
import 'package:planit/ui/plan/component/plan_warp_grid.dart';
import 'package:planit/ui/plan/plan_create/plan_create_state.dart';
import 'package:planit/ui/plan/plan_create/plan_create_view_model.dart';

class PlanCreateView extends HookConsumerWidget {
  const PlanCreateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlanCreateState state = ref.watch(planViewModelProvider);
    PlanCreateViewModel viewmodel = ref.read(planViewModelProvider.notifier);

    final titleController = useTextEditingController();
    final motivationController = useTextEditingController();

    return DefaultLayout(
        child: Column(
      children: [
        AppBar(
            backgroundColor: PlanitColors.transparent,
            title: PlanitText('내 플랜 만들기',
                style:
                    PlanitTypos.body2.copyWith(color: PlanitColors.black01))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 9.0,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
              child: Row(
                children: [
                  PlanitText(
                    '플랜 제목',
                    style:
                        PlanitTypos.body2.copyWith(color: PlanitColors.black02),
                  ),
                  PlanitText(
                    '*',
                    style:
                        PlanitTypos.body2.copyWith(color: PlanitColors.alert),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
              child: PlanitTextField(
                hintText: '당신의 목표는 무엇인가요?',
                controller: titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PlanitText('다짐 문장',
                      style: PlanitTypos.body2
                          .copyWith(color: PlanitColors.black02)),
                  PlanitText(' (20자 내)',
                      style: PlanitTypos.body3
                          .copyWith(color: PlanitColors.black03)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PlanitTextField(
                hintText: '이 플랜을 지속할 수 있는 요소가 있나요?',
                controller: motivationController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  PlanitText('행성 아이콘 선택',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: PlanitColors.black02)),
                  PlanitText(
                    '*',
                    style:
                        PlanitTypos.body2.copyWith(color: PlanitColors.alert),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PlanetWrapGrid(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 4),
              child: PlanitText('목표일 설정',
                  style:
                      PlanitTypos.body2.copyWith(color: PlanitColors.black02)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                      onTap: () {
                        //DatePickerUI 구현
                      },
                      child: PlanCreateChip(
                        bordercolor: PlanitColors.white03,
                        title: '25.05.01',
                        textcolor: PlanitColors.black03,
                        backgroundcolor: PlanitColors.white01,
                      )),
                ),
                PlanitText('까지 | D-',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: PlanitColors.black03)),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
              child: Row(
                children: [
                  PlanitText('플랜 진행 여부',
                      style: PlanitTypos.body2
                          .copyWith(color: PlanitColors.black02)),
                  PlanitText(
                    '*',
                    style:
                        PlanitTypos.body2.copyWith(color: PlanitColors.alert),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 8,
                children: [
                  PlanitChip(chipColor: PlanitChipColor.black, label: '진행 중'),
                  PlanitChip(chipColor: PlanitChipColor.gray, label: '중단'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 160),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(36.0),
                      color: PlanitColors.black01),
                  child: Center(
                    child: PlanitText(
                      '플랜 만들기',
                      style: PlanitTypos.body3.copyWith(
                        color: PlanitColors.white01,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

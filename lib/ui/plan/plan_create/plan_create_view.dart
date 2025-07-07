// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/custom_chip.dart';
import 'package:planit/ui/plan/component/plan_wrap_grid.dart';
import 'package:planit/ui/plan/plan_create/plan_create_state.dart';
import 'package:planit/ui/plan/plan_create/plan_create_view_model.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';

class PlanCreateView extends HookConsumerWidget {
  const PlanCreateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlanCreateState state = ref.watch(planViewModelProvider);
    PlanCreateViewModel viewmodel = ref.read(planViewModelProvider.notifier);

    final titleController = useTextEditingController();
    final motivationController = useTextEditingController();

    return DefaultLayout(
        child: SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
              backgroundColor: PlanitColors.transparent,
              title: PlanitText('내 플랜 만들기',
                  style:
                      PlanitTypos.body2.copyWith(color: PlanitColors.black01))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.0,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 28),
                child: Row(
                  children: [
                    PlanitText(
                      '플랜 제목',
                      style: PlanitTypos.body2
                          .copyWith(color: PlanitColors.black02),
                    ),
                    PlanitText(
                      '*',
                      style:
                          PlanitTypos.body2.copyWith(color: PlanitColors.alert),
                    ),
                    PlanitText(
                      '(20자 내)',
                      style: PlanitTypos.body3
                          .copyWith(color: PlanitColors.black03),
                    ),
                  ],
                ),
              ),
              ShakeWidget(
                shake: state.isClickedNext == true && state.title == '',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PlanitTextField(
                    maxLength: 20,
                    hintText: state.isClickedNext == true && state.title == ''
                        ? null
                        : '당신의 목표는 무엇인가요?',
                    errorText: state.isClickedNext == true && state.title == ''
                        ? '당신의 목표는 무엇인가요?'
                        : null,
                    controller: titleController,
                    onChanged: viewmodel.updateTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PlanitText('다짐 문장',
                        style: PlanitTypos.body2
                            .copyWith(color: PlanitColors.black02)),
                    PlanitText(' (40 내)',
                        style: PlanitTypos.body3
                            .copyWith(color: PlanitColors.black03)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitTextField(
                  hintText: '이 플랜을 지속할 수 있는 요소가 있나요?',
                  controller: motivationController,
                  onChanged: viewmodel.updateMotivation,
                  maxLength: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
              ShakeWidget(
                shake: state.isClickedNext && state.icon.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (state.isClickedNext && state.icon.isEmpty)
                              ? PlanitColors.alert
                              : PlanitColors.transparent),
                    ),
                    child: PlanetWrapGrid(
                        selectedIcon: state.icon,
                        onSelect: (asset) {
                          viewmodel.updateIcon(asset);
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 12),
                child: PlanitText('목표일 설정',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black02)),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        onTap: () async {
                          final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));

                          if (selectedDate != null) {
                            final formatDate =
                                DateFormat('yy-MM-dd').format(selectedDate);
                            viewmodel.updateSelectedDate(formatDate);
                            viewmodel.calculateDday(selectedDate);
                          }
                        },
                        child: PlanCreateChip(
                          bordercolor: PlanitColors.white03,
                          title: state.selectedDate!,
                          textcolor: PlanitColors.black03,
                          backgroundcolor: PlanitColors.white01,
                        )),
                  ),
                  PlanitText('까지 | D-',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: PlanitColors.black03)),
                  PlanitText(
                    state.dDay,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: PlanitColors.black03),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 12),
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
              ShakeWidget(
                shake: state.isClickedNext && state.planStatus.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    spacing: 8,
                    children: [
                      GestureDetector(
                          onTap: () =>
                              viewmodel.updatePlanStatus('IN_PROGRESS'),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(37)),
                              border: Border.all(
                                color: (state.isClickedNext &&
                                        state.planStatus.isEmpty)
                                    ? PlanitColors.alert
                                    : PlanitColors.transparent,
                              ),
                            ),
                            child: PlanitChip(
                                chipColor: state.planStatus == 'IN_PROGRESS'
                                    ? PlanitChipColor.black
                                    : PlanitChipColor.gray,
                                label: '진행 중'),
                          )),
                      GestureDetector(
                          onTap: () => viewmodel.updatePlanStatus('PAUSED'),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(37)),
                              border: Border.all(
                                color: (state.isClickedNext &&
                                        state.planStatus.isEmpty)
                                    ? PlanitColors.alert
                                    : PlanitColors.transparent,
                              ),
                            ),
                            child: PlanitChip(
                                chipColor: state.planStatus == 'PAUSED'
                                    ? PlanitChipColor.black
                                    : PlanitChipColor.gray,
                                label: '중단'),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                      onPressed: () {
                        viewmodel.updateClickedNext();
                        if (state.isNextEnabled)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlanView()), //임시
                          );
                      },
                      buttonColor: PlanitButtonColor.black,
                      buttonSize: PlanitButtonSize.large,
                      label: '플랜 만들기'),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class ShakeWidget extends StatefulWidget {
  final Widget child;
  final bool shake;

  const ShakeWidget({
    super.key,
    required this.child,
    required this.shake,
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    _offsetAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 1),
    ]).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shake && !oldWidget.shake) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_offsetAnimation.value, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

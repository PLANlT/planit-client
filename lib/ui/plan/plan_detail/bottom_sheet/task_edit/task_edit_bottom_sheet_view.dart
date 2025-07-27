import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_toggle.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/conditional_tip_bottom_sheet.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_edit/task_edit_bottom_sheet_state.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_edit/task_edit_bottom_sheet_view_model.dart';

class TaskEditBottomSheetView extends HookConsumerWidget {
  final int taskId;

  const TaskEditBottomSheetView({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TaskEditBottomSheetState state = ref.watch(
      taskEditViewModelProvider(taskId),
    );
    final TaskEditBottomSheetViewModel viewmodel = ref.read(
      taskEditViewModelProvider(taskId).notifier,
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewmodel.init();
      });
      return null;
    }, []);

    return Wrap(
      children: [
        PlanitBottomSheet(
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              top: 24,
            ),
            child: Column(
              children: [
                PlanitText(
                  '루틴 설정',
                  style: PlanitTypos.title2.copyWith(
                    color: PlanitColors.black01,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      PlanitText(
                        '반복 요일',
                        style: PlanitTypos.body3.copyWith(
                          color: PlanitColors.black03,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      7,
                      (index) {
                        const days = ['월', '화', '수', '목', '금', '토', '일'];
                        return GestureDetector(
                          onTap: () => viewmodel.toggleDay(days[index]),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                state.routinDayList.contains(days[index])
                                    ? PlanitColors.black01
                                    : PlanitColors.white02,
                            child: PlanitText(
                              days[index],
                              style: PlanitTypos.body3.copyWith(
                                color: state.routinDayList.contains(days[index])
                                    ? PlanitColors.white01
                                    : PlanitColors.black02,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      PlanitText(
                        '시간 설정',
                        style: PlanitTypos.body3.copyWith(
                          color: PlanitColors.black03,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: PlanitToggle(
                          onChanged: (value) {
                            viewmodel.toggleTimeSetting();
                          },
                          isOn: state.timeSetting,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: state.timeSetting
                            ? () async {
                                final now = TimeOfDay.now();
                                final pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: now,
                                );
                                if (pickedTime != null) {
                                  final hour = pickedTime.hour
                                      .toString()
                                      .padLeft(2, '0');
                                  final minute = pickedTime.minute
                                      .toString()
                                      .padLeft(2, '0');
                                  final formattedTime =
                                      '$hour:$minute'; // 예: "09:00"
                                  viewmodel.updateSelectedTime(formattedTime);
                                }
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: PlanitColors.white02,
                          ),
                          width: 56,
                          height: 40,
                          child: Center(
                            child: PlanitText(
                              state.time,
                              style: TextStyle(
                                //피그마에 size14, weight400라 적혀있어서 TextStyle썼습니다
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: state.timeSetting
                                    ? PlanitColors.black01
                                    : PlanitColors.black04,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      PlanitText(
                        '이 할일은 어떤 컨디션일때 하기 좋아요?',
                        style: PlanitTypos.body3.copyWith(
                          color: PlanitColors.black03,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    spacing: 12,
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewmodel.toggleType('HIGH');
                        },
                        child: PlanitChip(
                          chipColor: state.taskType.contains('HIGH')
                              ? PlanitChipColor.black
                              : PlanitChipColor.gray,
                          label: '🔥 힘이 넘칠 때',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          viewmodel.toggleType('LOW');
                        },
                        child: PlanitChip(
                          chipColor: state.taskType.contains('LOW')
                              ? PlanitChipColor.black
                              : PlanitChipColor.gray,
                          label: '💧 지쳤을 때',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  // 물음표까지 터치영역 확장
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => ConditionTipBottomSheet(),
                      );
                    },
                    child: Row(
                      spacing: 4,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: PlanitColors.transparent,
                            border: Border.all(
                              color: PlanitColors.black03,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: PlanitText(
                              '?',
                              style: TextStyle(
                                color: PlanitColors.black03,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        PlanitText(
                          '컨디션을 정하는 팁',
                          style: PlanitTypos.caption.copyWith(
                            color: PlanitColors.black03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: PlanitButton(
                      onPressed: () {
                        viewmodel.saveEditedRoutine();
                        Navigator.pop(context);
                      },
                      buttonColor: PlanitButtonColor.black,
                      buttonSize: PlanitButtonSize.large,
                      label: '저장',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

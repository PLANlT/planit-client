import 'package:flutter/material.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

import '../../common/comopnent/planit_checkbox.dart';
import '../main_view_model.dart';

class TaskWidget extends StatelessWidget {
  final String planTitle;
  final List<TaskStatusModel> tasks;
  final String? dDay;
  final int planIndex;
  final OnCheckboxTap onCheckboxTap;

  const TaskWidget({
    super.key,
    required this.planTitle,
    required this.tasks,
    required this.dDay,
    required this.planIndex,
    required this.onCheckboxTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadiusGeometry.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ).copyWith(top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            _PlanTitle(planTitle: planTitle),
            SizedBox(height: 8.0),
            ...tasks.asMap().entries.map(
                  (MapEntry<int, TaskStatusModel> e) => _Task(
                    task: e.value,
                    onCheckboxTap: onCheckboxTap,
                  ),
                ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: _DDay(dDay: dDay),
            ),
          ],
        ),
      ),
    );
  }
}

class _Task extends StatelessWidget {
  final TaskStatusModel task;
  final OnCheckboxTap onCheckboxTap;

  const _Task({
    required this.task,
    required this.onCheckboxTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Row(
        spacing: 10.0,
        children: [
          GestureDetector(
            onTap: () {
              // 미완료일 때만 체크 허용
              if (!task.isCompleted) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => PlanitBottomSheet(
                    content: Column(
                      children: [
                        SizedBox(height: 20.0),
                        PlanitText(
                          '할 일을 마치셨나요?',
                          style: PlanitTypos.title3.copyWith(
                            color: PlanitColors.black01,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        GestureDetector(
                          onTap: () => onCheckboxTap(
                            taskId: task.taskId,
                            isCurrentCompleted: task.isCompleted,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: PlanitText(
                              '네',
                              style: PlanitTypos.body2.copyWith(
                                color: PlanitColors.red,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          color: PlanitColors.white03,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: PlanitText(
                              '아니오',
                              style: PlanitTypos.body2.copyWith(
                                color: PlanitColors.black01,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            child: PlanitCheckbox(
              isChecked: task.isCompleted,
            ),
          ),
          Expanded(
            child: PlanitText(
              task.title,
              style: task.isCompleted
                  ? PlanitTypos.body2.copyWith(
                      color: PlanitColors.black03,
                    )
                  : PlanitTypos.body2.copyWith(
                      color: PlanitColors.black02,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final String? dDay;

  const _DDay({
    required this.dDay,
  });

  @override
  Widget build(BuildContext context) {
    return (dDay == null)
        ? SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
              color: PlanitColors.black01,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 4.0,
            ),
            child: PlanitText(
              dDay!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.24,
                leadingDistribution: TextLeadingDistribution.proportional,
                fontFamily: 'Pretendard',
                color: PlanitColors.white01,
              ),
            ),
          );
  }
}

class _PlanTitle extends StatelessWidget {
  const _PlanTitle({
    required this.planTitle,
  });

  final String planTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.black01,
        borderRadius: BorderRadius.circular(37.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      child: PlanitText(
        planTitle,
        style: PlanitTypos.caption.copyWith(
          color: PlanitColors.white01,
        ),
      ),
    );
  }
}

class TempTaskModel {
  final bool isCompleted;
  final String task;

  TempTaskModel({
    required this.isCompleted,
    required this.task,
  });
}

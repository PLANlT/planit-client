import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

class TaskWidget extends StatelessWidget {
  final String planTitle;
  final List<TempTaskModel> tasks;
  final int? dDay;

  const TaskWidget({
    super.key,
    required this.planTitle,
    required this.tasks,
    required this.dDay,
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
            ...tasks.map(
              (task) => _Task(task: task),
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
  final TempTaskModel task;

  const _Task({
    required this.task,
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
          Container(
            decoration: BoxDecoration(
              color: PlanitColors.white01,
              borderRadius: BorderRadius.circular(4.0),
            ),
            width: 20.0,
            height: 20.0,
          ),
          Expanded(
            child: PlanitText(
              task.task,
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
  final int? dDay;

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
              'D-$dDay',
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

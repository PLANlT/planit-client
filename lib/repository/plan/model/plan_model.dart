import 'package:planit/repository/plan/model/task_model.dart';

class PlanModel {
  final int planId;
  final String title;
  final String motivation;
  final int totalTask;
  final int? dDay;
  final String icon;
  final String? planStatus;

  PlanModel(
      {required this.planId,
      required this.title,
      required this.motivation,
      required this.totalTask,
      this.dDay,
      required this.icon,
      this.planStatus});
}

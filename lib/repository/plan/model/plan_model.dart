import 'package:planit/data_source/plan/reponse_body/plan_response_body.dart';
import 'package:planit/repository/task/model/task_model.dart';

class PlanModel {
  final int planId;
  final String title;
  final String motivation;
  final int totalTask;
  final String? dday;
  final String icon;
  final String? planStatus;

  PlanModel(
      {required this.planId,
      required this.title,
      required this.motivation,
      required this.totalTask,
      this.dday,
      required this.icon,
      this.planStatus});

  factory PlanModel.fromResponse(PlanResponseBody response, String planStatus) {
    return PlanModel(
        planId: response.planId,
        title: response.title,
        icon: response.icon,
        motivation: response.motivation,
        totalTask: response.totalTasks,
        dday: response.dday,
        planStatus: planStatus);
  }
}

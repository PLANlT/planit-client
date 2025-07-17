// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planit/data_source/plan/reponse_body/plan_detail_response_body.dart';
import 'package:planit/repository/plan/model/task_model.dart';
import 'package:planit/ui/main/component/task_widget.dart';

class PlanDetailModel {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final List<TaskModel> tasks;

  PlanDetailModel({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.tasks,
  });
  factory PlanDetailModel.fromResponse(PlanDetailResponseBody response) {
    return PlanDetailModel(
      planId: response.planId,
      title: response.title,
      icon: response.icon,
      motivation: response.motivation,
      tasks: response.tasks.map((e) => TaskModel.fromResponse(e)).toList(),
    );
  }
}

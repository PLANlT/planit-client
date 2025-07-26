import 'package:planit/data_source/archiving/response_body/archiving_plan_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_create_response_body.dart';

class ArchivingPlanModel {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final int progressDays;
  final int completedDaysAgo;

  ArchivingPlanModel(
      {required this.planId,
      required this.title,
      required this.icon,
      required this.motivation,
      required this.progressDays,
      required this.completedDaysAgo});

  ArchivingPlanModel.fromResponse(ArchivingDataPlan response)
      : planId = response.planId,
        title = response.title,
        icon = response.icon,
        motivation = response.motivation,
        progressDays = response.progressDays,
        completedDaysAgo = response.completedDaysAgo;
}

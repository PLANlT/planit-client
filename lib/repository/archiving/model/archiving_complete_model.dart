import 'package:planit/data_source/plan/reponse_body/archiving_complete_plan_response_body.dart';

class ArchivingCompleteModel {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final String planStatus;
  final String startedAt;
  final String? finishedAt;

  ArchivingCompleteModel({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.planStatus,
    required this.startedAt,
    this.finishedAt,
  });

  ArchivingCompleteModel.fromResponse(
      ArchivingCompletePlanResponseBody response)
      : planId = response.planId,
        title = response.title,
        icon = response.icon,
        motivation = response.motivation,
        planStatus = response.planStatus,
        startedAt = response.startedAt,
        finishedAt = response.finishedAt;
}

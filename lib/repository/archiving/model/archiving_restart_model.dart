import 'package:planit/data_source/archiving/response_body/archiving_restart_plan_response_body.dart';

class ArchivingRestartModel {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final String planStatus;
  final String startedAt;
  final String? finishedAt;

  ArchivingRestartModel({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.planStatus,
    required this.startedAt,
    required this.finishedAt,
  });

  ArchivingRestartModel.fromResponse(
      ArchivingRestartPlanResponseBody response)
      : planId = response.planId,
        title = response.title,
        icon = response.icon,
        motivation = response.motivation,
        planStatus = response.planStatus,
        startedAt = response.startedAt,
        finishedAt = response.finishedAt;
}

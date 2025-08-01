import 'package:planit/data_source/plan/reponse_body/plan_create_response_body.dart';

class PlanCreateModel {
  final int? planId;
  final String title;
  final String motivation;
  final String icon;
  final String planStatus;
  final String? startedAt;
  final String? finishedAt;

  PlanCreateModel({
    this.planId,
    required this.title,
    required this.motivation,
    required this.icon,
    required this.planStatus,
    required this.startedAt,
    required this.finishedAt,
  });

  PlanCreateModel.fromResponse(PlanCreateResponseBody response)
      : planId = response.planId,
        title = response.title,
        motivation = response.motivation,
        icon = response.icon,
        planStatus = response.planStatus,
        startedAt = response.startedAt,
        finishedAt = response.finishedAt;
}

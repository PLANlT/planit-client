import 'package:json_annotation/json_annotation.dart';

part 'archiving_restart_plan_response_body.g.dart';

@JsonSerializable()
class ArchivingRestartPlanResponseBody {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final String planStatus;
  final String startedAt;
  final String? finishedAt;

  ArchivingRestartPlanResponseBody({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.planStatus,
    required this.startedAt,
    this.finishedAt,
  });

  factory ArchivingRestartPlanResponseBody.fromJson(
          Map<String, dynamic> json) =>
      _$ArchivingRestartPlanResponseBodyFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

part 'archiving_plan_response_body.g.dart';

@JsonSerializable()
class ArchivingPlanResponseBody {
  final List<ArchivingDataPlan> archives;

  ArchivingPlanResponseBody({required this.archives});

  factory ArchivingPlanResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ArchivingPlanResponseBodyFromJson(json);
}

@JsonSerializable()
class ArchivingDataPlan {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final int progressDays;
  final int completedDaysAgo;

  ArchivingDataPlan({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.progressDays,
    required this.completedDaysAgo,
  });

  factory ArchivingDataPlan.fromJson(Map<String, dynamic> json) =>
      _$ArchivingDataPlanFromJson(json);
}

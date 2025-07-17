import 'package:json_annotation/json_annotation.dart';

part 'plan_detail_response_body.g.dart';

@JsonSerializable()
class PlanDetailResponseBody {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final List<TaskResponseBody> tasks;

  PlanDetailResponseBody({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.tasks,
  });

  factory PlanDetailResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDetailResponseBodyToJson(this);
}

@JsonSerializable()
class TaskResponseBody {
  final int taskId;
  final String taskType;
  final String title;

  TaskResponseBody({
    required this.taskId,
    required this.taskType,
    required this.title,
  });

  factory TaskResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseBodyToJson(this);
}

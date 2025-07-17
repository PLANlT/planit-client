import 'package:json_annotation/json_annotation.dart';
import 'package:planit/data_source/main/reponse_body/today_tasks_response_body.dart';

part 'plan_response_body.g.dart';

@JsonSerializable()
class PlanListResponseBody {
  final String planStatus;
  final List<PlanResponseBody> plans;

  PlanListResponseBody({required this.planStatus, required this.plans});
  factory PlanListResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PlanListResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PlanListResponseBodyToJson(this);
}

@JsonSerializable()
class PlanResponseBody {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final int totalTasks;
  final String dday;

  PlanResponseBody(
      {required this.planId,
      required this.title,
      required this.icon,
      required this.motivation,
      required this.totalTasks,
      required this.dday});
  factory PlanResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PlanResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PlanResponseBodyToJson(this);
}

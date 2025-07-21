import 'package:json_annotation/json_annotation.dart';
import 'package:planit/data_source/task/response_body/task_create_response_body.dart';

part 'plan_detail_response_body.g.dart';

@JsonSerializable()
class PlanDetailResponseBody {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final List<TaskCreateResponseBody> tasks;

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


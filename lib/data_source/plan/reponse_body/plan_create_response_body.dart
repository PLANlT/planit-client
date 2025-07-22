import 'package:json_annotation/json_annotation.dart';

part 'plan_create_response_body.g.dart';

@JsonSerializable()
class PlanCreateResponseBody {
  final int planId;
  final String title;
  final String icon;
  final String motivation;
  final String planStatus;
  final String startedAt;
  final String finishedAt;

  PlanCreateResponseBody({
    required this.planId,
    required this.title,
    required this.icon,
    required this.motivation,
    required this.planStatus,
    required this.startedAt,
    required this.finishedAt,
  });

  factory PlanCreateResponseBody.fromJson(Map<String, dynamic> json) => _$PlanCreateResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCreateResponseBodyToJson(this);
}

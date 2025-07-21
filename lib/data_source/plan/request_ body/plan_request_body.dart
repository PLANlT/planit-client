import 'package:freezed_annotation/freezed_annotation.dart';
part 'plan_request_body.g.dart';

@JsonSerializable()
class PlanCreateRequestBody {
  final String title;
  final String motivation;
  final String icon;
  final String planStatus;
  final String startedAt;
  final String finishedAt;

  PlanCreateRequestBody(
      {required this.title,
      required this.motivation,
      required this.icon,
      required this.planStatus,
      required this.startedAt,
      required this.finishedAt});
  Map<String, dynamic> toJson() => _$PlanCreateRequestBodyToJson(this);
  factory PlanCreateRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PlanCreateRequestBodyFromJson(json);
}

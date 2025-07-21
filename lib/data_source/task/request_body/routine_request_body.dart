import 'package:json_annotation/json_annotation.dart';

part 'routine_request_body.g.dart';

@JsonSerializable()
class RoutineRequestBody {
  final List<String> routineDay;
  final String taskType;
  final String routineTime;

  RoutineRequestBody({
    required this.routineDay,
    required this.taskType,
    required this.routineTime,
  });

  factory RoutineRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RoutineRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineRequestBodyToJson(this);
}

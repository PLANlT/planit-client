import 'package:json_annotation/json_annotation.dart';

part 'routine_response_body.g.dart';

@JsonSerializable()
class RoutineResponseBody {
  final int taskId;
  final String taskType;
  final List<String> routineDay;
  final String routineTime;

  RoutineResponseBody({
    required this.taskId,
    required this.taskType,
    required this.routineDay,
    required this.routineTime,
  });

  factory RoutineResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RoutineResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineResponseBodyToJson(this);
}

@JsonSerializable()
class RoutineTime {
  final int hour;
  final int minute;
  final int second;
  final int nano;

  RoutineTime({
    required this.hour,
    required this.minute,
    required this.second,
    required this.nano,
  });

  factory RoutineTime.fromJson(Map<String, dynamic> json) =>
      _$RoutineTimeFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineTimeToJson(this);
}

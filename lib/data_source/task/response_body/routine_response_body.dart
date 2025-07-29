import 'package:json_annotation/json_annotation.dart';

part 'routine_response_body.g.dart';

@JsonSerializable()
class RoutineResponseBody {
  final int taskId;
  final String taskType;
  final List<String> routineDay;
  final RoutineTime? routineTime;

  RoutineResponseBody({
    required this.taskId,
    required this.taskType,
    required this.routineDay,
    this.routineTime,
  });

  factory RoutineResponseBody.fromJson(Map<String, dynamic> json) {
    final rawTime = json['routineTime'];

    RoutineTime? parsedTime;

    if (rawTime == null) {
      parsedTime = null;
    } else if (rawTime is Map<String, dynamic>) {
      parsedTime = RoutineTime.fromJson(rawTime);
    } else if (rawTime is String) {
      final parts = rawTime.split(':');
      parsedTime = RoutineTime(
        hour: int.tryParse(parts[0]) ?? 0,
        minute: int.tryParse(parts[1]) ?? 0,
        second: int.tryParse(parts[2]) ?? 0,
        nano: 0,
      );
    } else {
      parsedTime = null;
    }

    return RoutineResponseBody(
      taskId: json['taskId'],
      taskType: json['taskType'],
      routineDay: List<String>.from(json['routineDay']),
      routineTime: parsedTime,
    );
  }

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

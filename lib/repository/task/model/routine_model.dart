import 'package:planit/data_source/task/response_body/routine_response_body.dart';

class RoutineModel {
  final String taskType;
  final RoutineTime? routineTimeObject; // 원본 시간 객체
  final String? routineTimeString; // 가공된 문자열 (예: "09:30")
  final List<String> routineDay;

  RoutineModel({
    required this.taskType,
    this.routineTimeObject,
    this.routineTimeString,
    required this.routineDay,
  });

  factory RoutineModel.fromResponse(RoutineResponseBody response) {
    final timeObj = response.routineTime;
    final timeStr = timeObj == null
        ? null
        : '${_pad(timeObj.hour)}:${_pad(timeObj.minute)}';

    return RoutineModel(
      taskType: response.taskType,
      routineDay: response.routineDay,
      routineTimeObject: timeObj,
      routineTimeString: timeStr,
    );
  }

  static String _pad(int num) => num.toString().padLeft(2, '0');
}

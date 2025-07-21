import 'package:planit/data_source/task/response_body/routine_response_body.dart';

class RoutineModel {
  final String taskType;
  final String routineTime;
  final List<String> routineDay;

  RoutineModel(
      {required this.taskType,
      required this.routineTime,
      required this.routineDay});

  factory RoutineModel.fromResponse(RoutineResponseBody response) {
    return RoutineModel(
      routineDay: response.routineDay,
      taskType: response.taskType,
      routineTime: response.routineTime,
    );
  }
}

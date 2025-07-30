import 'package:json_annotation/json_annotation.dart';

part 'today_tasks_response_body.g.dart';

@JsonSerializable()
class TodayPlanListResponseBody {
  final String todayDate;
  final String dayOfWeek;
  final List<TodayPlanResponseBody> slowPlans;
  final List<TodayPlanResponseBody> passionatePlans;

  const TodayPlanListResponseBody({
    required this.todayDate,
    required this.dayOfWeek,
    required this.slowPlans,
    required this.passionatePlans,
  });

  factory TodayPlanListResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TodayPlanListResponseBodyFromJson(json);
}

@JsonSerializable()
class TodayPlanResponseBody {
  final int planId;
  final String title;
  final List<TaskStatusResponseBody> tasks;
  @JsonKey(name: 'dday')
  final String? dDay;

  TodayPlanResponseBody({
    required this.planId,
    required this.title,
    required this.tasks,
    required this.dDay,
  });

  factory TodayPlanResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TodayPlanResponseBodyFromJson(json);
}

@JsonSerializable()
class TaskStatusResponseBody {
  final int taskId;
  final String title;
  final String? routineTime;
  final bool isCompleted;

  TaskStatusResponseBody({
    required this.taskId,
    required this.title,
    this.routineTime,
    required this.isCompleted,
  });

  factory TaskStatusResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TaskStatusResponseBodyFromJson(json);
}

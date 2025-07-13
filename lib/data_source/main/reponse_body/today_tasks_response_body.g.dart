// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_tasks_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayPlanListResponseBody _$TodayPlanListResponseBodyFromJson(
        Map<String, dynamic> json) =>
    TodayPlanListResponseBody(
      todayDate: json['todayDate'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
      slowPlans: (json['slowPlans'] as List<dynamic>)
          .map((e) => TodayPlanResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
      passionatePlans: (json['passionatePlans'] as List<dynamic>)
          .map((e) => TodayPlanResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodayPlanListResponseBodyToJson(
        TodayPlanListResponseBody instance) =>
    <String, dynamic>{
      'todayDate': instance.todayDate,
      'dayOfWeek': instance.dayOfWeek,
      'slowPlans': instance.slowPlans,
      'passionatePlans': instance.passionatePlans,
    };

TodayPlanResponseBody _$TodayPlanResponseBodyFromJson(
        Map<String, dynamic> json) =>
    TodayPlanResponseBody(
      planId: (json['planId'] as num).toInt(),
      title: json['title'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map(
              (e) => TaskStatusResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
      dDay: json['dday'] as String,
    );

Map<String, dynamic> _$TodayPlanResponseBodyToJson(
        TodayPlanResponseBody instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'title': instance.title,
      'tasks': instance.tasks,
      'dday': instance.dDay,
    };

TaskStatusResponseBody _$TaskStatusResponseBodyFromJson(
        Map<String, dynamic> json) =>
    TaskStatusResponseBody(
      taskId: (json['taskId'] as num).toInt(),
      title: json['title'] as String,
      routineTime: json['routineTime'] as String,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$TaskStatusResponseBodyToJson(
        TaskStatusResponseBody instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'title': instance.title,
      'routineTime': instance.routineTime,
      'isCompleted': instance.isCompleted,
    };

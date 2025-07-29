// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineResponseBody _$RoutineResponseBodyFromJson(Map<String, dynamic> json) =>
    RoutineResponseBody(
      taskId: (json['taskId'] as num).toInt(),
      taskType: json['taskType'] as String,
      routineDay: (json['routineDay'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      routineTime: json['routineTime'] == null
          ? null
          : RoutineTime.fromJson(json['routineTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoutineResponseBodyToJson(
        RoutineResponseBody instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'taskType': instance.taskType,
      'routineDay': instance.routineDay,
      'routineTime': instance.routineTime,
    };

RoutineTime _$RoutineTimeFromJson(Map<String, dynamic> json) => RoutineTime(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      second: (json['second'] as num).toInt(),
      nano: (json['nano'] as num).toInt(),
    );

Map<String, dynamic> _$RoutineTimeToJson(RoutineTime instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
      'nano': instance.nano,
    };

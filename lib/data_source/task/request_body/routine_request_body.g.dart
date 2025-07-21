// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineRequestBody _$RoutineRequestBodyFromJson(Map<String, dynamic> json) =>
    RoutineRequestBody(
      routineDay: (json['routineDay'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      taskType: json['taskType'] as String,
      routineTime: json['routineTime'] as String,
    );

Map<String, dynamic> _$RoutineRequestBodyToJson(RoutineRequestBody instance) =>
    <String, dynamic>{
      'routineDay': instance.routineDay,
      'taskType': instance.taskType,
      'routineTime': instance.routineTime,
    };

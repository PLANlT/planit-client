// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_create_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskCreateResponseBody _$TaskCreateResponseBodyFromJson(
        Map<String, dynamic> json) =>
    TaskCreateResponseBody(
      taskId: (json['taskId'] as num).toInt(),
      taskType: json['taskType'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$TaskCreateResponseBodyToJson(
        TaskCreateResponseBody instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'taskType': instance.taskType,
      'title': instance.title,
    };

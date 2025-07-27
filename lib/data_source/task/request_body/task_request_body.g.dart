// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRequestBody _$TaskRequestBodyFromJson(Map<String, dynamic> json) =>
    TaskRequestBody(
      title: json['title'] as String,
      taskType: json['taskType'] as String,
    );

Map<String, dynamic> _$TaskRequestBodyToJson(TaskRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'taskType': instance.taskType,
    };

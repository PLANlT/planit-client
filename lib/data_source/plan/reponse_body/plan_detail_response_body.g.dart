// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_detail_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanDetailResponseBody _$PlanDetailResponseBodyFromJson(
        Map<String, dynamic> json) =>
    PlanDetailResponseBody(
      planId: (json['planId'] as num).toInt(),
      title: json['title'] as String,
      icon: json['icon'] as String,
      motivation: json['motivation'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map(
              (e) => TaskCreateResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanDetailResponseBodyToJson(
        PlanDetailResponseBody instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'title': instance.title,
      'icon': instance.icon,
      'motivation': instance.motivation,
      'tasks': instance.tasks,
    };

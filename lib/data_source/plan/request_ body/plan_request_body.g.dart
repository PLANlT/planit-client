// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanCreateRequestBody _$PlanCreateRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PlanCreateRequestBody(
      title: json['title'] as String,
      motivation: json['motivation'] as String,
      icon: json['icon'] as String,
      planStatus: json['planStatus'] as String,
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
    );

Map<String, dynamic> _$PlanCreateRequestBodyToJson(
        PlanCreateRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'motivation': instance.motivation,
      'icon': instance.icon,
      'planStatus': instance.planStatus,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
    };

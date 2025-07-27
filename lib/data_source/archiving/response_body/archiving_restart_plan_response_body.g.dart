// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archiving_restart_plan_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivingRestartPlanResponseBody _$ArchivingRestartPlanResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ArchivingRestartPlanResponseBody(
      planId: (json['planId'] as num).toInt(),
      title: json['title'] as String,
      icon: json['icon'] as String,
      motivation: json['motivation'] as String,
      planStatus: json['planStatus'] as String,
      startedAt: json['startedAt'] as String,
      finishedAt: json['finishedAt'] as String?,
    );

Map<String, dynamic> _$ArchivingRestartPlanResponseBodyToJson(
        ArchivingRestartPlanResponseBody instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'title': instance.title,
      'icon': instance.icon,
      'motivation': instance.motivation,
      'planStatus': instance.planStatus,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
    };

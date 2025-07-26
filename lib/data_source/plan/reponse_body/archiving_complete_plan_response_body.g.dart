// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archiving_complete_plan_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivingCompletePlanResponseBody _$ArchivingCompletePlanResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ArchivingCompletePlanResponseBody(
      planId: (json['planId'] as num).toInt(),
      title: json['title'] as String,
      icon: json['icon'] as String,
      motivation: json['motivation'] as String,
      planStatus: json['planStatus'] as String,
      startedAt: json['startedAt'] as String,
      finishedAt: json['finishedAt'] as String?,
    );

Map<String, dynamic> _$ArchivingCompletePlanResponseBodyToJson(
        ArchivingCompletePlanResponseBody instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'title': instance.title,
      'icon': instance.icon,
      'motivation': instance.motivation,
      'planStatus': instance.planStatus,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
    };

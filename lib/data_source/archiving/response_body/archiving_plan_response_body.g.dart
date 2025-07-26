// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archiving_plan_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivingPlanResponseBody _$ArchivingPlanResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ArchivingPlanResponseBody(
      archives: (json['archives'] as List<dynamic>)
          .map((e) => ArchivingDataPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArchivingPlanResponseBodyToJson(
        ArchivingPlanResponseBody instance) =>
    <String, dynamic>{
      'archives': instance.archives,
    };

ArchivingDataPlan _$ArchivingDataPlanFromJson(Map<String, dynamic> json) =>
    ArchivingDataPlan(
      planId: (json['planId'] as num).toInt(),
      title: json['title'] as String,
      icon: json['icon'] as String,
      motivation: json['motivation'] as String,
      progressDays: (json['progressDays'] as num).toInt(),
      completedDaysAgo: (json['completedDaysAgo'] as num).toInt(),
    );

Map<String, dynamic> _$ArchivingDataPlanToJson(ArchivingDataPlan instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'title': instance.title,
      'icon': instance.icon,
      'motivation': instance.motivation,
      'progressDays': instance.progressDays,
      'completedDaysAgo': instance.completedDaysAgo,
    };

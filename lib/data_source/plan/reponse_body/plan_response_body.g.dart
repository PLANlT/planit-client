// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanListResponseBody _$PlanListResponseBodyFromJson(
        Map<String, dynamic> json) =>
    PlanListResponseBody(
      planStatus: json['planStatus'] as String,
      plans: (json['plans'] as List<dynamic>)
          .map((e) => PlanResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanListResponseBodyToJson(
        PlanListResponseBody instance) =>
    <String, dynamic>{
      'planStatus': instance.planStatus,
      'plans': instance.plans,
    };

PlanResponseBody _$PlanResponseBodyFromJson(Map<String, dynamic> json) =>
    PlanResponseBody(
      planId: (json['planId'] as num).toInt(),
      title: json['title'] as String,
      icon: json['icon'] as String,
      motivation: json['motivation'] as String,
      totalTasks: (json['totalTasks'] as num).toInt(),
      dday: json['dday'] as String?,
    );

Map<String, dynamic> _$PlanResponseBodyToJson(PlanResponseBody instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'title': instance.title,
      'icon': instance.icon,
      'motivation': instance.motivation,
      'totalTasks': instance.totalTasks,
      'dday': instance.dday,
    };

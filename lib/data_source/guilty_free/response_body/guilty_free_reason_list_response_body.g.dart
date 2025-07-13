// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guilty_free_reason_list_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuiltyFreeReasonListResponseBody _$GuiltyFreeReasonListResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GuiltyFreeReasonListResponseBody(
      memberName: json['memberName'] as String,
      guiltyFreeReasons: (json['guiltyFreeReasons'] as List<dynamic>)
          .map((e) =>
              GuiltyFreeReasonResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuiltyFreeReasonListResponseBodyToJson(
        GuiltyFreeReasonListResponseBody instance) =>
    <String, dynamic>{
      'memberName': instance.memberName,
      'guiltyFreeReasons': instance.guiltyFreeReasons,
    };

GuiltyFreeReasonResponseBody _$GuiltyFreeReasonResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GuiltyFreeReasonResponseBody(
      activatedAt: json['activatedAt'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$GuiltyFreeReasonResponseBodyToJson(
        GuiltyFreeReasonResponseBody instance) =>
    <String, dynamic>{
      'activatedAt': instance.activatedAt,
      'reason': instance.reason,
    };

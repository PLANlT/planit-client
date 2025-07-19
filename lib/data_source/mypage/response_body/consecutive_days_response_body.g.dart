// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consecutive_days_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsecutiveDaysResponseBody _$ConsecutiveDaysResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ConsecutiveDaysResponseBody(
      currentConsecutiveDays: (json['currentConsecutiveDays'] as num).toInt(),
      maxConsecutiveDays: (json['maxConsecutiveDays'] as num).toInt(),
      perfectConsecutiveDays: (json['perfectConsecutiveDays'] as num).toInt(),
    );

Map<String, dynamic> _$ConsecutiveDaysResponseBodyToJson(
        ConsecutiveDaysResponseBody instance) =>
    <String, dynamic>{
      'currentConsecutiveDays': instance.currentConsecutiveDays,
      'maxConsecutiveDays': instance.maxConsecutiveDays,
      'perfectConsecutiveDays': instance.perfectConsecutiveDays,
    };

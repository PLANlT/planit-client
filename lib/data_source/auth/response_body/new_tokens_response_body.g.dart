// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_tokens_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewTokensResponseBody _$NewTokensResponseBodyFromJson(
        Map<String, dynamic> json) =>
    NewTokensResponseBody(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$NewTokensResponseBodyToJson(
        NewTokensResponseBody instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

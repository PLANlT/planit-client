// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestBody _$SignInRequestBodyFromJson(Map<String, dynamic> json) =>
    SignInRequestBody(
      oauthProvider: json['oauthProvider'] as String,
      oauthToken: json['oauthToken'] as String,
    );

Map<String, dynamic> _$SignInRequestBodyToJson(SignInRequestBody instance) =>
    <String, dynamic>{
      'oauthProvider': instance.oauthProvider,
      'oauthToken': instance.oauthToken,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseBody _$SignInResponseBodyFromJson(Map<String, dynamic> json) =>
    SignInResponseBody(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      newMember: json['newMember'] as bool,
      signUpCompleted: json['signUpCompleted'] as bool,
    );

Map<String, dynamic> _$SignInResponseBodyToJson(SignInResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'newMember': instance.newMember,
      'signUpCompleted': instance.signUpCompleted,
    };

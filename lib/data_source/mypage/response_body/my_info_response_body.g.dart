// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInfoResponseBody _$MyInfoResponseBodyFromJson(Map<String, dynamic> json) =>
    MyInfoResponseBody(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      signType: json['signType'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$MyInfoResponseBodyToJson(MyInfoResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'signType': instance.signType,
      'createdAt': instance.createdAt,
    };

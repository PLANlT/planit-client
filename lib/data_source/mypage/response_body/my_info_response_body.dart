import 'package:json_annotation/json_annotation.dart';

part 'my_info_response_body.g.dart';

@JsonSerializable()
class MyInfoResponseBody {
  final int id;
  final String email;
  final String name;
  final String signType;
  final String createdAt;

  MyInfoResponseBody({
    required this.id,
    required this.email,
    required this.name,
    required this.signType,
    required this.createdAt,
  });

  factory MyInfoResponseBody.fromJson(Map<String, dynamic> json) =>
      _$MyInfoResponseBodyFromJson(json);
}

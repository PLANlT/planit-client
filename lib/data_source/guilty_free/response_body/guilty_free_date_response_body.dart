import 'package:freezed_annotation/freezed_annotation.dart';

part 'guilty_free_date_response_body.g.dart';

@JsonSerializable()
class GuiltyFreeDateResponseBody {
  final String memberName;
  final String activatedAt;

  GuiltyFreeDateResponseBody({
    required this.memberName,
    required this.activatedAt,
  });

  factory GuiltyFreeDateResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GuiltyFreeDateResponseBodyFromJson(json);
}

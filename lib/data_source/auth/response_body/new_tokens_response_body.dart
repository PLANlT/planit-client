import 'package:json_annotation/json_annotation.dart';

part 'new_tokens_response_body.g.dart';

@JsonSerializable()
class NewTokensResponseBody {
  final String accessToken;
  final String refreshToken;

  NewTokensResponseBody({
    required this.accessToken,
    required this.refreshToken,
  });

  factory NewTokensResponseBody.fromJson(Map<String, dynamic> json) =>
      _$NewTokensResponseBodyFromJson(json);
}

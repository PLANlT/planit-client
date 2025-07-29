import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_body.g.dart';

@JsonSerializable()
class SignInRequestBody {
  final String oauthProvider;
  final String oauthToken;

  const SignInRequestBody({
    required this.oauthProvider,
    required this.oauthToken,
  });

  Map<String, dynamic> toJson() => _$SignInRequestBodyToJson(this);
}

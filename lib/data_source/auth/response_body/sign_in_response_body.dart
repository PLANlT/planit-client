import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_body.g.dart';

@JsonSerializable()
class SignInResponseBody {
  final int id;
  final String email;
  final String name;
  final String accessToken;
  final String? refreshToken;
  final bool newMember;
  final bool signUpCompleted;

  SignInResponseBody({
    required this.id,
    required this.email,
    required this.name,
    required this.accessToken,
    required this.refreshToken,
    required this.newMember,
    required this.signUpCompleted,
  });

  factory SignInResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseBodyFromJson(json);
}

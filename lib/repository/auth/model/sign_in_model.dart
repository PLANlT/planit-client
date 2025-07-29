import 'package:planit/data_source/auth/response_body/sign_in_response_body.dart';

class SignInModel {
  final String accessToken;
  final String? refreshToken;
  final bool signUpCompleted;
  final String oAuthToken;

  const SignInModel({
    required this.accessToken,
    required this.refreshToken,
    required this.signUpCompleted,
    required this.oAuthToken,
  });

  SignInModel.fromResponseBody(
    SignInResponseBody response,
    String oAuthIdToken,
  )   : accessToken = response.accessToken,
        refreshToken = response.refreshToken,
        signUpCompleted = response.signUpCompleted,
        oAuthToken = oAuthIdToken;
}

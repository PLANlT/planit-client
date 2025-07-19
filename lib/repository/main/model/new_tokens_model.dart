import '../../../data_source/auth/response_body/new_tokens_response_body.dart';

class NewTokensModel {
  final String accessToken;
  final String refreshToken;

  const NewTokensModel({
    required this.accessToken,
    required this.refreshToken,
  });

  NewTokensModel.fromResponseBody(NewTokensResponseBody response)
      : refreshToken = response.refreshToken,
        accessToken = response.accessToken;
}

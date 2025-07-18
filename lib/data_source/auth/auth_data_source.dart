import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/data_source/auth/request_body/sign_in_request_body.dart';
import 'package:planit/data_source/auth/response_body/new_tokens_response_body.dart';
import 'package:planit/data_source/auth/response_body/sign_in_response_body.dart';
import 'package:planit/service/network/dio_service.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_data_source.g.dart';

final AutoDisposeProvider<AuthDataSource> authDataSourceProvider =
    Provider.autoDispose<AuthDataSource>((ref) => AuthDataSource(
          ref.read(dioServiceProvider),
        ));

@RestApi()
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/planit/auth/sign-out')
  Future<void> signOut();

  @POST('/planit/auth/sign-in')
  Future<ApiResponse<SignInResponseBody>> signIn({
    @Body() required SignInRequestBody body,
  });

  @POST('/planit/auth/refresh')
  Future<ApiResponse<NewTokensResponseBody>> refreshTokens();

  @POST('/planit/members/terms')
  Future<void> agreeAllTos({
    @Header('Authorization') required String tempAccessToken,
  });
}

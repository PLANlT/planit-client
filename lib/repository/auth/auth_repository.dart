import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_naver_login/interface/types/naver_login_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/auth/auth_data_source.dart';
import 'package:planit/data_source/auth/request_body/sign_in_request_body.dart';
import 'package:planit/data_source/auth/response_body/sign_in_response_body.dart';
import 'package:planit/repository/auth/model/sign_in_model.dart';

import '../../core/error_message.dart';

final AutoDisposeProvider<AuthRepository> authRepositoryProvider =
    Provider.autoDispose<AuthRepository>(
  (ref) => AuthRepository(
    authDataSource: ref.read(authDataSourceProvider),
  ),
);

class AuthRepository {
  final AuthDataSource _authDataSource;

  const AuthRepository({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  // 카카오 로그인 연동 로직
  Future<RepositoryResult<SignInModel>> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      // 카카오톡 앱 설치>앱 로그인
      try {
        final data = await UserApi.instance.loginWithKakaoTalk();
        debugPrint('카카오톡으로 로그인 성공 ${data.toString()}');
        // 앱 로그인
        return await signUp(
          type: 'KAKAO',
          oAuthToken: data.accessToken,
        );
      } catch (error) {
        debugPrint('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return FailureRepositoryResult(
            error: error,
            messages: ['카카오 계정 연동에 실패했어요.'],
          );
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final data = await UserApi.instance.loginWithKakaoAccount();
          debugPrint('카카오톡으로 로그인 성공 ${data.toString()}');
          // 앱 로그인
          return await signUp(
            type: 'KAKAO',
            oAuthToken: data.accessToken,
          );
        } catch (error) {
          debugPrint('카카오계정으로 로그인 실패 $error');
          return FailureRepositoryResult(
            error: error,
            messages: ['카카오 계정 연동에 실패했어요.'],
          );
        }
      }
    } else {
      // 카카오톡 앱 미설치>웹>계정으로 로그인
      try {
        final data = await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오톡으로 로그인 성공 ${data.toString()}');
        // 앱 로그인
        return await signUp(
          type: 'KAKAO',
          oAuthToken: data.accessToken,
        );
      } catch (error) {

        debugPrint('카카오계정으로 로그인 실패 $error');
        return FailureRepositoryResult(
          error: error,
          messages: ['카카오 계정 연동에 실패했어요.'],
        );
      }
    }
  }

  // 구글 로그인 연동 로직
  Future<RepositoryResult<SignInModel>> googleLogin() async {
    try {
      final GoogleSignInAccount? data = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication auth = await data!.authentication;

      debugPrint('구글로 로그인 성공 ${data.toString()}');
      // 앱 로그인
      return await signUp(
        type: 'GOOGLE',
        oAuthToken: auth.idToken!,
      );
    } catch (error) {
      debugPrint('구글로 로그인 실패 $error');
      return FailureRepositoryResult(
        error: error,
        messages: ['구글 계정 연동에 실패했어요.'],
      );
    }
  }

// 네이버 로그인 연동 로직
  Future<RepositoryResult<SignInModel>> naverLogin() async {
    try {
      final data = await FlutterNaverLogin.logIn();
      final res = await FlutterNaverLogin.getCurrentAccessToken();

      if (data.status == NaverLoginStatus.loggedIn) {
        debugPrint('네이버로 로그인 성공 ${data.toString()}');
        // 앱 로그인
        return await signUp(
          type: 'NAVER',
          oAuthToken: res.accessToken,
        );
      } else {
        debugPrint('네이버로 로그인 실패 ${data.errorMessage}');
        return FailureRepositoryResult(
          error: data.errorMessage,
          messages: ['네이버 계정 연동에 실패했어요.'],
        );
      }
    } catch (e) {
      debugPrint('네이버로 로그인 실패  $e');
      return FailureRepositoryResult(
        error: e,
        messages: ['네이버 계정 연동에 실패했어요.'],
      );
    }
  }

  // 로그인
  Future<RepositoryResult<SignInModel>> signUp({
    required String type,
    required String oAuthToken,
  }) async {
    try {
      final ApiResponse<SignInResponseBody> result =
          await _authDataSource.signIn(
        body: SignInRequestBody(
          oauthProvider: type,
          oauthToken: oAuthToken,
        ),
      );
      final SignInModel apiData = SignInModel.fromResponseBody(
        result.data,
        oAuthToken,
      );
      return SuccessRepositoryResult(data: apiData);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  Future<RepositoryResult<void>> signOut() async {
    try {
      await _authDataSource.signOut();
      return SuccessRepositoryResult(data: null);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  Future<RepositoryResult<void>> agreeTerms({
    required String tempAccessToken,
  }) async {
    try {
      await _authDataSource.agreeAllTos(tempAccessToken: tempAccessToken);
      return SuccessRepositoryResult(data: null);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }
}

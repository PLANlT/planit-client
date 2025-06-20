import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class AuthRepository {
  // 카카오 로그인 연동 로직
  Future<void> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      // 카카오톡 앱 설치>앱 로그인
      try {
        final data = await UserApi.instance.loginWithKakaoTalk();
        debugPrint('카카오톡으로 로그인 성공 ${data.toString()}');
      } catch (error) {
        debugPrint('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final data = await UserApi.instance.loginWithKakaoAccount();
          debugPrint('카카오톡으로 로그인 성공 ${data.toString()}');
        } catch (error) {
          debugPrint('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      // 카카오톡 앱 미설치>웹>계정으로 로그인
      try {
        final data = await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오톡으로 로그인 성공 ${data.toString()}');
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  // 구글 로그인 연동 로직
  Future<void> googleLogin() async {
    try {
      final data = await GoogleSignIn().signIn();
      debugPrint('구글로 로그인 성공 ${data.toString()}');
    } catch (error) {
      debugPrint('구글로 로그인 실패 $error');
    }
  }

  // Todo(창민): 네이버 로그인 구현 시 여기에 연동 메서드 작성하시면 됩니다!
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:planit/repository/auth/auth_repository.dart';

Future<void> main() async {
  // runApp 실행전 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // env 로드
  await dotenv.load(fileName: 'assets/.env');

  // Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY'],
    javaScriptAppKey: dotenv.env['KAKAO_JAVASCRIPT_APP_KEY'],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(40.0),
        child: Column(
          children: [
            // 카카오 로그인 테스트
            ElevatedButton(
              onPressed: () async {
                AuthRepository().kakaoLogin();
              },
              child: Text('카카오 로그인'),
            ),
            // 구글 로그인 테스트
            ElevatedButton(
              onPressed: () async {
                AuthRepository().googleLogin();
              },
              child: Text('구글 로그인'),
            ),
            ElevatedButton(
                onPressed: () async {
                  AuthRepository().naverLogin();
                },
                child: Text('네이버 로그인'))
          ],
        ),
      ),
    );
  }
}

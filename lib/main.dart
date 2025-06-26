import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
<<<<<<< PL-87/Feat/dodo/design-system
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
=======
import 'package:flutter_naver_login/flutter_naver_login.dart';
>>>>>>> develop
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:planit/repository/auth/auth_repository.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_chips.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
import 'package:planit/ui/common/comopnent/planit_toast.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/common/view/root_tab.dart';

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
      backgroundColor: PlanitColors.white01,
      body: Padding(
        padding: EdgeInsetsGeometry.all(40.0),
<<<<<<< PL-87/Feat/dodo/design-system
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.0,
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
                child: Text('네이버 로그인'),
              ),
              // 위젯 테스트
              SizedBox(
                width: 320.0,
                child: PlanitButton(
                  onPressed: () {},
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: 'PlanitButton',
                ),
              ),
              PlanitButton(
                onPressed: tmp,
                buttonColor: PlanitButtonColor.white,
                buttonSize: PlanitButtonSize.small,
                label: '시작하기',
              ),
              SizedBox(
                width: 320.0,
                child: PlanitButton(
                  onPressed: tmp,
                  buttonColor: PlanitButtonColor.white,
                  buttonSize: PlanitButtonSize.large,
                  label: '길게길게 라벨을 길게길게길게 늘려보아요 길게길게 라벨을 길게길게길게 늘려보아요',
                ),
              ),
              PlanitChips(
                chipsColor: PlanitChipsColor.black,
                label: 'PlanitChips',
              ),
              PlanitChips(
                chipsColor: PlanitChipsColor.gray,
                label: 'Chip',
              ),
              PlanitChips(
                chipsColor: PlanitChipsColor.gray,
                label: '길게길게 라벨을 길게길게길게 늘려보아요 길게길게 라벨을 길게길게길게 늘려보아요',
              ),
              SizedBox(
                width: 80.0,
                child: PlanitTextField(
                  hintText: '내용을 입력하세요',
                ),
              ),
              PlanitTextField(
                maxLength: 50,
              ),
              PlanitTextField(
                errorText: '에러메시지 내용입니다.',
              ),
              ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return PlanitBottomSheet(
                      height: 400.0,
                      content: Column(
                        spacing: 16.0,
                        children: [
                          Text('테스트'),
                          Text('테스트'),
                          Text('테스트'),
                        ],
                      ),
                    );
                  },
                ),
                child: Text('바텀시트 쇽'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RootTab(),
                  ),
                ),
                child: Text('루트탭으로 꼬우'),
              ),
              SvgPicture.asset(
                Assets.planet1,
                width: 120,
                height: 120,
              ),
              SvgPicture.asset(
                Assets.planet2,
                width: 80,
                height: 80,
              ),
              SvgPicture.asset(
                Assets.planet3,
              ),
              SvgPicture.asset(Assets.templateHealth),
              SvgPicture.asset(Assets.high),
              ElevatedButton(
                onPressed: () {
                  final toast = FToast().init(context);
                  toast.showToast(
                    child: PlanitToast(
                      label: '짱이야, 해내버렸어요! 😍',
                    ),
                  );
                },
                child: Text('토스트 ON'),
              ),
            ],
          ),
=======
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
>>>>>>> develop
        ),
      ),
    );
  }
}

void tmp() {}

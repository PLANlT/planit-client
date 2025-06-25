import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:planit/repository/auth/auth_repository.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_chips.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
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
                  label: 'PlanitButton',
                ),
              ),
              SizedBox(
                width: 320.0,
                child: PlanitButton(
                  onPressed: () {},
                  buttonColor: PlanitButtonColor.white,
                  label: '시작하기',
                ),
              ),
              SizedBox(
                width: 320.0,
                child: PlanitButton(
                  onPressed: () {},
                  buttonColor: PlanitButtonColor.white,
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
              PlanitTextField(),
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
            ],
          ),
        ),
      ),
    );
  }
}

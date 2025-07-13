import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:planit/repository/auth/auth_repository.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
import 'package:planit/ui/common/comopnent/planit_toast.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/onboarding/onboarding_view.dart';
import 'package:planit/ui/login/login_view.dart';
import 'package:planit/ui/login/tos_view.dart';
import 'package:planit/ui/splash_view.dart';

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

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
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
    final toast = FToast().init(context);

    return Scaffold(
      backgroundColor: PlanitColors.white01,
      body: Padding(
        padding: EdgeInsetsGeometry.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.0,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SplashView(),
                  ),
                ),
                child: Text('루트탭으로 꼬우'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OnboardingView(),
                  ),
                ),
                child: Text('온보딩'),
                    builder: (context) => LoginView(),
                  ),
                ),
                child: Text('로그인'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TosView(),
                  ),
                ),
                child: Text('약관'),
              ),
              Text(
                '로그인 연동 테스트',
                style: PlanitTypos.title1,
              ),
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
              Text(
                'Btn',
                style: PlanitTypos.title1,
              ),
              SizedBox(
                width: 320.0,
                child: PlanitButton(
                  onPressed: () {},
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: 'Large Btn',
                ),
              ),
              SizedBox(
                width: 320.0,
                child: PlanitButton(
                  onPressed: tmp,
                  buttonColor: PlanitButtonColor.white,
                  buttonSize: PlanitButtonSize.large,
                  label: '시작하기',
                ),
              ),
              PlanitButton(
                onPressed: () {},
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: 'Mini Btn',
              ),
              PlanitButton(
                onPressed: () {},
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '버튼 크기는 마구마구 조절할 수 있어요',
              ),

              PlanitButton(
                onPressed: tmp,
                buttonColor: PlanitButtonColor.white,
                buttonSize: PlanitButtonSize.small,
                label: '시작하기',
              ),
              Text(
                'Chip',
                style: PlanitTypos.title1,
              ),
              PlanitChip(
                chipColor: PlanitChipColor.black,
                label: 'PlanitChip',
              ),
              PlanitChip(
                chipColor: PlanitChipColor.gray,
                label: 'Chip',
              ),
              PlanitChip(
                chipColor: PlanitChipColor.gray,
                label: '길게길게 라벨을 길게길게길게 늘려보아요 길게길게 라벨을 길게길게길게 늘려보아요',
              ),
              Text(
                'Text Field',
                style: PlanitTypos.title1,
              ),
              SizedBox(
                width: 180.0,
                child: PlanitTextField(
                  hintText: '내용을 입력하세요.',
                ),
              ),
              PlanitTextField(
                hintText: '글자수 제한이 있습니다.',
                maxLength: 50,
              ),
              PlanitTextField(
                hintText: '에러가 있을 때는 이렇게 됩니다.',
                errorText: '에러메시지 내용입니다.',
              ),
              Text(
                'Bottom Sheet',
                style: PlanitTypos.title1,
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
                child: Text('바텀시트 올라오는 버튼이고 내부는 구현안했어요'),
              ),
              Text(
                'Asset 잘 나오는지',
                style: PlanitTypos.title1,
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
              Text(
                'Toast',
                style: PlanitTypos.title1,
              ),
              ElevatedButton(
                onPressed: () {
                  toast.showToast(
                    child: PlanitToast(
                      label: '짱이야, 해내버렸어요! 😍',
                    ),
                  );
                },
                child: Text('기본 토스트 뜨는 버튼'),
              ),
              ElevatedButton(
                onPressed: () {
                  toast.showToast(
                    child: PlanitToast(
                      label:
                          '일시적인 오류로 서비스 연결이 지연되고 있어요.\n같은 문제가 반복될 경우 고객센터에 문의해주세요.',
                    ),
                  );
                },
                child: Text('아주아주 긴 토스트 뜨는 버튼'),
              ),
              Text(
                'Task',
                style: PlanitTypos.title1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void tmp() {}

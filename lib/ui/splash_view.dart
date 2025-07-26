import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/core/guilty_free_status.dart';
import 'package:planit/service/app/app_service.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/onboarding/onboarding_view.dart';
import 'package:planit/ui/recovery/recovery_complete_view.dart';

class SplashView extends ConsumerStatefulWidget {
  static String get routeName => 'splash';

  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 길티프리 상태 확인>메인을 길티프리 진행 페이지로 대체 또는 길티프리 종료 페이지 랜딩 위함
      await ref.read(appServiceProvider.notifier).getGuiltyFreeStatus();
      final bool isGuiltyFreeFinished =
          ref.read(appServiceProvider).guiltyFreeStatus == GuiltyFreeStatus.end;
      // 로그인 상태 확인>로그인 페이지 랜딩 위함 (Go-router로 리다이렉트)
      await ref.read(appServiceProvider.notifier).checkLoginStatus();
      // 설치 후 첫 실행인지 확인>온보딩 랜딩 위함
      final bool shouldGoMain =
          await ref.read(planitStorageServiceProvider).getBool(
                key: StorageKey.isNotFirstLaunch,
              );
      // 화면 안정성을 위한 딜레이
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        // 첫 실행이 아닌 경우 (온보딩X)
        if (shouldGoMain) {
          // 길티프리 프리 모드가 자동으로 종료된 경우라면 길티프리 종료 페이지로
          // 그렇지 않다면 메인으로
          context.goNamed(
            isGuiltyFreeFinished
                ? RecoveryCompleteView.routeName
                : RootTab.routeName,
          );
        } else {
          // 첫 실행인 경우 온보딩으로
          context.goNamed(OnboardingView.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.mascotSplash,
              width: 150.0,
              height: 150.0,
            ),
            PlanitText(
              'PLANIT',
              style: PlanitTypos.blackHansSansRegular48,
            ),
            SizedBox(height: 12.0),
            PlanitText(
              '매일의 작은 성공이 쌓이는,\n목표 달성 앱 PLANIT',
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

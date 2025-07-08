import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/service/app/app_service.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/root_tab.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(appServiceProvider.notifier).getGuiltyFreeStatus();
      await Future.delayed(Duration(seconds: 1));
      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RootTab(),
          ),
        );
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

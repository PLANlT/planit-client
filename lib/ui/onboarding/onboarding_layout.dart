import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:planit/ui/common/view/root_tab.dart';

import '../../theme/planit_colors.dart';
import '../../theme/planit_typos.dart';
import '../common/comopnent/planit_button.dart';
import '../common/comopnent/planit_text.dart';
import '../common/const/planit_button_style.dart';
import '../common/view/default_layout.dart';

class OnboardingLayout extends HookConsumerWidget {
  final String title;
  final String description;
  final String asset;
  final bool showButton;

  const OnboardingLayout({
    super.key,
    required this.title,
    required this.description,
    required this.asset,
    required this.showButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanitStorageService service = ref.read(
      planitStorageServiceProvider,
    );

    return DefaultLayout(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.0,
              width: double.infinity,
            ),
            PlanitText(
              title,
              textAlign: TextAlign.center,
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            Spacer(),
            SvgPicture.asset(asset),
            Spacer(),
            PlanitText(
              description,
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black02,
              ),
            ),
            if (showButton)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0).copyWith(
                  top: 36.0,
                ),
                width: double.infinity,
                child: PlanitButton(
                  onPressed: () {
                    context.goNamed(RootTab.routeName);
                    // 온보딩 종료 이후 기존 유저로 처리>앞으로 온보딩 비노출
                    service.setBool(
                      key: StorageKey.isNotFirstLaunch,
                      value: true,
                    );
                  },
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '시작하기',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

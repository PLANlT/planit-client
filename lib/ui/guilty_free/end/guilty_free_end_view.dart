import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/core/guilty_free_status.dart';
import 'package:planit/service/storage/planit_storage_service.dart';
import 'package:planit/service/storage/storage_key.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/root_tab.dart';

import '../../common/assets.dart';

class GuiltyFreeEndView extends ConsumerWidget {
  static String get routeName => 'guilty-end';

  const GuiltyFreeEndView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size deviceSize = MediaQuery.of(context).size;

    final PlanitStorageService storageService = ref.read(
      planitStorageServiceProvider,
    );

    return DefaultLayout(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(bottom: 120.0),
            child: SvgPicture.asset(
              Assets.mascotRestarting,
              width: deviceSize.width,
            ),
          ),
          Column(
            children: [
              Spacer(),
              PlanitText(
                '오늘도 첫 걸음을 떼었어요',
                style: PlanitTypos.title1.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              // 이미지 보이도록 공간 넓게 할당
              Spacer(flex: 3),
              PlanitText(
                '이제 해야 할 일로 부드럽게 연결해볼게요.\n같이 해볼까요? 😄',
                textAlign: TextAlign.center,
                style: PlanitTypos.body2.copyWith(
                  color: PlanitColors.black02,
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsetsGeometry.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 40.0,
                ),
                width: double.infinity,
                child: PlanitButton(
                  onPressed: () {
                    // 버튼 클릭 시 GuiltyFreeStatus가 none으로 저장되어,
                    // 길티프리 관련 액션 수행되지 않게 함
                    storageService.setString(
                      key: StorageKey.guiltyFreeStatus,
                      value: GuiltyFreeStatus.none.name,
                    );
                    context.goNamed(RootTab.routeName);
                  },
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '오늘도 한 발짝 나아가기',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

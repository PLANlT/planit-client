import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/guilty_free/start/view/guilty_free_blocked_view.dart';
import 'package:planit/ui/mypage/view/mypage_view.dart';

import '../../../theme/planit_typos.dart';
import '../../common/assets.dart';
import '../../guilty_free/start/view/guilty_free_intro_view.dart';
import '../const/main_enums.dart';

class MainTopWidget extends StatelessWidget {
  final RouteType type;
  final TaskStatus status;
  final Future<void> onGuiltyFreePressed;
  final bool? canUseGuiltyFree;
  final int consecutiveDay;

  const MainTopWidget({
    super.key,
    required this.type,
    required this.status,
    required this.onGuiltyFreePressed,
    required this.canUseGuiltyFree,
    required this.consecutiveDay,
  });

  @override
  Widget build(BuildContext context) {
    // 루트 타입과 태스크 달성 상태에 따라 보여줄 마스코트 이미지를 가져옵니다
    String asset = getAsset(
      type: type,
      status: status,
    );

    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 20.0,
        right: 20.0,
        top: 40.0,
      ),
      child: SizedBox(
        height: 200.0,
        child: Stack(
          children: [
            // 연속일
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: -40,
              child: NumberPicker(
                itemHeight: 90,
                itemWidth: 200,
                onChanged: (value) {},
                maxValue: consecutiveDay + 1,
                minValue: 0,
                value: consecutiveDay,
                selectedTextStyle: PlanitTypos.pretendardBlack90.copyWith(
                  color: status == TaskStatus.nothing
                      ? PlanitColors.white02
                      : (status == TaskStatus.allPassionate
                          ? PlanitColors.primary
                          : PlanitColors.black01),
                ),
                textStyle: PlanitTypos.pretendardBlack40.copyWith(
                  color: PlanitColors.white02,
                ),
              ),
            ),
            // 마이페이지 버튼
            Positioned(
              left: 0.0,
              child: IconButton(
                icon: SvgPicture.asset(Assets.profile),
                onPressed: () => context.goNamed(MypageView.routeName),
                padding: EdgeInsets.zero,
              ),
            ),
            // 길티프리 버튼
            Positioned(
              right: 0.0,
              child: IconButton(
                icon: SvgPicture.asset(Assets.guiltyFree),
                onPressed: () async {
                  // 길티프리 가능한 상태인지 확인 후 랜딩
                  await onGuiltyFreePressed;
                  if (canUseGuiltyFree != null && context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => canUseGuiltyFree!
                            ? GuiltyFreeIntroView()
                            : GuiltyFreeBlockedView(),
                      ),
                    );
                  }
                },
                padding: EdgeInsets.zero,
              ),
            ),
            // 마스코트 에셋
            Positioned(
              left: 0.0,
              bottom: 0.0,
              child: SvgPicture.asset(asset),
            ),
          ],
        ),
      ),
    );
  }
}

String getAsset({
  required RouteType type,
  required TaskStatus status,
}) {
  // 디폴트로 흑백사진이 먼저 뜨게 수정
  if (type == RouteType.slow) {
    if (status != TaskStatus.nothing) {
      return Assets.mascotSeatingColor;
    } else {
      return Assets.mascotSeatingMonochrome;
    }
  } else {
    if (status != TaskStatus.nothing) {
      return Assets.mascotDancingColor;
    } else {
      return Assets.mascotDancingMonochrome;
    }
  }
}

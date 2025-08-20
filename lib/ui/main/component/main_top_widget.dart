import 'dart:async';

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

class MainTopWidget extends StatefulWidget {
  final RouteType type;
  final TaskStatus status;
  final Future<void> onGuiltyFreePressed;
  final bool? canUseGuiltyFree;
  final int consecutiveDay;
  final bool showAnimation;

  const MainTopWidget({
    super.key,
    required this.type,
    required this.status,
    required this.onGuiltyFreePressed,
    required this.canUseGuiltyFree,
    required this.consecutiveDay,
    required this.showAnimation,
  });

  @override
  State<MainTopWidget> createState() => _MainTopWidgetState();
}

class _MainTopWidgetState extends State<MainTopWidget>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late AnimationController _rotationController;
  late Animation<double> _positionAnimation;
  late Animation<double> _rotationAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _positionController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // 위치 애니메이션: left=20에서 시작해서 오른쪽 끝까지 갔다가 다시 left=20으로
    _positionAnimation = Tween<double>(
      begin: 0.0, // 0이면 left=20 위치
      end: 1.0, // 1이면 오른쪽 끝까지
    ).animate(CurvedAnimation(
      parent: _positionController,
      curve: Curves.linear,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 8 * 3.14159, // 4바퀴 회전
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    ));

    if (widget.showAnimation) {
      _startAnimation();

      // 20초 뒤에 재시작
      _timer = Timer.periodic(
        const Duration(seconds: 20),
        (_) => _startAnimation(),
      );
    }
  }

  void _startAnimation() {
    _positionController.reset();
    _rotationController.reset();

    _positionController.forward();
    _rotationController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _positionController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 루트 타입과 태스크 달성 상태에 따라 보여줄 마스코트 이미지를 가져옵니다
    String asset = getAsset(
      type: widget.type,
      status: widget.status,
    );

    return Padding(
      padding: EdgeInsetsGeometry.only(
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
                maxValue: widget.consecutiveDay + 1,
                minValue: 0,
                value: widget.consecutiveDay,
                selectedTextStyle: PlanitTypos.pretendardBlack90.copyWith(
                  color: widget.status == TaskStatus.nothing
                      ? PlanitColors.white02
                      : (widget.status == TaskStatus.allPassionate
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
              left: 20.0,
              child: IconButton(
                icon: SvgPicture.asset(Assets.profile),
                onPressed: () => context.goNamed(MypageView.routeName),
                padding: EdgeInsets.zero,
              ),
            ),
            // 길티프리 버튼
            Positioned(
              right: 20.0,
              child: IconButton(
                icon: SvgPicture.asset(Assets.guiltyFree),
                onPressed: () async {
                  // 길티프리 가능한 상태인지 확인 후 랜딩
                  await widget.onGuiltyFreePressed;
                  if (widget.canUseGuiltyFree != null && context.mounted) {
                    context.goNamed(
                      widget.canUseGuiltyFree!
                          ? GuiltyFreeIntroView.routeName
                          : GuiltyFreeBlockedView.routeName,
                    );
                  }
                },
                padding: EdgeInsets.zero,
              ),
            ),
            // 마스코트 에셋
            AnimatedBuilder(
              animation: Listenable.merge(
                [_positionAnimation, _rotationAnimation],
              ),
              builder: (context, child) {
                // 화면 너비 계산 (MediaQuery 사용)
                final screenWidth = MediaQuery.of(context).size.width;

                // 위치 계산 로직
                double leftPosition;

                if (_positionAnimation.value <= 0.25) {
                  // 첫 번째 단계: left=20에서 왼쪽 화면 밖으로 - 빠른 이동 (0~0.25)
                  final progress = (_positionAnimation.value * 4); // 0 to 1
                  final acceleratedProgress =
                      (progress * 2).clamp(0.0, 1.0); // 2배 속도, 최대 1로 제한
                  leftPosition = 20 - acceleratedProgress * 120; // 20 to -100
                } else {
                  // 두 번째 단계: 오른쪽 화면 밖에서 left=20까지 (0.25~1.0)
                  final progress =
                      (_positionAnimation.value - 0.25) / 0.75; // 0 to 1
                  final startPosition = screenWidth + 100; // 오른쪽 화면 밖 시작점
                  final endPosition = 20; // 목표 지점
                  leftPosition = startPosition -
                      progress *
                          (startPosition - endPosition); // 오른쪽 밖에서 left=20까지
                }

                // 회전 각도 계산
                double rotationAngle;
                if (_positionAnimation.value <= 0.25) {
                  // 첫 번째 단계: 회전수를 줄임 (예: 절반만 회전)
                  rotationAngle =
                      -_rotationAnimation.value * 0.5; // 회전 속도를 절반으로
                } else {
                  // 두 번째 단계: 정상 회전
                  rotationAngle = -_rotationAnimation.value;
                }

                return Positioned(
                  left: leftPosition,
                  bottom: 0.0,
                  child: Transform.rotate(
                    angle: rotationAngle,
                    child: SvgPicture.asset(
                      asset, // SVG 파일 경로
                    ),
                  ),
                );
              },
            )
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

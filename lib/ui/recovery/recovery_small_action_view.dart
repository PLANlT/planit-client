import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/ui/recovery/component/recovery_bg.dart';
import 'package:planit/ui/recovery/recovery_complete_view.dart';

import '../../theme/planit_colors.dart';
import '../../theme/planit_typos.dart';
import '../common/comopnent/planit_text.dart';
import '../common/view/default_layout.dart';
import 'component/recovery_timer.dart';

class RecoverySmallActionView extends StatefulWidget {
  static String get routeName => 'small';

  const RecoverySmallActionView({super.key});

  @override
  State<RecoverySmallActionView> createState() =>
      _RecoverySmallActionViewState();
}

class _RecoverySmallActionViewState extends State<RecoverySmallActionView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 120),
  )..forward();

  late final Animation<double> _animation = Tween(begin: 0.0, end: 1.0).animate(
    // 일정한 속도로 원을 그리도록
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ),
  );

  int _remainSeconds = 120;

  @override
  void initState() {
    super.initState();
    // 애니메이션 진행 상태 리스너
    _animationController.addListener(() {
      setState(() {
        // 매초 남은 시간 갱신
        _remainSeconds = (120 * (1 - _animationController.value)).round();
      });
    });

    // 애니메이션 완료 리스너
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.goNamed(RecoveryCompleteView.routeName);
      }
    });

    // 애니메이션 시작
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 좌우 패딩 40만 두고 화면 채우도록
    // 디바이스 height이 작다면 크기 더 작아지도록
    final Size deviceSize = MediaQuery.of(context).size;
    final double radius =
        deviceSize.height < 700 ? 120 : (deviceSize.width - 80.0) / 2;

    return DefaultLayout(
      // 테스트용 건너뛰기 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(RecoveryCompleteView.routeName),
      ),
      title: '회복 루틴',
      appBarColor: PlanitColors.transparent,
      extendBodyBehindAppBar: true,
      child: RecoveryBg(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PlanitText(
                '지금 할 수 있는\n가장 작은 행동 하나만 해보세요',
                textAlign: TextAlign.center,
                style: PlanitTypos.title1.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              Spacer(),
              RecoveryTimer(
                animation: _animation,
                radius: radius,
                remainSeconds: _remainSeconds,
              ),
              Spacer(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF1FFDB),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 24.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  spacing: 12.0,
                  children: [
                    PlanitText(
                      '예시',
                      style: PlanitTypos.title3.copyWith(
                        color: PlanitColors.black01,
                      ),
                    ),
                    PlanitText(
                      '💧 물 한 잔 마시기\n🤸 가볍게 스트레칭 하기\n🌬️ 창문 열기\n🚶 자리에서 일어나기',
                      style: PlanitTypos.body2.copyWith(
                        color: PlanitColors.black02,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

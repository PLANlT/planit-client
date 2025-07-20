import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/recovery/recovery_small_action_view.dart';

import '../../theme/planit_typos.dart';
import '../common/comopnent/planit_button.dart';
import '../common/comopnent/planit_text.dart';
import '../common/const/planit_button_style.dart';
import 'component/recovery_bg.dart';
import 'component/recovery_timer.dart';

class RecoveryDeepBreathView extends StatefulWidget {
  static String get routeName => 'breath';

  const RecoveryDeepBreathView({super.key});

  @override
  State<RecoveryDeepBreathView> createState() => _RecoveryDeepBreathViewState();
}

class _RecoveryDeepBreathViewState extends State<RecoveryDeepBreathView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 60),
  )..forward();

  late final Animation<double> _animation = Tween(begin: 0.0, end: 1.0).animate(
    // 일정한 속도로 원을 그리도록
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ),
  );

  int _remainSeconds = 60;

  @override
  void initState() {
    super.initState();
    // 애니메이션 진행 상태 리스너
    _animationController.addListener(() {
      setState(() {
        // 매초 남은 시간 갱신
        _remainSeconds = (60 * (1 - _animationController.value)).round();
      });
    });

    // 애니메이션 완료 리스너
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // TODO: 버튼 활성화
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
                '우선 1분 동안\n가볍게 심호흡을 해봐요',
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
              PlanitText(
                '생각을 잠시 멈추고 숨쉬는 것에만 집중하며,\n해야할 일을 받아들여요',
                textAlign: TextAlign.center,
                style: PlanitTypos.body2.copyWith(
                  color: PlanitColors.black02,
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: PlanitButton(
                  onPressed: () => context.goNamed(
                    RecoverySmallActionView.routeName,
                  ),
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '다음',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_complete/archiving_complete_naviagtor.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'dart:math' as math;

class ArchivingCompleteView extends StatefulWidget {
  static String get routeName => 'archiving-complete';
  final String icon;
  final String title;

  const ArchivingCompleteView({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  State<ArchivingCompleteView> createState() => _ArchivingCompleteViewState();
}

class _ArchivingCompleteViewState extends State<ArchivingCompleteView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 3));
      if (mounted) {
        context.pushNamed(
          ArchivingCompleteNavigator.routeName,
          pathParameters: {'title': widget.title, 'icon': widget.icon},
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultLayout(
      child: Stack(
        children: [
          // 버튼은 화면 아래에 고정
          Positioned(
            bottom: 80,
            left: 12,
            right: 12,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: TextBoxAnimation(title: widget.title)),
          ),
          //궤도 이미지 밑에서 부터 올라옴
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.2),
              child:
                  Align(alignment: Alignment.center, child: OrbitAnimation()),
            ),
          ),
          // 궤도타고 둥글게 도는 별들
          Positioned(right: 0, top: 340, child: OrbitingImageWidget()),
          Positioned(left: 70, top: 235, child: OrbitingImage2Widget()),
          //마스코트 별 위에서 부터 올라옴
          Positioned.fill(
            child:
                Align(alignment: Alignment.center, child: MainStarAnimation()),
          ),

          // PlaniT 로고 opacity 0 > 1
          Positioned(top: 96, left: 24, right: 24, child: TextAnimation()),

          //효과선 위에서 부터 올라옴
          Positioned(bottom: 360, left: 40, child: LineAnimation(height: 80)),
          Positioned(bottom: 420, left: 60, child: LineAnimation(height: 48)),
          Positioned(bottom: 510, right: 60, child: LineAnimation(height: 80)),
          Positioned(bottom: 539, right: 40, child: LineAnimation(height: 80)),
        ],
      ),
    );
  }
}

class LineAnimation extends StatefulWidget {
  final double height;
  const LineAnimation({super.key, required this.height});
  @override
  _LineAnimationState createState() => _LineAnimationState();
}

class _LineAnimationState extends State<LineAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeOut,
        parent: _controller,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
            opacity: _opacityAnimation,
            child: Container(
              height: widget.height,
              width: 2,
              decoration: BoxDecoration(color: PlanitColors.black03),
            )),
      ),
    );
  }
}

class TextBoxAnimation extends StatefulWidget {
  final String title;
  final Duration duration;
  final Duration delay;

  const TextBoxAnimation({
    super.key,
    required this.title,
    this.duration = const Duration(seconds: 2),
    this.delay = const Duration(milliseconds: 300),
  });

  @override
  _TextBoxAnimationState createState() => _TextBoxAnimationState();
}

class _TextBoxAnimationState extends State<TextBoxAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // 지연 후 애니메이션 시작
    Future.delayed(widget.delay, () {
      if (mounted) {
        _startAnimation();
      }
    });
  }

  void _startAnimation() async {
    // 페이드 인
    await _controller.forward();

    // 잠깐 대기
    await Future.delayed(const Duration(seconds: 1));

    // 페이드 아웃
    if (mounted) {
      await _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            decoration: BoxDecoration(color: PlanitColors.white02),
            width: double.infinity,
            height: 103,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlanitText('플랜 ${widget.title} ', style: PlanitTypos.title2),
                PlanitText('하나의 행성계를 이루었어요!', style: PlanitTypos.body2)
              ],
            ),
          ),
        );
      },
    );
  }
}

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});
  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: PlanitText(
          'PLAN\nIT!',
          style: PlanitTypos.blackHansSansRegular120.copyWith(
            color: PlanitColors.black01,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OrbitAnimation extends StatefulWidget {
  const OrbitAnimation({super.key});
  @override
  _OrbitAnimationState createState() => _OrbitAnimationState();
}

class _OrbitAnimationState extends State<OrbitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeOut,
        parent: _controller,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: SvgPicture.asset(
            'assets/images/orbit.svg',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class MainStarAnimation extends StatefulWidget {
  const MainStarAnimation({super.key});
  @override
  _MainStarAnimationState createState() => _MainStarAnimationState();
}

class _MainStarAnimationState extends State<MainStarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeOut,
        parent: _controller,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.sizeOf(context).width;

    return Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SvgPicture.asset(
                'assets/mascots/archiving.svg',
                width: device - 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrbitingImageWidget extends StatefulWidget {
  const OrbitingImageWidget({super.key});

  @override
  _OrbitingImageWidgetState createState() => _OrbitingImageWidgetState();
}

class _OrbitingImageWidgetState extends State<OrbitingImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // 3초에 한 바퀴
      vsync: this,
    );

    _animation = Tween<double>(
      begin: math.pi / 7,
      end: math.pi / 1.89,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _opacityAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.1, 1.0, curve: Curves.easeIn), // 80%~100% 구간에서만 실행
    ));
    _controller.forward(); // 무한 반복
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(
              360 * math.cos(_animation.value * 2), // 2배 빠른 속도
              400 * math.sin(_animation.value * 2),
            ),
            child: FadeTransition(
                opacity: _opacityAnimation,
                child: SvgPicture.asset('assets/images/orbit_star.svg')));
      },
    );
  }
}

class OrbitingImage2Widget extends StatefulWidget {
  const OrbitingImage2Widget({super.key});

  @override
  _OrbitingImage2WidgetState createState() => _OrbitingImage2WidgetState();
}

class _OrbitingImage2WidgetState extends State<OrbitingImage2Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;
  double radius = 0.5; // 궤도 반지름

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // 3초에 한 바퀴
      vsync: this,
    );

    _animation = Tween<double>(
      begin: math.pi / 4,
      end: math.pi / 10,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _opacityAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.1, 1.0, curve: Curves.easeInOut), // 80%~100% 구간에서만 실행
    ));
    _controller.forward(); // 무한 반복
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(
              360 * math.cos(_animation.value * 2),
              360 * math.sin(_animation.value * 2),
            ),
            child: FadeTransition(
                opacity: _opacityAnimation,
                child: SvgPicture.asset('assets/images/orbit_star2.svg')));
      },
    );
  }
}

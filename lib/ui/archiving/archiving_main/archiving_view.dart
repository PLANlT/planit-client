// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:planit/repository/archiving/model/archiving_plan_model.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_detail/archiving_detail_view.dart';
import 'package:planit/ui/archiving/archiving_main/archiving_view_model.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class ArchivingView extends HookConsumerWidget {
  static String get routeName => 'archiving';

  const ArchivingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final cardWidth = deviceWidth * 0.6;
    final aspectRatio = 223 / 300;
    final viewmodel = ref.read(archivingViewModelProvider.notifier);
    final state = ref.watch(archivingViewModelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewmodel.init();
      });
      return null;
    }, []);

    return DefaultLayout(
      extendBodyBehindAppBar: true,
      child: Stack(
        children: [
          Positioned.fill(
            top: 130,
            child: Align(
              alignment: Alignment.topCenter,
              child: FloatingStarWidget(
                assetPath: 'assets/mascots/jumping.svg',
                width: 160,
                fadeDelay: Duration(seconds: 0),
                animationRange: 30.0, // 위아래 15픽셀씩 움직임 (총 30픽셀 범위)
                duration: Duration(milliseconds: 800), // 1.8초 주기
              ),
            ),
          ),
          Positioned(
            top: 80, // 적절한 위치에 배치
            left: 0,
            right: 0,
            child: ContinuousFlowSlidingWidget(
              animationDuration: Duration(seconds: 15),
              delay: 0,
            ),
          ),
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: PlanitColors.transparent,
              ),

              // 제목 섹션
              Column(
                spacing: 4,
                children: [
                  PlanitText(
                    '기억 속의 플랜들',
                    style: PlanitTypos.title1.copyWith(
                      fontSize: 28,
                      color: PlanitColors.black01,
                    ),
                  ),
                  PlanitText(
                    '그동안의 여정을 다시 떠올려보세요.',
                    style: PlanitTypos.body3.copyWith(
                      fontWeight: FontWeight.w400,
                      color: PlanitColors.black01,
                    ),
                  ),
                ],
              ),

              // 애니메이션 공간 확보 (투명)
              SizedBox(height: 230),

              // 카드 스크롤 섹션

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 52),
                child: state.archivingPlans.isNotEmpty
                    ? SizedBox(
                        height: cardWidth / aspectRatio,
                        child: ArchivePlanScroll(
                          viewmodel: viewmodel,
                          plans: state.archivingPlans,
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(height: 88),
                          PlanitText(
                            '아직 플랜이\n존재하지 않아요!',
                            style: PlanitTypos.body3
                                .copyWith(color: PlanitColors.black03),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 위아래로 움직이는 별 애니메이션 위젯 (딜레이 후 opacity 애니메이션)
class FloatingStarWidget extends StatefulWidget {
  final String assetPath;
  final double width;
  final double animationRange; // 위아래 움직이는 범위 (기본 20픽셀)
  final Duration duration; // 애니메이션 주기 (기본 2초)
  final Duration fadeDelay; // opacity 시작 전 딜레이 (기본 1초)

  const FloatingStarWidget({
    super.key,
    required this.assetPath,
    this.width = 160,
    this.animationRange = 20.0,
    this.duration = const Duration(seconds: 2),
    this.fadeDelay = const Duration(seconds: 1), // 1초 후에 fade 시작
  });

  @override
  _FloatingStarWidgetState createState() => _FloatingStarWidgetState();
}

class _FloatingStarWidgetState extends State<FloatingStarWidget>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _opacityController;
  late Animation<double> _floatAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // 위아래 움직임 컨트롤러
    _floatController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // opacity 컨트롤러 (2초 고정)
    _opacityController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // 위아래 움직임 애니메이션
    _floatAnimation = Tween<double>(
      begin: -widget.animationRange / 2,
      end: widget.animationRange / 2,
    ).animate(CurvedAnimation(
      parent: _floatController,
      curve: Curves.easeInOut,
    ));

    // opacity 애니메이션
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut));

    // 즉시 위아래 움직임 시작
    _floatController.repeat(reverse: true);

    // 딜레이 후 opacity 애니메이션 시작
    Future.delayed(widget.fadeDelay, () {
      if (mounted) {
        _opacityController.forward();
      }
    });
  }

  @override
  void dispose() {
    _floatController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatAnimation, _opacityAnimation]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: SvgPicture.asset(
            widget.assetPath,
            width: widget.width,
          ),
        );
      },
    );
  }
}

class ContinuousFlowSlidingWidget extends StatefulWidget {
  final int delay;
  final Duration animationDuration;
  final int svgCount;

  const ContinuousFlowSlidingWidget({
    super.key,
    required this.delay,
    this.animationDuration = const Duration(seconds: 15),
    this.svgCount = 3,
  });

  @override
  _ContinuousFlowSlidingWidgetState createState() =>
      _ContinuousFlowSlidingWidgetState();
}

class _ContinuousFlowSlidingWidgetState
    extends State<ContinuousFlowSlidingWidget> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late int _svgIntervalMs;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _svgIntervalMs = (widget.animationDuration.inMilliseconds * 0.25)
        .round()
        .clamp(2000, 4000);

    _controllers = List.generate(
        widget.svgCount,
        (index) => AnimationController(
              vsync: this,
            ));

    // 모든 애니메이션을 오른쪽에서 시작하도록 초기 설정
    _animations = _controllers
        .map((controller) => Tween<double>(begin: 1.0, end: -3.2)
            .animate(CurvedAnimation(parent: controller, curve: Curves.linear)))
        .toList();

    _startContinuousAnimation();
  }

  void _startContinuousAnimation() {
    Future.delayed(Duration(seconds: widget.delay), () {
      _startFirstSvg();
    });
  }

  void _startFirstSvg() {
    if (!mounted) return;

    // 첫 번째 SVG도 같은 거리를 이동하도록 설정
    // 하지만 중간에서 시작하는 효과를 위해 애니메이션을 일부 진행된 상태로 시작
    final totalDistance = 1.0 - (-3.2);
    final startPosition = -0.05;
    final remainingDistance = startPosition - (-3.2);

    // 이동거리에 비례해서 duration 조정하여 속도를 맞춤
    final speedAdjustedDuration = Duration(
        milliseconds: (widget.animationDuration.inMilliseconds *
                remainingDistance /
                totalDistance)
            .round());
    _controllers[0].duration = speedAdjustedDuration;
    _animations[0] = Tween<double>(begin: startPosition, end: -3.2).animate(
        CurvedAnimation(parent: _controllers[0], curve: Curves.linear));

    _controllers[0].reset();
    _controllers[0].forward();

    _currentIndex = 1;

    _startContinuousFlow();
  }

  void _startContinuousFlow() {
    if (!mounted) return;
    _startNextSvg();
  }

  void _startNextSvg() {
    if (!mounted) return;

    final index = _currentIndex % widget.svgCount;

    // 모든 SVG가 같은 속도로 이동하도록 duration 설정
    _controllers[index].duration = widget.animationDuration;
    _animations[index] = Tween<double>(begin: 0.96, end: -3.2).animate(
        CurvedAnimation(parent: _controllers[index], curve: Curves.linear));

    _controllers[index].reset();
    _controllers[index].forward().then((_) {
      if (mounted) {
        Future.microtask(() => _startSvgAtIndex(index));
      }
    });

    _currentIndex++;

    Future.delayed(Duration(milliseconds: _svgIntervalMs), () {
      if (mounted) {
        _startNextSvg();
      }
    });
  }

  void _startSvgAtIndex(int index) {
    if (!mounted) return;

    _controllers[index].duration = widget.animationDuration;
    _animations[index] = Tween<double>(begin: 1.0, end: -3.2).animate(
        CurvedAnimation(parent: _controllers[index], curve: Curves.linear));

    _controllers[index].reset();
    _controllers[index].forward().then((_) {
      if (mounted) {
        Future.microtask(() => _startSvgAtIndex(index));
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        child: Stack(
          children: List.generate(widget.svgCount, (index) {
            return AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    MediaQuery.of(context).size.width *
                        _animations[index].value,
                    0,
                  ),
                  child: SvgPicture.asset(
                    'assets/mascots/jumping_planet.svg',
                    width: 600,
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

class ArchivePlanCard extends StatelessWidget {
  final ArchivingPlanModel plan;

  const ArchivePlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: PlanitColors.white02,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            plan.icon.endsWith('.svg') ? plan.icon : '${plan.icon}.svg',
            width: 100,
            height: 100,
            placeholderBuilder: (context) => Container(
              width: 100,
              height: 100,
              color: PlanitColors.white03,
            ),
          ),
          PlanitText(plan.title, style: PlanitTypos.title2),
          PlanitText(
            '${plan.completedDaysAgo}일 전 완료',
            style: PlanitTypos.body3.copyWith(
              color: Color(0xFF666666),
            ),
          ),
          PlanitText(
            '${plan.progressDays}일동안 진행했어요!',
            style: PlanitTypos.body3.copyWith(
              color: PlanitColors.alert,
              fontWeight: FontWeight.w400,
            ),
          ),
          // 동기 없을 때 비노출
          if (plan.motivation.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: PlanitColors.white01,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: PlanitColors.white03),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: PlanitText(
                    plan.motivation,
                    style: PlanitTypos.body3.copyWith(
                      color: PlanitColors.black03,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ArchivePlanScroll extends StatefulWidget {
  final List<ArchivingPlanModel> plans;

  final ArchivingViewModel viewmodel;

  const ArchivePlanScroll({
    super.key,
    required this.plans,
    required this.viewmodel,
  });

  @override
  State<ArchivePlanScroll> createState() => _ArchivePlanScrollState();
}

class _ArchivePlanScrollState extends State<ArchivePlanScroll> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = 223 / 300;
    final cardHeight = MediaQuery.of(context).size.width * 0.7 / aspectRatio;

    return SizedBox(
      height: cardHeight + 40,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: _pageController,
        itemCount: widget.plans.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double currentPage = 0;
              try {
                currentPage = _pageController.page ??
                    _pageController.initialPage.toDouble();
              } catch (_) {}

              final distance = (currentPage - index).abs();
              final lift = 20.0 * (1 - distance.clamp(0.0, 1.0));

              return Transform.translate(
                offset: Offset(0, -lift),
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: GestureDetector(
                    onTap: () async {
                      final result = await context.pushNamed(
                        ArchivingDetailView.routeName,
                        pathParameters: {
                          'planId': widget.plans[index].planId.toString()
                        },
                      );
                      if (result == true) {
                        widget.viewmodel.init();
                      }
                    },
                    child: ArchivePlanCard(plan: widget.plans[index])),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: PlanitColors.transparent,
          ),
          Column(
            spacing: 4,
            children: [
              PlanitText('기억 속의 플랜들',
                  style: PlanitTypos.title1.copyWith(fontSize: 28)),
              PlanitText('그동안의 여정을 다시 떠올려보세요.',
                  style:
                      PlanitTypos.body3.copyWith(fontWeight: FontWeight.w400)),
            ],
          ),
          SvgPicture.asset('assets/mascots/jumping.svg'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 52),
            child: SizedBox(
              height: cardWidth / aspectRatio,
              child: ArchivePlanScroll(
                plans: state.archivingPlans,
              ),
            ),
          ), // 위로 lift 되는 카드
        ],
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
          PlanitText('${plan.completedDaysAgo}일 전 완료',
              style: PlanitTypos.body3.copyWith(color: Color(0xFF666666))),
          PlanitText('${plan.progressDays}일동안 진행했어요!',
              style: PlanitTypos.body3.copyWith(
                  color: PlanitColors.alert, fontWeight: FontWeight.w400)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                color: PlanitColors.white01,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: PlanitColors.white03),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: PlanitText(plan.motivation,
                      style: PlanitTypos.body3
                          .copyWith(color: PlanitColors.black03)),
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
  const ArchivePlanScroll({super.key, required this.plans});

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
                    onTap: () {
                      context.pushNamed(
                        ArchivingDetailView.routeName,
                        pathParameters: {
                          'planId': widget.plans[index].planId.toString()
                        },
                      );
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

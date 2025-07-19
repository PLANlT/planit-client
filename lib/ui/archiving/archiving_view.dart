import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_detail_view.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class ArchivingView extends StatelessWidget {
  const ArchivingView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final cardWidth = deviceWidth * 0.6;
    final aspectRatio = 223 / 300;
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
              child: ArchivePlanScroll(),
            ),
          ), // 위로 lift 되는 카드
        ],
      ),
    );
  }
}

class ArchivePlanCard extends StatelessWidget {
  final int index;
  const ArchivePlanCard({super.key, required this.index});
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
            Assets.planet1,
            width: 100,
            height: 100,
          ),
          PlanitText('다이어트', style: PlanitTypos.title2),
          PlanitText('2일 전 완료',
              style: PlanitTypos.body3.copyWith(color: Color(0xFF666666))),
          PlanitText('365일동안 진행했어요!',
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
                  child: PlanitText('매일 조금씩, 꾸준히 나아가자',
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
  const ArchivePlanScroll({super.key});

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
        itemCount: 5,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArchivingDetailView()));
                    },
                    child: ArchivePlanCard(index: index)),
              ),
            ),
          );
        },
      ),
    );
  }
}

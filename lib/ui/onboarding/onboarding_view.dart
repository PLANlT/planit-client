import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/onboarding/onboarding_first_tap.dart';
import 'package:planit/ui/onboarding/onboarding_fourth_tap.dart';
import 'package:planit/ui/onboarding/onboarding_second_tap.dart';
import 'package:planit/ui/onboarding/onboarding_third_tap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  static String get routeName => 'onboarding';

  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                dotColor: PlanitColors.white03,
                activeDotColor: PlanitColors.black02,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Widget> pages = <Widget>[
  const OnboardingFirstTap(),
  const OnboardingSecondTap(),
  const OnboardingThirdTap(),
  const OnboardingFourthTap(),
];

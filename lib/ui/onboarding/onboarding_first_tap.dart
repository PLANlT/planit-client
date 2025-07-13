import 'package:flutter/material.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/onboarding/onboarding_layout.dart';

class OnboardingFirstTap extends StatelessWidget {
  const OnboardingFirstTap({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: '계획은 세웠지만,\n실행은 늘 어려웠죠.',
      description: '감정이나 컨디션이 따라주지 않을 때,\n작은 실행조차도 막막하게 느껴졌다면.',
      asset: Assets.onboarding1,
      showButton: false,
    );
  }
}

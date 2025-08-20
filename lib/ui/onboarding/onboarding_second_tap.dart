import 'package:flutter/material.dart';

import '../common/assets.dart';
import 'onboarding_layout.dart';

class OnboardingSecondTap extends StatelessWidget {
  const OnboardingSecondTap({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: 'PLANIT으로\n나의 목표를 관리해요',
      description: '목표를 세워\n나만의 행성계를 만들어보세요.',
      asset: Assets.onboarding2,
      showButton: false,
    );
  }
}
import 'package:flutter/material.dart';

import '../common/assets.dart';
import 'onboarding_layout.dart';

class OnboardingFourthTap extends StatelessWidget {
  const OnboardingFourthTap({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: '작은 성공을 쌓아\n목표를 달성하세요',
      description: '한 걸음, 한 걸음...\n힘든 순간에도 놓치 않은 작은 성공들이 쌓여\n우리의 목표 달성을 도와줘요.',
      asset: Assets.onboarding4,
      showButton: false,
    );
  }
}

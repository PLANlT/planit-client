import 'package:flutter/material.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/onboarding/onboarding_layout.dart';

class OnboardingFourthTap extends StatelessWidget {
  const OnboardingFourthTap({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: '하루치 작은 성공,\n그게 전부면 충분해요.',
      description:
          '매일 한 걸음씩,\n작은 실행을 쌓아 큰 목표에 도달해요.\n완벽보다 가능한 오늘을 PLANIT과 함께해요.',
      asset: Assets.onboarding4,
      showButton: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/onboarding/onboarding_layout.dart';

class OnboardingThirdTap extends StatelessWidget {
  const OnboardingThirdTap({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: '실패해도 괜찮아요.\n‘길티프리 모드’가 있어요.',
      description:
          '최근 실행이 어렵다면,\n스스로를 비난하지 말고 잠시 쉬어가요.\nPLANIT은 다시 시작할 준비가 되었을 때\n당신을 기다릴게요.',
      asset: Assets.onboarding3,
      showButton: false,
    );
  }
}

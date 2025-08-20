import 'package:flutter/material.dart';

import '../common/assets.dart';
import 'onboarding_layout.dart';

class OnboardingThirdTap extends StatelessWidget {
  const OnboardingThirdTap({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: '할 일을\n컨디션에 따라 나누세요',
      description:
          '힘든 컨디션이라도 해낼 수 있는\n한 걸음을 스스로 정하고,\n아주 조금씩이라도 실천해봐요.\n\n하루의 컨디션 때문에\n계획 전체를 포기하는 날은 없어질 거에요!',
      asset: Assets.onboarding3,
      showButton: false,
    );
  }
}

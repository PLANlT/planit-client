import 'dart:async';
import 'package:flutter/material.dart';

import '../common/assets.dart';
import 'onboarding_layout.dart';

class OnboardingSecondTap extends StatefulWidget {
  const OnboardingSecondTap({super.key});

  @override
  State<OnboardingSecondTap> createState() => _OnboardingSecondTapState();
}

class _OnboardingSecondTapState extends State<OnboardingSecondTap> {
  late Timer _timer;
  int _currentIndex = 0;

  final List<String> _descriptions = [
    '목표를 세워\n나만의 행성계를 만들어보세요.',
    '힘든 컨디션이라도 해낼 수 있는\n오늘 할 수 있는 플랜을 추천받고',
    '작은성공을 기록할 수록\n우리는 더욱 계획 목표 달성에 욕심을\n내게 돼요.',
  ];

  final List<String> _assets = [
    Assets.onboarding2_1,
    Assets.onboarding2_2,
    Assets.onboarding2_3,
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _descriptions.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      title: 'PLANIT은\n이렇게 도와줘요.',
      description: _descriptions[_currentIndex],
      asset: _assets[_currentIndex],
      showButton: false,
    );
  }
}
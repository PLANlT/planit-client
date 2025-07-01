import 'package:flutter/material.dart';

@immutable
class PlanitTypos {
  const PlanitTypos._();

  // Design system
  static const TextStyle title1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.48, // -0.02 * 24
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.4, // -0.02 * 20
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.32, // -0.02 * 16
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: -0.4, // -0.02 * 20
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: -0.32, // -0.02 * 16
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle body3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: -0.28, // -0.02 * 14
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: -0.24, // -0.02 * 12
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  // Etc
  static const TextStyle pretendardBlack120 = TextStyle(
    fontSize: 120,
    fontWeight: FontWeight.w900,
    height: 1.5,
    letterSpacing: -2.4, // -0.02 * 120
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle pretendardBlack90 = TextStyle(
    fontSize: 90,
    fontWeight: FontWeight.w900,
    height: 1.0,
    letterSpacing: -1.8, // -0.02 * 90
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle pretendardBlack60 = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w900,
    height: 1.5,
    letterSpacing: -1.2, // -0.02 * 60
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle pretendardBlack40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    height: 1.0,
    letterSpacing: -0.8, // -0.02 * 40
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'Pretendard',
  );

  static const TextStyle blackHansSansRegular48 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: -0.48, // -0.01 * 48
    leadingDistribution: TextLeadingDistribution.proportional,
    fontFamily: 'BlackHanSans',
  );
}
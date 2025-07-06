import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

class UserConsecutiveDaysWidget extends StatelessWidget {
  final int currentConsecutiveDays;
  final int maxConsecutiveDays;
  final int perfectConsecutiveDays;

  const UserConsecutiveDaysWidget({
    super.key,
    required this.currentConsecutiveDays,
    required this.maxConsecutiveDays,
    required this.perfectConsecutiveDays,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        Expanded(
          child: _Box(
            text: '현재 연속일',
            number: currentConsecutiveDays,
          ),
        ),
        Expanded(
          child: _Box(
            text: '연속일 최고기록',
            number: maxConsecutiveDays,
          ),
        ),
        Expanded(
          child: _Box(
            text: '완벽 연속일',
            number: perfectConsecutiveDays,
          ),
        ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  final String text;
  final int number;

  const _Box({
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsetsGeometry.symmetric(vertical: 10.0, horizontal: 4.0),
      child: Column(
        spacing: 4.0,
        children: [
          PlanitText(
            text,
            style: PlanitTypos.body3.copyWith(
              color: PlanitColors.black03,
            ),
          ),
          PlanitText(
            number.toString(),
            style: PlanitTypos.title1.copyWith(
              color: PlanitColors.black01,
            ),
          ),
        ],
      ),
    );
  }
}

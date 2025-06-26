import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';

class PlanitToast extends StatelessWidget {
  final String label;

  const PlanitToast({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37.0),
        color: PlanitColors.black02.withValues(alpha: 0.7),
      ),
      child: Center(
        child: Text(
          label,
          style: PlanitTypos.body3.copyWith(
            color: PlanitColors.white01,
          ),
        ),
      ),
    );
  }
}

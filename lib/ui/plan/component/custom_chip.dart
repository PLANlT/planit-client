import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

class PlanCreateChip extends StatelessWidget {
  final String title;
  final Color backgroundcolor;
  final Color textcolor;
  final Color bordercolor;
  const PlanCreateChip({
    super.key,
    required this.title,
    required this.backgroundcolor,
    required this.textcolor,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.all(Radius.circular(32)),
        border: Border.all(
          color: bordercolor,
          width: 1.5,
        ),
      ),
      child: Center(
        child: PlanitText(title,
            style: PlanitTypos.body3.copyWith(color: PlanitColors.black03)),
      ),
    );
  }
}

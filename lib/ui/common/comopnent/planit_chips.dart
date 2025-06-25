import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';

/// PlanitChipsColor는 enum값으로, 칩 스타일입니다
/// onTap은 선택값입니다
class PlanitChips extends StatelessWidget {
  final PlanitChipsColor chipsColor;
  final String label;
  final Function()? onTap;

  const PlanitChips({
    super.key,
    required this.chipsColor,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = (chipsColor == PlanitChipsColor.black)
        ? PlanitColors.black01
        : PlanitColors.white02;

    final Color labelColor = (chipsColor == PlanitChipsColor.black)
        ? PlanitColors.white01
        : PlanitColors.black01;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(37.0),
          color: backgroundColor,
        ),
        child: PlanitText(
          label,
          style: PlanitTypos.body3.copyWith(
            color: labelColor,
          ),
        ),
      ),
    );
  }
}

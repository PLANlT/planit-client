import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

class CustomChip extends StatelessWidget {
  final String title;
  const CustomChip({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: PlanitColors.white03,
          width: 1.5,
        ),
      ),
      child: Center(
        child: PlanitText(title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: PlanitColors.black04)),
      ),
    );
  }
}

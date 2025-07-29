import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_toggle.dart';

class PlanitAlarmAllowWidget extends StatelessWidget {
  final String title;
  final bool isAllowed;
  final Function(bool) onToggle;

  const PlanitAlarmAllowWidget({
    super.key,
    required this.title,
    required this.isAllowed,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlanitText(
          title,
          style: PlanitTypos.body2.copyWith(
            color: PlanitColors.black01,
          ),
        ),
        PlanitToggle(
          onChanged: onToggle,
          isOn: isAllowed,
        ),
      ],
    );
  }
}

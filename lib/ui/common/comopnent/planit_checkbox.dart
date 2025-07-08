import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/planit_colors.dart';
import '../assets.dart';

class PlanitCheckbox extends StatelessWidget {
  final bool isChecked;

  const PlanitCheckbox({
    super.key,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.white01,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: 20.0,
      height: 20.0,
      child: Padding(
        padding: EdgeInsetsGeometry.all(4.0),
        child: isChecked
            ? SvgPicture.asset(
                Assets.check,
              )
            : SizedBox.shrink(),
      ),
    );
  }
}

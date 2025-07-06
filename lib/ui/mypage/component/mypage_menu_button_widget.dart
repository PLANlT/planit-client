import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

class MypageMenuButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const MypageMenuButtonWidget({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PlanitColors.white02,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsetsGeometry.symmetric(
          vertical: 14.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PlanitText(
              label,
              style: PlanitTypos.body3.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            SvgPicture.asset(Assets.chevronRight),
          ],
        ),
      ),
    );
  }
}

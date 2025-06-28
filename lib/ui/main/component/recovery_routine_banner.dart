import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/assets.dart';
import '../../common/comopnent/planit_text.dart';

class RecoveryRoutineBanner extends StatelessWidget {
  const RecoveryRoutineBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.green,
        borderRadius: BorderRadiusGeometry.circular(12.0),
      ),
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlanitText(
            '할 일 시작이 어려우신가요?',
            style: PlanitTypos.body2.copyWith(
              color: PlanitColors.white01,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.x,
              colorFilter: ColorFilter.mode(
                PlanitColors.white01,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/ui/recovery/recovery_intro_view.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/comopnent/planit_text.dart';

class RecoveryRoutineBanner extends StatelessWidget {
  const RecoveryRoutineBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(RecoveryIntroView.routeName),
      child: Container(
        decoration: BoxDecoration(
          color: PlanitColors.green,
          borderRadius: BorderRadiusGeometry.circular(12.0),
        ),
        padding: EdgeInsetsGeometry.symmetric(
          vertical: 16.0,
        ),
        child: Center(
          child: PlanitText(
            '할 일 시작이 어려우신가요?',
            style: PlanitTypos.body2.copyWith(
              color: PlanitColors.white01,
            ),
          ),
        ),
      ),
    );
  }
}

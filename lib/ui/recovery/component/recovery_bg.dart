import 'package:flutter/material.dart';

import '../../../theme/planit_colors.dart';

class RecoveryBg extends StatelessWidget {
  final Widget child;

  const RecoveryBg({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            PlanitColors.gradient1,
            PlanitColors.gradient2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';

class PlanitDimLoading extends StatelessWidget {
  const PlanitDimLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: PlanitColors.black02.withValues(alpha: 0.4),
      child: Center(
        child: PlanitLoading(),
      ),
    );
  }
}

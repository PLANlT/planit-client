import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';

class PlanitLoading extends StatelessWidget {
  const PlanitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: PlanitColors.primary,
    );
  }
}

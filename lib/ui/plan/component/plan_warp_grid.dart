import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';

class PlanetWrapGrid extends StatelessWidget {
  const PlanetWrapGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> planetAssets = [
      'assets/planets/planet1.svg',
      'assets/planets/planet2.svg',
      'assets/planets/planet3.svg',
      'assets/planets/planet4.svg',
      'assets/planets/planet5.svg',
      'assets/planets/planet6.svg',
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: planetAssets.map((asset) {
          return Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: PlanitColors.white02,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(asset),
          );
        }).toList(),
      ),
    );
  }
}

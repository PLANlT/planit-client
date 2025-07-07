import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/assets.dart';

class PlanetWrapGrid extends StatelessWidget {
  final String? selectedIcon;
  final void Function(String Icon) onSelect;
  const PlanetWrapGrid({super.key, this.selectedIcon, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final List<String> planetAssets = [
      Assets.planet1,
      Assets.planet2,
      Assets.planet3,
      Assets.planet4,
      Assets.planet5,
      Assets.planet6,
    ];
    return Wrap(
      spacing: 16,
      runSpacing: 20,
      children: planetAssets.map((asset) {
        final isSelected = asset == selectedIcon;
        return GestureDetector(
          onTap: () => onSelect(asset),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: PlanitColors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: PlanitColors.alert)
                  : null, //임시
            ),
            child: SvgPicture.asset(
              asset,
            ),
          ),
        );
      }).toList(),
    );
  }
}

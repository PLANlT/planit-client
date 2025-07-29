import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';

class PlanetWrapGrid extends StatelessWidget {
  final String? selectedIcon;
  final void Function(String Icon) onSelect;
  const PlanetWrapGrid({super.key, this.selectedIcon, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final List<String> planetAssets = [
      'assets/planets/planet1',
      'assets/planets/planet2',
      'assets/planets/planet3',
      'assets/planets/planet4',
      'assets/planets/planet5',
      'assets/planets/planet6',
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
            ),
            child: isSelected
                ? SvgPicture.asset('${asset}_selected.svg')
                : SvgPicture.asset('${asset}_unselected.svg'),
          ),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';

// TODO: 마이페이지 구현 때 커스텀하기
class PlanitToggle extends StatelessWidget {
  final Function(bool) onChanged;
  final bool isOn;

  const PlanitToggle({
    super.key,
    required this.onChanged,
    required this.isOn,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isOn,
      onChanged: onChanged,
      activeColor: PlanitColors.white01,
      activeTrackColor: PlanitColors.black01,
      inactiveTrackColor: PlanitColors.white03,
      inactiveThumbColor: PlanitColors.white01,
    );
  }
}

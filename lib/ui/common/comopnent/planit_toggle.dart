import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';

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
    return GestureDetector(
      onTap: () => onChanged(!isOn),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 20,
        decoration: BoxDecoration(
          color: isOn ? PlanitColors.black01 : PlanitColors.white03,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: isOn ? 2 : 3, right: 2),
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: PlanitColors.white01,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

// class PlanitToggle extends StatelessWidget {
//   final Function(bool) onChanged;
//   final bool isOn;
//
//   const PlanitToggle({
//     super.key,
//     required this.onChanged,
//     required this.isOn,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Switch(
//       value: isOn,
//       onChanged: onChanged,
//       activeColor: PlanitColors.white01,
//       activeTrackColor: PlanitColors.black01,
//       inactiveTrackColor: PlanitColors.white03,
//       inactiveThumbColor: PlanitColors.white01,
//     );
//   }
// }

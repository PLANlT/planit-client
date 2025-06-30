import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

Widget conditionTipTableRow(String left, String right) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
    child: Table(
      columnWidths: {
        0: FlexColumnWidth(4),
        1: FixedColumnWidth(40),
        2: FlexColumnWidth(4),
      },
      children: [
        TableRow(children: [
          PlanitText(left,
              style: PlanitTypos.body3.copyWith(color: PlanitColors.black03)),
          Padding(
            padding: const EdgeInsets.only(right: double.infinity),
            child: Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 18,
              color: PlanitColors.black03,
            ),
          ),
          PlanitText(
            right,
            style: PlanitTypos.body3.copyWith(
              color: PlanitColors.black03,
            ),
          ),
        ]),
      ],
    ),
  );
}

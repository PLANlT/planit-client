import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

Widget conditionTipTableRow(String left, String right) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Table(
      columnWidths: {
        0: FlexColumnWidth(4),
        1: FixedColumnWidth(4),
        2: FlexColumnWidth(6),
      },
      children: [
        TableRow(children: [
          PlanitText(
            left,
            style: TextStyle(
              color: PlanitColors.black03,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right_sharp,
                size: 18,
                color: PlanitColors.black03,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: PlanitText(
              right,
              style: TextStyle(
                color: PlanitColors.black03,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ],
    ),
  );
}

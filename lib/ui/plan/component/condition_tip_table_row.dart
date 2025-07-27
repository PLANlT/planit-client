import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';

class ConditionTipTableRow extends StatelessWidget {
  final String left;
  final String right;

  const ConditionTipTableRow({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: PlanitText(
            left,
            style: PlanitTypos.body3.copyWith(color: PlanitColors.black03),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PlanitText(
            '→',
            style: PlanitTypos.body3.copyWith(color: PlanitColors.white03),
          ),
        ),
        Expanded(
          flex: 4,
          child: PlanitText(
            right,
            style: PlanitTypos.body3.copyWith(color: PlanitColors.black03),
          ),
        ),
      ],
    );
    // return Table(
    //   columnWidths: {
    //     0: const FlexColumnWidth(4),
    //     1: const FixedColumnWidth(40),
    //     2: const FlexColumnWidth(4),
    //   },
    //   children: [
    //     TableRow(children: [
    //       PlanitText(
    //         left,
    //         style: PlanitTypos.body3.copyWith(color: PlanitColors.black03),
    //       ),
    //       const Padding(
    //         padding: EdgeInsets.only(right: double.infinity),
    //         child: PlanitText('→',
    //             style: TextStyle(
    //               fontSize: 18,
    //               color: PlanitColors.black03,
    //             )),
    //       ),
    //       PlanitText(
    //         right,
    //         style: PlanitTypos.body3.copyWith(color: PlanitColors.black03),
    //       ),
    //     ]),
    //   ],
    // );
  }
}

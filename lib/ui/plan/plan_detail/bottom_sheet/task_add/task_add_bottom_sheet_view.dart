import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';

class TaskAddBottomSheetView extends StatelessWidget {
  final VoidCallback onConfirm;

  const TaskAddBottomSheetView({super.key, required this.onConfirm});
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      PlanitBottomSheet(
        content: Column(
          spacing: 8.0,
          children: [
            PlanitText('할 일을 생성해주세요', style: PlanitTypos.title3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: PlanitTextField(
                hintText: '내용을 입력해주세요',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  onConfirm();
                },
                child: PlanitText('생성', style: PlanitTypos.body2),
              ),
            ),
            Divider(
              color: PlanitColors.white03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: PlanitText('취소',
                  style: PlanitTypos.body2.copyWith(color: PlanitColors.alert)),
            )
          ],
        ),
      ),
    ]);
  }
}

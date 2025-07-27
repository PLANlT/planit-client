import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_bottom_sheet.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/comopnent/planit_text_field.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';

class TaskAddBottomSheetView extends StatefulWidget {
  final void Function(String title) onConfirm;

  const TaskAddBottomSheetView({super.key, required this.onConfirm});

  @override
  State<TaskAddBottomSheetView> createState() => _TaskAddBottomSheetViewState();
}

class _TaskAddBottomSheetViewState extends State<TaskAddBottomSheetView> {
  late final TextEditingController controller;

  // 텍스트필드 내 입력값 즉시 감지하기 위함
  bool isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController()
      ..addListener(() {
        final newValue = controller.text.isNotEmpty;
        if (isTextNotEmpty != newValue) {
          setState(() {
            isTextNotEmpty = newValue;
          });
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlanitBottomSheet(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
          top: 16,
        ),
        child: Column(
          children: [
            PlanitText(
              '할 일을 작성해주세요',
              style: PlanitTypos.title3.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            SizedBox(height: 16),
            PlanitTextField(
              hintText: '내용을 입력해주세요',
              controller: controller,
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () {
                  final title = controller.text.trim();
                  widget.onConfirm(title);
                  context.pop();
                },
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '생성하기',
                enabled: isTextNotEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

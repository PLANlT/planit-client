import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';

/// 기본 텍스트필드 컴포넌트입니다
/// 크기 조절이 필요하다면 본 위젯을 SizedBox로 wrap해주세요
/// SizedBox(
//   width: 80.0,
//   child: PlanitTextField(
//     hintText: '내용을 입력하세요',
//   ),
// ),
class PlanitTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? errorText;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool enabled;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;

  const PlanitTextField({
    super.key,
    this.onChanged,
    this.errorText,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.enabled = true,
    this.maxLength,
    this.focusNode,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: PlanitColors.white03,
        width: 1.0,
      ),
    );

    return TextField(
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      controller: controller,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 14.0,
        ),
        filled: true,
        fillColor: PlanitColors.white01,
        enabled: enabled,
        disabledBorder: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: BorderSide(
            color: PlanitColors.black01,
          ),
        ),
        errorText: errorText,
        errorStyle: PlanitTypos.caption.copyWith(
          color: PlanitColors.alert,
        ),
        errorBorder: baseBorder.copyWith(
          borderSide: BorderSide(
            color: PlanitColors.alert,
          ),
        ),
        focusedErrorBorder: baseBorder.copyWith(
          borderSide: BorderSide(
            color: PlanitColors.alert,
          ),
        ),
        hintText: hintText,
        hintStyle: PlanitTypos.body3.copyWith(
          color: PlanitColors.black04,
        ),
      ),
      style: PlanitTypos.body3.copyWith(
        color: PlanitColors.black01,
      ),
      cursorColor: PlanitColors.white03,
    );
  }
}

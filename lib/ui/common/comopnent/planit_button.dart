import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';

/// PlanitButtonColor는 enum값으로, 버튼 스타일입니다
/// 크기 조절이 필요하다면 본 위젯을 SizedBox로 wrap해주세요
/// 사용 예:
/// SizedBox(
//   width: 320.0,
//   child: PlanitButton(
//     onPressed: () {},
//     buttonColor: PlanitButtonColor.white,
//     buttonSize: PlanitButtonSize.large,
//     label: '시작하기',
//   ),
// );
/// Btn => PlanitButtonSize-large
/// Btn_min => PlanitButtonSize-smalll
class PlanitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final PlanitButtonColor buttonColor;
  final PlanitButtonSize buttonSize;
  final String label;
  final bool enabled;

  const PlanitButton({
    super.key,
    required this.onPressed,
    required this.buttonColor,
    required this.buttonSize,
    required this.label,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = (buttonColor == PlanitButtonColor.black)
        ? (enabled
            ? PlanitColors.black01
            : PlanitColors.black01.withValues(alpha: 0.5))
        : ((buttonColor == PlanitButtonColor.white)
            ? PlanitColors.white01
            : PlanitColors.red);

    final Color labelColor = (buttonColor == PlanitButtonColor.black ||
            buttonColor == PlanitButtonColor.red)
        ? PlanitColors.white01
        : PlanitColors.black01;

    final Color borderColor = (buttonColor == PlanitButtonColor.black)
        ? (enabled
            ? PlanitColors.black01
            : PlanitColors.black01.withValues(alpha: 0.5))
        : ((buttonColor == PlanitButtonColor.white)
            ? PlanitColors.white01
            : PlanitColors.red);

    final Color overlayColor = (buttonColor == PlanitButtonColor.black)
        ? PlanitColors.white02
        : PlanitColors.black04;

    final double radius = (buttonSize == PlanitButtonSize.large) ? 30.0 : 37.0;

    final double verticalPadding =
        (buttonSize == PlanitButtonSize.large) ? 12.0 : 8.0;

    final TextStyle textStyle = (buttonSize == PlanitButtonSize.large)
        ? PlanitTypos.body2
        : PlanitTypos.body3;

    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        overlayColor: overlayColor,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radius),
          side: BorderSide(
            color: borderColor,
            strokeAlign: 1.0,
          ),
        ),
      ),
      child: PlanitText(
        label,
        style: textStyle.copyWith(
          color: labelColor,
        ),
      ),
    );
  }
}

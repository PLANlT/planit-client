import 'package:flutter/material.dart';

/// Typo에 height를 적용하여, 텍스트가 바닥에 붙어있는 것처럼 보이게 됩니다.
/// 이를 해결하기 위해 textHeighBehavior 코드를 매번 작성하기에는 번거로움이 있어
/// 자동화하고자 본 위젯을 만들었습니다.
/// Text 위젯 대신 PlanitText를 사용하시면 됩니다.
class PlanitText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const PlanitText(
    this.text, {
    super.key,
    required this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textHeightBehavior: TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';

/// height는 선택입니다
/// content에 바텀시트 내부를 작성해주세요!
/// 사용 예:
/// onPressed: () => showModalBottomSheet(
//   context: context,
//   builder: (context) {
//     return PlanitBottomSheet(
//       height: 400.0,
//       content: Column(
//         spacing: 16.0,
//         children: [
//           Text('테스트'),
//           Text('테스트'),
//         ],
//       ),
//     );
//   },
// ),
class PlanitBottomSheet extends StatelessWidget {
  final Widget content;
  final double? height;

  const PlanitBottomSheet({
    super.key,
    required this.content,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      // 키보드 올라올 때 바텀시트가 키보드 위로 올라갈 수 있도록
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: PlanitColors.white01,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          bottom: 40.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PlanitBottomSheetHandle(),
            content,
          ],
        ),
      ),
    );
  }
}

class _PlanitBottomSheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: PlanitColors.white03,
      ),
      width: 60.0,
      height: 3.0,
      margin: EdgeInsetsGeometry.only(
        top: 10.0,
        bottom: 16.0,
      ),
    );
  }
}

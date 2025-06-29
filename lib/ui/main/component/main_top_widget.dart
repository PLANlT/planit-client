import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/assets.dart';
import '../const/main_enums.dart';

class MainTopWidget extends StatelessWidget {
  final RouteType type;
  final TaskStatus status;

  const MainTopWidget({
    super.key,
    required this.type,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // 루트 타입과 태스크 달성 상태에 따라 보여줄 마스코트 이미지를 가져옵니다
    String asset = getAsset(
      type: type,
      status: status,
    );

    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 20.0,
        right: 20.0,
        top: 40.0,
      ),
      child: SizedBox(
        height: 200.0,
        child: Stack(
          children: [
            Positioned(
              left: 0.0,
              child: IconButton(
                icon: SvgPicture.asset(Assets.profile),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
            Positioned(
              right: 0.0,
              child: IconButton(
                icon: SvgPicture.asset(Assets.guiltyFree),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              child: SvgPicture.asset(asset),
            ),
          ],
        ),
      ),
    );
  }
}

String getAsset({
  required RouteType type,
  required TaskStatus status,
}) {
  if (type == RouteType.slow) {
    if (status == TaskStatus.none) {
      return Assets.mascotSeatingMonochrome;
    } else {
      return Assets.mascotSeatingColor;
    }
  } else {
    if (status == TaskStatus.none) {
      return Assets.mascotDancingMonochrome;
    } else {
      return Assets.mascotDancingColor;
    }
  }
}

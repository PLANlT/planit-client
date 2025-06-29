import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/assets.dart';
import '../const/main_enums.dart';

class RouteSwitchBanner extends StatelessWidget {
  final RouteType type;
  final VoidCallback onLeftArrowPressed;
  final VoidCallback onRightArrowPressed;

  const RouteSwitchBanner({
    super.key,
    required this.type,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isSlow = type == RouteType.slow;

    return Container(
      height: 120.0,
      color: isSlow ? PlanitColors.blue : PlanitColors.pink,
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: 24.0,
            onPressed: onLeftArrowPressed,
            icon: SvgPicture.asset(Assets.arrowLeft),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isSlow ? '천천히 루트' : '열정 루트',
                style: isSlow
                    ? PlanitTypos.title2.copyWith(
                        color: PlanitColors.black01,
                      )
                    : PlanitTypos.title1.copyWith(
                        color: PlanitColors.black01,
                      ),
              ),
              Text(
                '오늘도 한 걸음이면 돼요.',
                style: PlanitTypos.caption.copyWith(
                  color: PlanitColors.white01,
                ),
              )
            ],
          ),
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: 24.0,
            onPressed: onRightArrowPressed,
            icon: SvgPicture.asset(Assets.arrowRight),
          ),
        ],
      ),
    );
  }
}

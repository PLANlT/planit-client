import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';

// 모든 view의 start 위젯입니다
class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final Color? appBarColor;

  const DefaultLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.appBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body와 AppBar가 겹치도록
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor ?? PlanitColors.white01,
      appBar: renderAppBar(context),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar(BuildContext context) {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: appBarColor ?? PlanitColors.white01,
        foregroundColor: PlanitColors.black01,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(Assets.chevronLeft),
        ),
        title: Text(
          title!,
          style: PlanitTypos.body2.copyWith(
            color: PlanitColors.black01,
          ),
        ),
      );
    }
  }
}

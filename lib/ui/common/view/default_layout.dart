import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';

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
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      // TODO: AppBar 커스텀
      return AppBar(
        backgroundColor: appBarColor ?? PlanitColors.white01,
        foregroundColor: PlanitColors.black01,
        elevation: 0,
        title: Text(
          title!,
          style: PlanitTypos.body2,
        ),
      );
    }
  }
}

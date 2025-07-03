import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';

class FirstCompleteView extends StatefulWidget {
  final int _consecutiveDays;

  const FirstCompleteView({
    super.key,
    required int consecutiveDays,
  }) : _consecutiveDays = consecutiveDays;

  @override
  State<FirstCompleteView> createState() => _FirstCompleteViewState();
}

class _FirstCompleteViewState extends State<FirstCompleteView> {
  bool _change = false;

  @override
  void initState() {
    super.initState();
    // 800ms 뒤 화면 변경되도록 카운트
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _change = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // device 크기 대응
    final Size deviceSize = MediaQuery.of(context).size;
    final topPadding = deviceSize.height < 732 ? 20.0 : 44.0;
    final bottomPadding = deviceSize.height < 732 ? 80.0 : 140.0;
    final widgetHeight = deviceSize.height < 700 ? 120.0 : 200.0;

    return Scaffold(
      backgroundColor: PlanitColors.white01,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: topPadding,
                bottom: bottomPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 연속일
                  // 800ms 후 위젯 변경 시 위치 고정되도록 공간 할당
                  SizedBox(
                    height: widgetHeight,
                    child: _AnimatedConsecutiveDays(
                      change: _change,
                      consecutiveDays: widget._consecutiveDays,
                    ),
                  ),
                  // 마스코트
                  // 800ms 후 위젯 변경 시 위치 고정되도록 공간 할당
                  SizedBox(
                    height: widgetHeight,
                    child: _AnimatedMascot(change: _change),
                  ),
                  _TextBox(
                    consecutiveDays: widget._consecutiveDays,
                  ),
                ],
              ),
            ),
            // 800ms 뒤에 버튼 노출
            if (_change)
              Positioned(
                bottom: 40.0,
                left: 0.0,
                right: 0.0,
                child: PlanitButton(
                  onPressed: () => Navigator.of(context).pop(),
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '닫기',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedConsecutiveDays extends StatelessWidget {
  final bool change;
  final int consecutiveDays;

  const _AnimatedConsecutiveDays({
    required this.change,
    required this.consecutiveDays,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
      ) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        key: ValueKey(change),
        child: PlanitText(
          consecutiveDays.toString(),
          style: change
              ? PlanitTypos.pretendardBlack120.copyWith(
                  color: PlanitColors.black01,
                )
              : PlanitTypos.pretendardBlack60.copyWith(
                  color: PlanitColors.black01,
                ),
        ),
      ),
    );
  }
}

class _AnimatedMascot extends StatelessWidget {
  const _AnimatedMascot({
    required bool change,
  }) : _change = change;

  final bool _change;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
      ) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: SvgPicture.asset(
        key: ValueKey(_change),
        _change ? Assets.mascotFirstComplete2 : Assets.mascotFirstComplete1,
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  final int consecutiveDays;

  const _TextBox({
    required this.consecutiveDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsGeometry.only(top: 20.0),
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 20.0,
        vertical: 28.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlanitText(
            '${consecutiveDays.toString()}일 째 달성!',
            style: PlanitTypos.title2.copyWith(
              color: PlanitColors.black01,
            ),
          ),
          SizedBox(height: 8.0),
          PlanitText(
            '남은 일들도',
            style: PlanitTypos.body1.copyWith(
              color: PlanitColors.black03,
            ),
          ),
          PlanitText(
            '빠르게 마감해볼까요?',
            style: PlanitTypos.body1.copyWith(
              color: PlanitColors.black03,
            ),
          ),
        ],
      ),
    );
  }
}

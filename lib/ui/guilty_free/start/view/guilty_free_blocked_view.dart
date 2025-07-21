import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/main/main_view.dart';

class GuiltyFreeBlockedView extends StatelessWidget {
  static String get routeName => 'guilty-blocked';

  const GuiltyFreeBlockedView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 20.0,
          vertical: 92.0,
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              PlanitText(
                '쉬고 싶었군요, 그치만...',
                style: PlanitTypos.title1.copyWith(color: PlanitColors.black01),
              ),
              Container(
                margin: EdgeInsetsGeometry.symmetric(vertical: 30.0),
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 26.0,
                  vertical: 14.0,
                ),
                decoration: BoxDecoration(
                  color: PlanitColors.white02,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: PlanitText(
                  '!',
                  style: PlanitTypos.title1.copyWith(
                    color: PlanitColors.red,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: PlanitColors.white02,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsetsGeometry.symmetric(vertical: 36.0),
                child: Column(
                  spacing: 32.0,
                  children: [
                    PlanitText(
                      '길티프리 모드는\n주에 1번만 사용 가능해요.',
                      textAlign: TextAlign.center,
                      style: PlanitTypos.body3.copyWith(
                        color: PlanitColors.black02,
                      ),
                    ),
                    PlanitText(
                      '이번주는 이미 사용하셨네요,\n계획을 더 쉽게 조정해볼까요?',
                      textAlign: TextAlign.center,
                      style: PlanitTypos.body3.copyWith(
                        color: PlanitColors.black02,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: PlanitButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MainView(),
                    ),
                  ),
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '오늘도 한 걸음 하기',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

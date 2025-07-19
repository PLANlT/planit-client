import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class MypageCustomerView extends StatelessWidget {
  static String get routeName => 'customer';

  const MypageCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '고객 문의',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20.0),
        child: Column(
          spacing: 102.0,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: PlanitText(
                '앱에 대한 피드백이나\n제안이 있다면\n아래 링크를 통해 알려주세요!',
                style: PlanitTypos.title2.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
            ),
            Column(
              spacing: 12.0,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PlanitButton(
                    onPressed: () {},
                    buttonColor: PlanitButtonColor.black,
                    buttonSize: PlanitButtonSize.large,
                    label: '문의 폼 열기',
                  ),
                ),
                PlanitText(
                  'Google Form으로 연결됩니다.',
                  style: PlanitTypos.caption.copyWith(
                    color: PlanitColors.black03,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

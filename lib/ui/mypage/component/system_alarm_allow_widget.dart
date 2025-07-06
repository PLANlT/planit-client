import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';

class SystemAlarmAllowWidget extends StatelessWidget {
  final VoidCallback onButtonTap;

  const SystemAlarmAllowWidget({
    super.key,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlanitText(
                '푸시 알림을 켜주세요.',
                style: PlanitTypos.body3.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              PlanitText(
                '시스템 알림을 켜야 앱 알림이 전송돼요.',
                style: PlanitTypos.caption.copyWith(
                  color: PlanitColors.black03,
                ),
              ),
            ],
          ),
          PlanitButton(
            onPressed: onButtonTap,
            buttonColor: PlanitButtonColor.black,
            buttonSize: PlanitButtonSize.small,
            label: '알림 켜기',
          ),
        ],
      ),
    );
  }
}

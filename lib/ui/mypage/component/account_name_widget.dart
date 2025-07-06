import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/assets.dart';
import '../../common/comopnent/planit_text.dart';

class AccountNameWidget extends StatelessWidget {
  final String userName;

  const AccountNameWidget({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.0,
      children: [
        Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 정렬 맞추기용
            SizedBox(width: 16.0,),
            PlanitText(
              userName,
              style: PlanitTypos.body1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            SvgPicture.asset(
              Assets.edit,
              width: 16.0,
            ),
          ],
        ),
        PlanitText(
          '설정하신 닉네임으로 불러드릴게요.',
          style: PlanitTypos.body3.copyWith(
            color: PlanitColors.black03,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/ui/mypage/view/mypage_account_view.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/assets.dart';
import '../../common/comopnent/planit_text.dart';

class UserAccountInfoWidget extends StatelessWidget {
  final String userName;
  final String userEmail;

  const UserAccountInfoWidget({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MypageAccountView(),
        ),
      ),
      // 터치영역 확장을 위해 배경있는 컨테이너 사용
      child: Container(
        color: PlanitColors.white01,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 4.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanitText(
                  userName,
                  style: PlanitTypos.body1.copyWith(
                    color: PlanitColors.black01,
                  ),
                ),
                PlanitText(
                  userEmail,
                  style: PlanitTypos.body3.copyWith(
                    color: PlanitColors.black03,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(Assets.chevronRight),
          ],
        ),
      ),
    );
  }
}

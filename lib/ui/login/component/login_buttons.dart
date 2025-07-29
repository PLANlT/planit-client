import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/assets.dart';
import '../../common/comopnent/planit_text.dart';

// View 코드 간소화
class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      icon: Assets.google,
      backgroundColor: PlanitColors.white01,
      borderColor: PlanitColors.white03,
      foregroundColor: PlanitColors.black01,
      onPressed: onPressed,
      label: 'Google 로그인',
    );
  }
}

class KakaoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const KakaoButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      icon: Assets.kakao,
      backgroundColor: Color(0XFFFEE500),
      borderColor: Color(0XFFFEE500),
      foregroundColor: PlanitColors.black01,
      onPressed: onPressed,
      label: 'Kakao 로그인',
    );
  }
}

class NaverButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NaverButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      icon: Assets.naver,
      backgroundColor: Color(0XFF03C75A),
      borderColor: Color(0XFF03C75A),
      foregroundColor: PlanitColors.white01,
      onPressed: onPressed,
      label: 'Naver 로그인',
    );
  }
}

// PlanitButton을 재사용하기에는 속성값 다른 것이 많아 새로 구현
class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final String icon;
  final String label;

  const LoginButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          overlayColor: PlanitColors.black03,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: 6.0,
          ).copyWith(left: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30.0),
            side: BorderSide(
              color: borderColor,
              strokeAlign: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
              width: 36.0,
              height: 36.0,
            ),
            PlanitText(
              label,
              style: PlanitTypos.body2.copyWith(
                color: foregroundColor,
              ),
            ),
            SizedBox(
              width: 36.0,
              height: 36.0,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/comopnent/planit_text.dart';

class AccountInfoWidget extends StatelessWidget {
  final String userEmail;
  final String oAuthType;
  final String registrationDate;

  const AccountInfoWidget({
    super.key,
    required this.userEmail,
    required this.oAuthType,
    required this.registrationDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 40.0,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlanitText(
                userEmail,
                style: PlanitTypos.body2.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              PlanitText(
                '$oAuthType 계정으로 로그인됨',
                style: PlanitTypos.body3.copyWith(
                  color: PlanitColors.black03,
                ),
              ),
            ],
          ),
          PlanitText(
            '가입일: $registrationDate',
            style: PlanitTypos.body3.copyWith(
              color: PlanitColors.black03,
            ),
          ),
        ],
      ),
    );
  }
}

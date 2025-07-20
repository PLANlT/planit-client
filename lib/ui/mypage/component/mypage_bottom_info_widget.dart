import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_urls.dart';
import 'package:planit/ui/common/const/web_view_params.dart';
import 'package:planit/ui/common/view/planit_web_view.dart';

class MypageBottomInfoWidget extends StatelessWidget {
  final String appVersion;

  const MypageBottomInfoWidget({
    super.key,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.white02,
      ),
      padding: EdgeInsetsGeometry.all(20.0),
      child: Column(
        spacing: 12.0,
        children: [
          Row(
            spacing: 8.0,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(
                  PlanitWebView.routeName,
                  extra: WebViewParams(
                    title: '이용약관',
                    url: PlanitUrls.termOfInfo,
                  ),
                ),
                child: PlanitText(
                  '이용약관',
                  style: PlanitTypos.caption.copyWith(
                    color: PlanitColors.black03,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.pushNamed(
                  PlanitWebView.routeName,
                  extra: WebViewParams(
                    title: '개인정보처리방침',
                    url: PlanitUrls.termOfUse,
                  ),
                ),
                child: PlanitText(
                  '개인정보처리방침',
                  style: PlanitTypos.caption.copyWith(
                    color: PlanitColors.black03,
                  ),
                ),
              ),
            ],
          ),
          PlanitText(
            'PLANIT $appVersion',
            style: PlanitTypos.caption.copyWith(
              color: PlanitColors.black03,
            ),
          ),
        ],
      ),
    );
  }
}

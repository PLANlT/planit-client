import 'package:flutter/material.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class GuiltyFreeHistoryView extends StatelessWidget {
  const GuiltyFreeHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              PlanitText(
                '이전 길티-프리 내역',
                style: PlanitTypos.title2.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              SizedBox(height: 12.0),
              PlanitText(
                '내가 길티프리를 시작할 때 어떤 어려움을 지속적으로 겪었는지 확인할 수 있어요.',
                style: PlanitTypos.body3.copyWith(
                  color: PlanitColors.black03,
                ),
              ),
              SizedBox(height: 36.0),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: PlanitColors.white02,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 82.0,
                        child: PlanitText(
                          '25.06.10',
                          style: PlanitTypos.caption.copyWith(
                            color: PlanitColors.black03,
                          ),
                        ),
                      ),
                      PlanitText(
                        '계획대로 안돼요',
                        style: PlanitTypos.body3.copyWith(
                          color: PlanitColors.black01,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              PlanitText(
                '플랜잇의 조언',
                style: PlanitTypos.title3.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                width: double.infinity,
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                margin: EdgeInsetsGeometry.only(bottom: 40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: PlanitColors.black01,
                ),
                child: PlanitText(
                  ' 계획을 수정하는 것도 실행의 일부예요.\n다음 계획은 여유 구간을 조금 더\n넣어보는 건 어때요?',
                  textAlign: TextAlign.center,
                  style: PlanitTypos.body3.copyWith(
                    color: PlanitColors.white01,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

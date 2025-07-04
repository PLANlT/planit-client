import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/guilty_free/start/guilty_free_start_state.dart';
import 'package:planit/ui/guilty_free/start/guilty_free_start_view_model.dart';

import '../../../../theme/planit_colors.dart';
import '../../../../theme/planit_typos.dart';
import '../../../common/comopnent/planit_button.dart';
import '../../../common/comopnent/planit_text.dart';
import '../../../common/const/planit_button_style.dart';
import '../../../common/view/default_layout.dart';
import '../../const/guilty_free_reasons.dart';
import '../../ing/guilty_free_view.dart';

class GuiltyFreeReasonView extends HookConsumerWidget {
  const GuiltyFreeReasonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GuiltyFreeStartViewModel viewModel = ref.read(
      guiltyFreeStartViewModelProvider.notifier,
    );
    final GuiltyFreeStartState state = ref.watch(
      guiltyFreeStartViewModelProvider,
    );

    return DefaultLayout(
      title: '길티-프리 모드',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ).copyWith(top: 20.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlanitText(
              '왜 오늘 쉬고 싶나요?',
              style: PlanitTypos.title1.copyWith(
                color: PlanitColors.black01,
              ),
            ),
            SizedBox(height: 12.0),
            PlanitText(
              '선택한 이유는 기록되어,\n나중에 컨디션을 돌아보는 데 도움 돼요!',
              textAlign: TextAlign.center,
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black03,
              ),
            ),
            Spacer(),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 12.0,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => viewModel.selectReason(
                  reason: reasons[index].reason,
                ),
                child: GuiltyFreeReasonWidget(
                  reason: reasons[index].reason,
                  description: reasons[index].description,
                  asset: reasons[index].asset,
                  isSelected: reasons[index].reason == state.reason,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: PlanitButton(
                onPressed: () {
                  viewModel.startGuiltyFree();
                  if (state.loadingStatus == LoadingStatus.success) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GuiltyFreeView(),
                      ),
                    );
                  }
                },
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '다음',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GuiltyFreeReasonWidget extends StatelessWidget {
  final String reason;
  final String description;
  final String asset;
  final bool isSelected;

  const GuiltyFreeReasonWidget({
    super.key,
    required this.reason,
    required this.description,
    required this.asset,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? PlanitColors.white03 : PlanitColors.white02,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsetsGeometry.only(top: 14.0),
      child: Column(
        children: [
          PlanitText(
            reason,
            style: PlanitTypos.title3.copyWith(
              color: PlanitColors.black01,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: PlanitText(
              description,
              style: PlanitTypos.caption.copyWith(
                color: PlanitColors.black03,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  right: asset == Assets.imgGuiltyFreeReason1 ? 14.0 : 0.0,
                ),
                child: SvgPicture.asset(
                  asset,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

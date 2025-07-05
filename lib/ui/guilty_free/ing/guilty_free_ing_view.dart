import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/root_tab.dart';
import 'package:planit/ui/guilty_free/ing/guilty_free_ing_state.dart';
import 'package:planit/ui/guilty_free/ing/guilty_free_ing_view_model.dart';

import '../../common/assets.dart';
import '../../common/comopnent/planit_toast.dart';
import 'guilty_free_history_view.dart';

class GuiltyFreeIngView extends HookConsumerWidget {
  const GuiltyFreeIngView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GuiltyFreeIngViewModel viewModel = ref.read(
      guiltyFreeIngViewModelProvider.notifier,
    );
    final GuiltyFreeIngState state = ref.read(guiltyFreeIngViewModelProvider);

    final Size deviceSize = MediaQuery.of(context).size;

    // TODO: toastService 정의하여 싱글톤 관리
    final FToast toast = FToast().init(context);

    useEffect(() {
      if (state.errorMessage.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          toast.showToast(child: PlanitToast(label: state.errorMessage));
        });
      }
      return null;
    }, [state.errorMessage]);

    return Scaffold(
      backgroundColor: Color(0xFF303141),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 4),
          PlanitText(
            '길티프리모드가 켜졌어요',
            style: PlanitTypos.title1.copyWith(
              color: PlanitColors.white01,
            ),
          ),
          Spacer(flex: 2),
          SvgPicture.asset(Assets.imgSpeachBalloon),
          SizedBox(height: 32.0),
          SvgPicture.asset(
            width: deviceSize.width,
            Assets.mascotRelaxing,
          ),
          Spacer(flex: 2),
          PlanitText(
            '모드는 내일 6:00 AM 에 꺼져요',
            style: PlanitTypos.body2.copyWith(
              color: PlanitColors.black04,
            ),
          ),
          Spacer(flex: 3),
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GuiltyFreeHistoryView(),
              ),
            ),
            style: TextButton.styleFrom(
              overlayColor: PlanitColors.black01,
            ),
            child: PlanitText(
              '이전 길티-프리 내역',
              style: PlanitTypos.body2.copyWith(
                color: PlanitColors.black04,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Container(
            width: double.infinity,
            margin: EdgeInsetsGeometry.only(
              left: 20.0,
              right: 20.0,
              bottom: 34.0,
            ),
            child: PlanitButton(
              onPressed: () {
                viewModel.endGuiltyFree();
                if (state.loadingStatus == LoadingStatus.success) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RootTab(),
                    ),
                  );
                }
              },
              buttonColor: PlanitButtonColor.black,
              buttonSize: PlanitButtonSize.large,
              label: '이제 다시 시작할게요',
            ),
          ),
        ],
      ),
    );
  }
}

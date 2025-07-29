import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_restart/archiving_restart_view_model.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/common/view/root_tab.dart';

class ArchivingRestartView extends HookConsumerWidget {
  final int planId;
  static String get routeName => 'archiving-restart';
  final String title;
  const ArchivingRestartView(
      {super.key, required this.planId, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ArchivingRestartViewModel viewmodel =
        ref.read(archivingRestartViewModelProvider.notifier);
    final deviceWidth = MediaQuery.of(context).size.width;
    return DefaultLayout(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              'assets/mascots/restart.svg',
              width: deviceWidth,
            ),
          ),
          Column(
            spacing: 8,
            children: [
              PlanitText('이 여정을 다시 시작해볼까요?', style: PlanitTypos.title2),
              PlanitText('그때처럼, 이번에도 당신은 해낼 수 있어요.',
                  style: PlanitTypos.body3.copyWith(color: Color(0xFF666666))),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 20),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: PlanitColors.white02),
              child: Center(
                  child: PlanitText(
                '이전 플랜의 이름과 감정 상태를 포함해,\n등록한 태스크와 반복/리마인드 설정도 복원됩니다.',
                style: PlanitTypos.body3.copyWith(color: PlanitColors.black02),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 80),
            child: SizedBox(
              width: double.infinity,
              child: PlanitButton(
                  onPressed: () async {
                    await viewmodel.restartArchivingPlan(planId);
                    final state = ref.read(archivingRestartViewModelProvider);
                    if (state.loadingStatus == LoadingStatus.success &&
                        context.mounted) {
                      context.pushNamed(RootTab.routeName);
                    } else if (state.loadingStatus == LoadingStatus.error &&
                        context.mounted) {
                      // 에러 처리 (예: 스낵바 표시)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                  },
                  buttonColor: PlanitButtonColor.black,
                  buttonSize: PlanitButtonSize.large,
                  label: '해당 플랜으로 다시 시작하기'),
            ),
          )
        ],
      ),
    );
  }
}

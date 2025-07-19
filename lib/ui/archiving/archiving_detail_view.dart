import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_restart_view.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/task_card.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_more/plan_more_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_state.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_view_model.dart';

class ArchivingDetailView extends HookConsumerWidget {
  const ArchivingDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanDetailState state = ref.watch(planDetailViewModelProvider(0));
    final PlanDetailViewModel viewModel =
        ref.read(planDetailViewModelProvider(0).notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.init();
      });
      return null;
    }, []);

    if (state.loadingStatus == LoadingStatus.loading) {
      return Center(child: CircularProgressIndicator());
    }
    if (state.planDetail == null) {
      return Center(child: CircularProgressIndicator());
    }

    return DefaultLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: PlanitColors.transparent,
        ),
        SizedBox(
          width: double.infinity,
          height: 136,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  state.planDetail!.icon,
                  width: 120,
                  height: 120,
                ),
              ),
              Positioned(
                top: 8,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return PlanMoreBottomSheet();
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    Assets.more,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: PlanitText(state.planDetail!.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 40),
          child: PlanitText(state.planDetail!.motivation,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: PlanitColors.black03)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlanitText('내가 해낸 태스크들', style: PlanitTypos.title3),
                  PlanitText('한 걸음씩 내딛던 당신, 참 멋졌어요.',
                      style: PlanitTypos.body3
                          .copyWith(color: PlanitColors.black03)),
                ],
              )),
        ),
        SizedBox(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.planDetail!.tasks.length,
            itemBuilder: (context, index) {
              final item = state.planDetail!.tasks[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TaskCard(title: item.title, taskType: item.taskType),
              );
            },
          ),
        ),
        Spacer(),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 76),
          child: SizedBox(
            width: double.infinity,
            child: PlanitButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ArchivingRestartView();
                  }));
                },
                buttonColor: PlanitButtonColor.black,
                buttonSize: PlanitButtonSize.large,
                label: '다시 시작하기'),
          ),
        )
      ],
    ));
  }
}

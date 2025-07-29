import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/archiving/archiving_restart/archiving_restart_view.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/task_card.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_state.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_view_model.dart';

class ArchivingDetailView extends HookConsumerWidget {
  final int planId;

  static String get routeName => 'archiving-detail';

  const ArchivingDetailView({super.key, required this.planId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanDetailState state = ref.watch(
      planDetailViewModelProvider(planId),
    );
    final PlanDetailViewModel viewModel = ref.read(
      planDetailViewModelProvider(planId).notifier,
    );

    final Size deviceSize = MediaQuery.of(context).size;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.init();
      });
      return null;
    }, []);

    return DefaultLayout(
      title: '',
      child: state.planDetail == null
          ? Center(child: PlanitLoading())
          : Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 136,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              '${state.planDetail!.icon}.svg',
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ).copyWith(top: 12.0),
                      child: PlanitText(
                        state.planDetail!.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (state.planDetail!.motivation.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ).copyWith(top: 4.0),
                        child: PlanitText(
                          state.planDetail!.motivation,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: PlanitColors.black03,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ).copyWith(top: 40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PlanitText(
                              '내가 해낸 태스크들',
                              style: PlanitTypos.title3.copyWith(
                                color: PlanitColors.black01,
                              ),
                            ),
                            PlanitText(
                              '한 걸음씩 내딛던 당신, 참 멋졌어요.',
                              style: PlanitTypos.body3.copyWith(
                                color: PlanitColors.black03,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // 최대 높이 지정
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: deviceSize.height / 12 * 5,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: state.planDetail!.tasks.length,
                        itemBuilder: (context, index) {
                          final item = state.planDetail!.tasks[index];
                          return TaskCard(
                            title: item.title,
                            taskType: item.taskType,
                            taskId: item.taskId,
                            showMore: false,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ).copyWith(bottom: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: PlanitButton(
                          onPressed: () {
                            context.pushNamed(
                              ArchivingRestartView.routeName,
                              pathParameters: {
                                'planId': planId.toString(),
                                'title': state.planDetail!.title
                              },
                            );
                          },
                          buttonColor: PlanitButtonColor.black,
                          buttonSize: PlanitButtonSize.large,
                          label: '다시 시작하기',
                        ),
                      ),
                    )
                  ],
                ),
                if (state.loadingStatus == LoadingStatus.loading)
                  Center(
                    child: PlanitLoading(),
                  )
              ],
            ),
    );
  }
}

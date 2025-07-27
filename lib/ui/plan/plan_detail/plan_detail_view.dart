import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/task_card.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/plan_more/plan_more_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_detail/bottom_sheet/task_add/task_add_bottom_sheet_view.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_state.dart';
import 'package:planit/ui/plan/plan_detail/plan_detail_view_model.dart';

class PlanDetailView extends HookConsumerWidget {
  final int planId;
  final String planStatus;

  const PlanDetailView(
      {required this.planId, required this.planStatus, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanDetailState state = ref.watch(
      planDetailViewModelProvider(planId),
    );
    final PlanDetailViewModel viewModel = ref.read(
      planDetailViewModelProvider(planId).notifier,
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.init();
      });
      return null;
    }, []);

    return DefaultLayout(
      title: '',
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: GestureDetector(
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PlanitColors.black01, // 배경색
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: PlanitColors.white01),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return TaskAddBottomSheetView(
                      onConfirm: (title) {
                        viewModel.clickAddButton(title);
                      },
                    );
                  },
                );

                // 버튼 눌렀을 때 동작
              },
            ),
          ),
        ),
      ),
      child: state.planDetail == null
          ? Center(child: PlanitLoading())
          : Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 플랜 아이콘 및 설정 버튼
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
                          Positioned(
                            top: 8,
                            right: 20,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return PlanMoreBottomSheet(
                                      title: state.planDetail!.title,
                                      planStatus: planStatus,
                                      planId: planId,
                                      icon: state.planDetail!.icon,
                                    );
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
                    // 플랜명
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: PlanitText(
                        state.planDetail!.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // 동기
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 40),
                      child: PlanitText(
                        state.planDetail!.motivation,
                        style: PlanitTypos.body3.copyWith(
                          color: PlanitColors.black03,
                        ),
                      ),
                    ),
                    // 태스크 리스트
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.planDetail!.tasks.length,
                        itemBuilder: (context, index) {
                          final item = state.planDetail!.tasks[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TaskCard(
                              title: item.title,
                              taskType: item.taskType,
                              taskId: item.taskId,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (state.loadingStatus == LoadingStatus.loading)
                  Center(child: PlanitLoading())
              ],
            ),
    );
  }
}

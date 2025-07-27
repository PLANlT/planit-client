// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_button.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_button_style.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/plan/component/plan_list_card.dart';
import 'package:planit/ui/plan/component/template_list.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/ui/plan/plan_create/plan_create_view.dart';
import 'package:planit/ui/plan/plan_main/plan_all_view.dart';
import 'package:planit/ui/plan/plan_main/plan_state.dart';
import 'package:planit/ui/plan/plan_main/plan_view_model.dart';

class PlanView extends HookConsumerWidget {
  static String get routeName => 'plan';

  const PlanView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanState state = ref.watch(planViewModelProvider);
    final PlanViewModel viewmodel = ref.read(planViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewmodel.init();
      });
      return null;
    }, []);

    return DefaultLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildAppBar(),
            SizedBox(height: 20),
            // 진행 중인 플랜
            if (state.activePlans.isNotEmpty)
              _PlanList(
                title: '진행 중인 플랜',
                plans: state.activePlans,
                planStatus: 'IN_PROGRESS',
              ),
            // 잠시 중단한 플랜
            if (state.pausePlans.isNotEmpty)
              Padding(
                // 진행 중인 플랜이 있을 때만 topPadding=40
                padding: EdgeInsets.only(
                  top: state.activePlans.isNotEmpty ? 40 : 0,
                ),
                child: _PlanList(
                  title: '잠시 중단한 플랜',
                  plans: state.pausePlans,
                  planStatus: 'PAUSED',
                ),
              ),
            // 템플릿 텍스트
            Padding(
              // 진행 중인 플랜/잠시 중단한 플랜 하나라도 있다면 topPadding=32
              padding: EdgeInsets.only(
                top: state.activePlans.isNotEmpty || state.pausePlans.isNotEmpty
                    ? 32
                    : 0,
                left: 20,
                bottom: 12,
              ),
              child: PlanitText(
                '템플릿',
                style: PlanitTypos.body2.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
            ),
            TemplateList(),
            // 플랜이 아예 없는 경우
            if (state.activePlans.isEmpty && state.pausePlans.isEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: PlanitText(
                        '진행 중인 플랜',
                        style: PlanitTypos.body2.copyWith(
                          color: PlanitColors.black01,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 104),
                  Center(
                    child: PlanitText(
                      '아직 플랜이\n존재하지 않아요!\n\n새로 플랜을 만들어 볼까요?',
                      textAlign: TextAlign.center,
                      style: PlanitTypos.body3.copyWith(
                        color: PlanitColors.black03,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _PlanList extends StatelessWidget {
  final String title;
  final List<PlanModel> plans;
  final String planStatus;

  const _PlanList({
    required this.title,
    required this.plans,
    required this.planStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 타이틀
          PlanitText(
            title,
            style: PlanitTypos.body2.copyWith(
              color: PlanitColors.black01,
            ),
          ),
          SizedBox(height: 12),
          // 진행 중인 플랜 리스트
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: plans.length > 5 ? 5 : plans.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = plans[index];
              return PlanListCard(
                planStatus: planStatus,
                plan: item,
              );
            },
          ),
          // 진행 중인 플랜 전체보기 버튼
          if (plans.length > 5)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: double.infinity,
                child: PlanitButton(
                  onPressed: () {
                    context.pushNamed(
                      PlanAllView.routeName,
                      pathParameters: {
                        'isActive':
                            planStatus == 'IN_PROGRESS' ? 'true' : 'false',
                      },
                      extra: plans,
                    );
                  },
                  buttonColor: PlanitButtonColor.white,
                  buttonSize: PlanitButtonSize.large,
                  label: '플랜 전체보기',
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 92,
      backgroundColor: PlanitColors.white02,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: PlanitText('내 플랜', style: PlanitTypos.title2),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PlanitButton(
            onPressed: () {
              context.pushNamed(PlanCreateView.routeName);
            },
            buttonColor: PlanitButtonColor.black,
            buttonSize: PlanitButtonSize.small,
            label: '+ 새 플랜',
          ),
        ),
      ],
    );
  }
}

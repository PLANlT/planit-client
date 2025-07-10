// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:planit/ui/plan/plan_main/plan_state.dart';
import 'package:planit/ui/plan/plan_main/plan_view_model.dart';

class PlanView extends HookConsumerWidget {
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
            AppBar(
              toolbarHeight: 92,
              backgroundColor: PlanitColors.white02,
              automaticallyImplyLeading: false,
              title: PlanitText('내 플랜', style: PlanitTypos.title2),
              actions: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: PlanitButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlanCreateView(),
                            ));
                      },
                      buttonColor: PlanitButtonColor.black,
                      buttonSize: PlanitButtonSize.small,
                      label: '+ 새 플랜'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitText('진행 중인 플랜',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black01)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 12),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.activePlans.length > 5
                      ? 5
                      : state.activePlans.length,
                  itemBuilder: (context, index) {
                    final item = state.activePlans[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: PlanListCard(
                        plan: item,
                      ),
                    );
                  }),
            ),
            state.activePlans.length > 5
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: PlanitButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlanViewAll(
                                          planList: state.activePlans,
                                          isActive: true,
                                        )));
                          },
                          buttonColor: PlanitButtonColor.white,
                          buttonSize: PlanitButtonSize.large,
                          label: '플랜 전체보기'),
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitText('잠시 중단한 플랜',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black01)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 12),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      state.pausePlans.length > 5 ? 5 : state.pausePlans.length,
                  itemBuilder: (context, index) {
                    final item = state.pausePlans[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: PlanListCard(
                        plan: item,
                      ),
                    );
                  }),
            ),
            state.pausePlans.length > 5
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: PlanitButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlanViewAll(
                                          planList: state.pausePlans,
                                          isActive: false,
                                        )));
                          },
                          buttonColor: PlanitButtonColor.white,
                          buttonSize: PlanitButtonSize.large,
                          label: '플랜 전체보기'),
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitText(
                  '템플릿',
                  style:
                      PlanitTypos.body2.copyWith(color: PlanitColors.black01),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TemplateList(),
            )
          ],
        ),
      ),
    );
  }
}

class PlanViewAll extends StatefulWidget {
  final List<PlanModel> planList;
  final bool isActive;

  const PlanViewAll(
      {super.key, required this.planList, required this.isActive});

  @override
  State<PlanViewAll> createState() => _PlanViewAllState();
}

class _PlanViewAllState extends State<PlanViewAll> {
  late final PageController _pageController;
  int _currentPage = 0;
  late final List<List<PlanModel>> _pagedPlans;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pagedPlans = _paginate(widget.planList, 6);
  }

  List<List<PlanModel>> _paginate(List<PlanModel> plans, int size) {
    List<List<PlanModel>> pages = [];
    for (int i = 0; i < plans.length; i += size) {
      pages.add(plans.sublist(
          i, (i + size > plans.length) ? plans.length : i + size));
    }
    return pages;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            toolbarHeight: 92,
            backgroundColor: PlanitColors.white02,
            automaticallyImplyLeading: false,
            title: PlanitText('내 플랜', style: PlanitTypos.title2),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlanCreateView(),
                        ),
                      );
                    },
                    buttonColor: PlanitButtonColor.black,
                    buttonSize: PlanitButtonSize.small,
                    label: '+ 새 플랜'),
              ),
            ],
          ),
          if (widget.isActive)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitText('진행 중인 플랜',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black01)),
              ),
            ),
          if (!widget.isActive)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlanitText('잠시 중단한 플랜',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black01)),
              ),
            ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pagedPlans.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, pageIndex) {
                final plans = _pagedPlans[pageIndex];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 16),
                  child: ListView.builder(
                    itemCount: plans.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: PlanListCard(plan: plans[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pagedPlans.length, (index) {
                final isActive = index == _currentPage;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? PlanitColors.black02
                          : PlanitColors.white03),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

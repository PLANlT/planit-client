import 'package:flutter/material.dart';

import '../../../repository/plan/model/plan_model.dart';
import '../../../theme/planit_colors.dart';
import '../../common/view/default_layout.dart';
import '../component/plan_list_card.dart';

class PlanAllView extends StatefulWidget {
  static String get routeName => 'plan_all';
  final List<PlanModel> planList;
  final bool isActive;

  const PlanAllView({
    super.key,
    required this.planList,
    required this.isActive,
  });

  @override
  State<PlanAllView> createState() => _PlanAllViewState();
}

class _PlanAllViewState extends State<PlanAllView> {
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
      pages.add(
        plans.sublist(i, (i + size > plans.length) ? plans.length : i + size),
      );
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
      title: '플랜 전체보기',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).copyWith(
          top: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 태스크 리스트
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
                  return ListView.separated(
                    itemCount: plans.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return PlanListCard(
                        plan: plans[index],
                        planStatus: 'PAUSED',
                      );
                    },
                  );
                },
              ),
            ),
            // 페이지네이션 UI
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pagedPlans.length,
                  (index) {
                    final isActive = index == _currentPage;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive
                            ? PlanitColors.black02
                            : PlanitColors.white03,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

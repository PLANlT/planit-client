import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planit/core/guilty_free_status.dart';
import 'package:planit/service/app/app_service.dart';
import 'package:planit/service/app/app_state.dart';
import 'package:planit/ui/archiving/archiving_main/archiving_view.dart';
import 'package:planit/ui/common/assets.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/main/main_view.dart';
import 'package:planit/ui/plan/plan_main/plan_view.dart';

import '../../../theme/planit_colors.dart';
import '../../guilty_free/ing/guilty_free_ing_view.dart';

class RootTab extends ConsumerStatefulWidget {
  static String get routeName => 'rootTab';

  const RootTab({super.key});

  @override
  ConsumerState<RootTab> createState() => _RootTabState();
}

class _RootTabState extends ConsumerState<RootTab>
    with SingleTickerProviderStateMixin {
  int index = 1;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this, // controller를 선언하는 state
      // vsync를 위해 with SingleTickerProviderStateMixin 추가
    );
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(tabListener);
  }

  @override
  Widget build(BuildContext context) {
    final AppState state = ref.watch(appServiceProvider);
    final isGuiltyFree = state.guiltyFreeStatus == GuiltyFreeStatus.ing;

    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
            isGuiltyFree ? PlanitColors.white01 : PlanitColors.black01,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Pretendard',
        ),
        backgroundColor:
            isGuiltyFree ? Color(0XFF303141) : PlanitColors.white02,
        unselectedFontSize: 0.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => controller.animateTo(index),
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.navPlan,
              colorFilter: ColorFilter.mode(
                getItemColor(
                  itemIndex: 0,
                  currentIndex: index,
                  isGuiltyFree: isGuiltyFree,
                ),
                BlendMode.srcIn,
              ),
            ),
            label: '내 플랜',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.navHome,
              colorFilter: ColorFilter.mode(
                getItemColor(
                  itemIndex: 1,
                  currentIndex: index,
                  isGuiltyFree: isGuiltyFree,
                ),
                BlendMode.srcIn,
              ),
            ),
            label: '할 일',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.navArchive,
              colorFilter: ColorFilter.mode(
                getItemColor(
                  itemIndex: 2,
                  currentIndex: index,
                  isGuiltyFree: isGuiltyFree,
                ),
                BlendMode.srcIn,
              ),
            ),
            label: '아카이브',
          ),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          PlanView(),
          isGuiltyFree ? GuiltyFreeIngView() : MainView(),
          ArchivingView(),
        ],
      ),
    );
  }
}

Color getItemColor({
  required int itemIndex,
  required int currentIndex,
  required bool isGuiltyFree,
}) {
  if (itemIndex != currentIndex) {
    return PlanitColors.black04;
  } else {
    return isGuiltyFree ? PlanitColors.white01 : PlanitColors.black01;
  }
}

import 'package:flutter/material.dart';
import 'package:planit/ui/archiving/archiving_view.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:planit/ui/main/main_view.dart';
import 'package:planit/ui/plan/plan_view.dart';

import '../../../theme/planit_colors.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
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
    return DefaultLayout(
      // TODO: NavBar 커스텀
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PlanitColors.black01,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Pretendard',
        ),
        backgroundColor: PlanitColors.white03,
        unselectedItemColor: PlanitColors.black04,
        unselectedFontSize: 0.0,
        type: BottomNavigationBarType.shifting,
        onTap: (index) => controller.animateTo(index),
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: '내 플랜',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '할 일',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: '아카이브',
          ),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          PlanView(),
          MainView(),
          ArchivingView(),
        ],
      ),
    );
  }
}

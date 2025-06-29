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
import 'package:planit/repository/plan/model/plan_overview_model.dart';
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
          children: [
            AppBar(
              toolbarHeight: 92,
              backgroundColor: PlanitColors.white02,
              automaticallyImplyLeading: false,
              title: PlanitText('내 플랜', style: PlanitTypos.title2),
              actions: [
                PlanitButton(
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
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                PlanitText('진행 중인 플랜',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black01)),
              ],
            ),

            SizedBox(
              width: 360,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.activePlans.length,
                  itemBuilder: (context, index) {
                    final item = state.activePlans[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: planListCard(
                        PlanOverviewModel: item,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            //리스트뷰
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                PlanitText('잠시 중단한 플랜',
                    style: PlanitTypos.body2
                        .copyWith(color: PlanitColors.black01)),
              ],
            ),
            SizedBox(
              width: 360,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.pausePlans.length,
                  itemBuilder: (context, index) {
                    final item = state.pausePlans[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: planListCard(
                        PlanOverviewModel: item,
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                PlanitText(
                  '템플릿',
                  style:
                      PlanitTypos.body2.copyWith(color: PlanitColors.black01),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            templateList()
          ],
        ),
      ),
    );
  }
}

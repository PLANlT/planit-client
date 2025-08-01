import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';
import 'package:planit/ui/common/comopnent/planit_toast.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/ui/main/const/main_enums.dart';
import 'package:planit/ui/main/main_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:planit/ui/main/main_view_model.dart';
import 'package:planit/ui/main/view/first_complete_view.dart';

import '../common/assets.dart';
import 'component/main_top_widget.dart';
import 'component/plan_list_view.dart';
import 'component/route_switch_banner.dart';

class MainView extends HookConsumerWidget {
  static String get routeName => 'main';

  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainViewModel viewModel = ref.read(mainViewModelProvider.notifier);
    final MainState state = ref.watch(mainViewModelProvider);

    // TODO: toastService 정의하여 싱글톤 관리
    final FToast toast = FToast().init(context);

    final Size deviceSize = MediaQuery.of(context).size;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.init();
      });
      return null;
    }, []);

    // completeMessage를 감지하여, 태스크 완료 시 토스트 노출
    useEffect(() {
      if (state.completeMessage.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          toast.showToast(child: PlanitToast(label: state.completeMessage));
        });
      }
      return null;
    }, [state.completeMessage]);

    // taskStatus를 감지하여, nothing에서 partial로 변경될 때에만 첫달성 화면 노출
    useValueChanged<TaskStatus, void>(state.taskStatus, (oldValue, _) {
      // 이전 값이 nothing이고, 변화된 값이 nothing이 아닐 때
      if (oldValue == TaskStatus.nothing &&
          state.taskStatus != TaskStatus.nothing) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FirstCompleteView(
                consecutiveDays: state.consecutiveDay,
              ),
            ),
          );
        });
      }
    });

    return DefaultLayout(
      child: Stack(
        children: [
          Column(
            children: [
              MainTopWidget(
                status: state.taskStatus,
                type: state.routeType,
                onGuiltyFreePressed: viewModel.checkCanUseGuiltyFree(),
                canUseGuiltyFree: state.canUseGuiltyFree,
                consecutiveDay: state.consecutiveDay,
              ),
              RouteSwitchBanner(
                type: state.routeType,
                onLeftArrowPressed: () => viewModel.switchRoute(
                  currentType: state.routeType,
                ),
                onRightArrowPressed: () => viewModel.switchRoute(
                  currentType: state.routeType,
                ),
              ),
              PlanListView(
                plans: state.routeType == RouteType.slow
                    ? state.plans.slowPlans
                    : state.plans.passionatePlans,
                showRecoveryRoutineBanner: state.showRecoveryRoutineBanner,
                onCheckboxTap: viewModel.onCheckboxTap,
              ),
            ],
          ),
          if (state.loadingStatus == LoadingStatus.loading)
            Center(
              child: PlanitLoading(),
            ),
          // 태스크 완료 시 토스트와 함께 이미지 노출
          if (state.completeMessage.isNotEmpty)
            Positioned(
              bottom: 0.0,
              child: SvgPicture.asset(
                Assets.imgCongratulation,
                width: deviceSize.width,
              ),
            )
        ],
      ),
    );
  }
}

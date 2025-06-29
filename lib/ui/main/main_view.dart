import 'package:flutter/material.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/ui/common/comopnent/planit_loading.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/ui/main/main_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:planit/ui/main/main_view_model.dart';

import 'component/main_top_widget.dart';
import 'component/plan_list_view.dart';
import 'component/route_switch_banner.dart';

class MainView extends HookConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainViewModel viewModel = ref.read(mainViewModelProvider.notifier);
    final MainState state = ref.watch(mainViewModelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.init();
      });
      return null;
    }, []);

    return DefaultLayout(
      child: Stack(
        children: [
          Column(
            children: [
              MainTopWidget(
                status: state.taskStatus,
                type: state.routeType,
              ),
              RouteSwitchBanner(
                type: state.routeType,
                onLeftArrowPressed: () => viewModel.switchToLeft(
                  currentType: state.routeType,
                ),
                onRightArrowPressed: () => viewModel.switchToRight(
                  currentType: state.routeType,
                ),
              ),
              (state.loadingStatus == LoadingStatus.loading)
                  ? SizedBox.shrink()
                  : PlanListView(
                      plans: state.plans,
                      showRecoveryRoutineBanner:
                          state.showRecoveryRoutineBanner,
                    ),
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

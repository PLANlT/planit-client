import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/theme/planit_typos.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/view/default_layout.dart';

import 'guilty_free_history_state.dart';
import 'guilty_free_history_view_model.dart';

class GuiltyFreeHistoryView extends HookConsumerWidget {
  const GuiltyFreeHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GuiltyFreeHistoryViewModel viewModel = ref.read(
      guiltyFreeHistoryViewModelProvider.notifier,
    );
    final GuiltyFreeHistoryState state = ref.read(
      guiltyFreeHistoryViewModelProvider,
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.init();
      });
      return null;
    }, []);

    return DefaultLayout(
      title: '',
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              PlanitText(
                '이전 길티프리 내역',
                style: PlanitTypos.title2.copyWith(
                  color: PlanitColors.black01,
                ),
              ),
              SizedBox(height: 12.0),
              PlanitText(
                '내가 길티프리를 시작할 때 어떤 어려움을 지속적으로 겪었는지 확인할 수 있어요.',
                style: PlanitTypos.body3.copyWith(
                  color: PlanitColors.black03,
                ),
              ),
              SizedBox(height: 36.0),
              if (state.loadingStatus == LoadingStatus.success)
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    final String date = state.reasonList.reasons[index].date;
                    final String reason =
                        switch (state.reasonList.reasons[index].reason) {
                      'PHYSICALLY_EXHAUSTED' => '너무 지쳐버렸어요',
                      'PLAN_FAILED' => '계획대로 안돼요',
                      'NO_TIME_FOR_SCHEDULE' => '할 일이 많았어요',
                      'LACK_OF_MOTIVATION' => '손에 아무것도 안 잡혀요',
                      _ => '길티프리 내역을 불러오는데 오류가 발생했어요',
                    };
                    return _Reason(
                      date: date,
                      reason: reason,
                    );
                  },
                ),
              SizedBox(height: 32.0),
              if (state.advice.isNotEmpty) _Advice(advice: state.advice),
            ],
          ),
        ),
      ),
    );
  }
}

class _Reason extends StatelessWidget {
  final String date;
  final String reason;

  const _Reason({
    required this.date,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PlanitColors.white02,
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 12.0,
        vertical: 16.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 82.0,
            child: PlanitText(
              date,
              style: PlanitTypos.caption.copyWith(
                color: PlanitColors.black03,
              ),
            ),
          ),
          PlanitText(
            reason,
            style: PlanitTypos.body3.copyWith(
              color: PlanitColors.black01,
            ),
          ),
        ],
      ),
    );
  }
}

class _Advice extends StatelessWidget {
  final String advice;

  const _Advice({
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      children: [
        PlanitText(
          '플랜잇의 조언',
          style: PlanitTypos.title3.copyWith(
            color: PlanitColors.black01,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 10.0,
            vertical: 20.0,
          ),
          margin: EdgeInsetsGeometry.only(bottom: 40.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: PlanitColors.black01,
          ),
          child: PlanitText(
            advice,
            textAlign: TextAlign.center,
            style: PlanitTypos.body3.copyWith(
              color: PlanitColors.white01,
            ),
          ),
        )
      ],
    );
  }
}

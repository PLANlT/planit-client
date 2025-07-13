import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/guilty_free/model/guilty_free_reason_list_model.dart';

import '../../../../core/loading_status.dart';
import '../../../../repository/guilty_free/guilty_free_repository.dart';
import 'guilty_free_history_state.dart';

final AutoDisposeStateNotifierProvider<GuiltyFreeHistoryViewModel,
        GuiltyFreeHistoryState> guiltyFreeHistoryViewModelProvider =
    StateNotifierProvider.autoDispose(
  (ref) => GuiltyFreeHistoryViewModel(
    guiltyFreeRepository: ref.read(guiltyFreeRepositoryProvider),
  ),
);

class GuiltyFreeHistoryViewModel extends StateNotifier<GuiltyFreeHistoryState> {
  final GuiltyFreeRepository _guiltyFreeRepository;

  GuiltyFreeHistoryViewModel({
    required GuiltyFreeRepository guiltyFreeRepository,
  })  : _guiltyFreeRepository = guiltyFreeRepository,
        super(GuiltyFreeHistoryState());

  Future<void> init() async {
    await getReaonList();
    getAdvice();
  }

  Future<void> getReaonList() async {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }

    final RepositoryResult<GuiltyFreeReasonListModel> result =
        await _guiltyFreeRepository.getGuiltyFreeReasons();

    switch (result) {
      case SuccessRepositoryResult<GuiltyFreeReasonListModel>():
        if (mounted) {
          state = state.copyWith(
            reasonList: result.data,
            loadingStatus: LoadingStatus.success,
          );
        }
      case FailureRepositoryResult<GuiltyFreeReasonListModel>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
          );
        }
    }
  }

  void getAdvice() {
    // 이유가 둘 이상일 때만
    if (state.reasonList.reasons.length > 1) {
      // 최근 두 이유가 같을 때
      if (state.reasonList.reasons[0].reason ==
          state.reasonList.reasons[1].reason) {
        final String reason = state.reasonList.reasons.first.reason;
        switch (reason) {
          case 'PHYSICALLY_EXHAUSTED':
            if (mounted) {
              state = state.copyWith(
                advice:
                    '몸도 마음도, 지금은 회복이 필요해요.\n이번 주말엔 일정 비워두고 진짜 휴식을 계획해보는 건 어때요?',
              );
            }
          case 'PLAN_FAILED':
            if (mounted) {
              state = state.copyWith(
                advice: '계획을 수정하는 것도 실행의 일부예요.\n다음 계획은 여유 구간을 조금 더 넣어보는 건 어때요?',
              );
            }
          case 'NO_TIME_FOR_SCHEDULE':
            if (mounted) {
              state = state.copyWith(
                advice:
                    '지금은 ‘회복’이 가장 중요한 계획일지도 몰라요.\n중요한 일 하나만 먼저 골라서 처리해보는 건 어때요?',
              );
            }
          case 'LACK_OF_MOTIVATION':
            if (mounted) {
              state = state.copyWith(
                advice:
                    '혹시 요즘 나를 너무 몰아세우고 있진 않았나요?\n조금 더 단순하고 쉬운 할 일부터 시작해보는 건 어때요?',
              );
            }
        }
      }
    }
  }
}

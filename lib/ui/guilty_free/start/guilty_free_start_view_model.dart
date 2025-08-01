import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/ui/guilty_free/start/guilty_free_start_state.dart';

import '../../../repository/guilty_free/guilty_free_repository.dart';

final AutoDisposeStateNotifierProvider<GuiltyFreeStartViewModel,
        GuiltyFreeStartState> guiltyFreeStartViewModelProvider =
    StateNotifierProvider.autoDispose((ref) => GuiltyFreeStartViewModel(
          guiltyFreeRepository: ref.read(guiltyFreeRepositoryProvider),
        ));

class GuiltyFreeStartViewModel extends StateNotifier<GuiltyFreeStartState> {
  final GuiltyFreeRepository _guiltyFreeRepository;

  GuiltyFreeStartViewModel({
    required GuiltyFreeRepository guiltyFreeRepository,
  })  : _guiltyFreeRepository = guiltyFreeRepository,
        super(GuiltyFreeStartState());

  void selectReason({
    required String reason,
  }) {
    if (mounted) {
      state = state.copyWith(
        reason: reason,
        canStartGuiltyFree: true,
      );
    }
  }

  Future<void> startGuiltyFree() async {
    if (state.reason.isEmpty) return;

    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }

    final RepositoryResult<void> result =
        await _guiltyFreeRepository.startGuiltyFree(
      reason: state.reason,
    );

    switch (result) {
      case SuccessRepositoryResult<void>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.success,
          );
        }
      case FailureRepositoryResult<void>():
        if (mounted) {
          state = state.copyWith(
            loadingStatus: LoadingStatus.error,
            errorMessage: result.messages!.first,
          );
        }
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading_status.dart';
import '../../../core/repository_result.dart';
import '../../../repository/guilty_free/guilty_free_repository.dart';
import 'guilty_free_ing_state.dart';

final AutoDisposeStateNotifierProvider<GuiltyFreeIngViewModel,
        GuiltyFreeIngState> guiltyFreeIngViewModelProvider =
    StateNotifierProvider.autoDispose(
  (ref) => GuiltyFreeIngViewModel(
    guiltyFreeRepository: ref.read(guiltyFreeRepositoryProvider),
  ),
);

class GuiltyFreeIngViewModel extends StateNotifier<GuiltyFreeIngState> {
  final GuiltyFreeRepository _guiltyFreeRepository;

  GuiltyFreeIngViewModel({
    required GuiltyFreeRepository guiltyFreeRepository,
  })  : _guiltyFreeRepository = guiltyFreeRepository,
        super(GuiltyFreeIngState());

  void endGuiltyFree() {
    if (mounted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
    }

    final RepositoryResult<void> result = _guiltyFreeRepository.endGuiltyFree();

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
            errorMessage: '길티프리 모드 해제에 실패했어요.\n네트워크 연결을 확인한 후 다시 시도해주세요.',
          );
        }
    }
  }
}

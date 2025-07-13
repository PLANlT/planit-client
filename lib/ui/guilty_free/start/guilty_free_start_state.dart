import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/loading_status.dart';

part 'guilty_free_start_state.freezed.dart';

@freezed
abstract class GuiltyFreeStartState with _$GuiltyFreeStartState {
  const factory GuiltyFreeStartState({
    @Default('') String reason,
    @Default('') String errorMessage,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default(false) bool canStartGuiltyFree,
  }) = _GuiltyFreeStartState;
}

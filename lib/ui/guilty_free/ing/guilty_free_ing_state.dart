import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/loading_status.dart';

part 'guilty_free_ing_state.freezed.dart';

@freezed
abstract class GuiltyFreeIngState with _$GuiltyFreeIngState {
  const factory GuiltyFreeIngState({
    @Default('') String errorMessage,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
  }) = _GuiltyIngStartState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/repository/guilty_free/model/guilty_free_reason_list_model.dart';

import '../../../../core/loading_status.dart';

part 'guilty_free_history_state.freezed.dart';

@freezed
abstract class GuiltyFreeHistoryState with _$GuiltyFreeHistoryState {
  factory GuiltyFreeHistoryState({
    @Default(GuiltyFreeReasonListModel(reasons: []))
    GuiltyFreeReasonListModel reasonList,
    @Default('') String advice,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
  }) = _GuiltyFreeHistoryState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';

part 'task_more_bottom_sheet_state.freezed.dart';

@freezed
abstract class TaskMoreBottomSheetState with _$TaskMoreBottomSheetState {
  const factory TaskMoreBottomSheetState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _TaskMoreBottomSheetState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/data_source/task/response_body/routine_response_body.dart';

part 'task_edit_bottom_sheet_state.freezed.dart';

@freezed
abstract class TaskEditBottomSheetState with _$TaskEditBottomSheetState {
  const factory TaskEditBottomSheetState({
    @Default([]) List<String> routinDayList,
    @Default('') String time,
    @Default(false) bool timeSetting,
    @Default([]) List<String> taskType,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _TaskEditBottomSheetState;
}

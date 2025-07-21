import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';

part 'task_edit_bottom_sheet_state.freezed.dart';

@freezed
abstract class TaskEditBottomSheetState with _$TaskEditBottomSheetState {
  const factory TaskEditBottomSheetState({
    @Default([]) List<String> routinDayList,
    @Default([]) List<String> timeList,
    @Default(false) bool timeSetting,
    @Default([]) List<String> taskType,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _TaskEditBottomSheetState;
}

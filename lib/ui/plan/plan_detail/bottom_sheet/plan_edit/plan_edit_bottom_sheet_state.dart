import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/model/task_model.dart';
import 'package:planit/repository/plan/model/plan_overview_model.dart';

part 'plan_edit_bottom_sheet_state.freezed.dart';

@freezed
abstract class PlanEditBottomSheetState with _$PlanEditBottomSheetState {
  const factory PlanEditBottomSheetState({
    @Default([]) List<String> routinDayList,
    @Default([]) List<String> timeList,
    @Default(false) bool timeSetting,
    @Default([]) List<String> taskType,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanEditBottomSheetState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';

part 'plan_more_bottom_sheet_state.freezed.dart';

@freezed
abstract class PlanMoreBottomSheetState with _$PlanMoreBottomSheetState {
  const factory PlanMoreBottomSheetState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanMoreBottomSheetState;
}

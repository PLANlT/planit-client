import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';

part 'plan_more_bottom_sheet_state.freezed.dart';

@freezed
abstract class PlanMoreBottomSheetState with _$PlanMoreBottomSheetState {
  const factory PlanMoreBottomSheetState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanMoreBottomSheetState;
}

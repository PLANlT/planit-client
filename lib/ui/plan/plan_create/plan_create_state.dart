import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/ui/plan/component/plan_list_card.dart';

part 'plan_create_state.freezed.dart';

@freezed
abstract class PlanCreateState with _$PlanCreateState {
  const factory PlanCreateState({
    @Default('') String title,
    @Default('') String motivation,
    @Default('') String icon,
    @Default('') String dDay,
    @Default('IN_PROGRESS') String planStatus,
    @Default(false) bool isClickedNext,
    @Default('           ') String? selectedDate,
    @Default(false) bool isNextEnabled,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanCreateState;
}

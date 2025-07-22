import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';

part 'plan_template_state.freezed.dart';

@freezed
abstract class PlanTemplateState with _$PlanTemplateState {
  const factory PlanTemplateState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanTemplateState;
}

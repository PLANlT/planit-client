import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/ui/plan/component/plan_list_card.dart';
import 'package:planit/repository/plan/model/plan_model.dart';

part 'plan_state.freezed.dart';

@freezed
abstract class PlanState with _$PlanState {
  const factory PlanState({
    @Default([]) List<PlanModel> activePlans,
    @Default([]) List<PlanModel> pausePlans,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanState;
}

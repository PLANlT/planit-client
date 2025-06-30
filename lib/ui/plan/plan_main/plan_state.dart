
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/ui/plan/component/plan_list_card.dart';
import 'package:planit/repository/plan/model/plan_overview_model.dart';


part 'plan_state.freezed.dart';

@freezed
abstract class PlanState with _$PlanState {
  const factory PlanState({
    @Default([]) List<PlanOverviewModel> activePlans,
    @Default([]) List<PlanOverviewModel> pausePlans,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanState;
}

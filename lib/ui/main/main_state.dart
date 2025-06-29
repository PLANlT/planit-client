import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/ui/main/const/main_enums.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(RouteType.slow) RouteType routeType,
    @Default([]) List<MainPlanModel> plans,
    @Default(TaskStatus.none) TaskStatus taskStatus,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default(true) bool showRecoveryRoutineBanner,
    @Default('') String errorMessage,
  }) = _MainState;
}

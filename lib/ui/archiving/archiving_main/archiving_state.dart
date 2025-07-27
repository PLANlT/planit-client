import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';

part 'archiving_state.freezed.dart';

@freezed
abstract class ArchivingState with _$ArchivingState {
  const factory ArchivingState({
    @Default([]) List<ArchivingPlanModel> archivingPlans,
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _ArchivingState;
}

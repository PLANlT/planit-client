import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';

part 'archiving_restart_state.freezed.dart';

@freezed
abstract class ArchivingRestartState with _$ArchivingRestartState {
  const factory ArchivingRestartState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _ArchivingRestartState;
}

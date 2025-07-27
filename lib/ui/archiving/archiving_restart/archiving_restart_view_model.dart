import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/archiving/archiving_repository.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';
import 'package:planit/repository/archiving/model/archiving_restart_model.dart';
import 'package:planit/ui/archiving/archiving_main/archiving_state.dart';
import 'package:planit/ui/archiving/archiving_restart/archiving_restart_state.dart';

final archivingRestartViewModelProvider =
    StateNotifierProvider<ArchivingRestartViewModel, ArchivingRestartState>(
        (ref) => ArchivingRestartViewModel(
            archivingrepository: ref.read(archivingRepositoryProvider)));

class ArchivingRestartViewModel extends StateNotifier<ArchivingRestartState> {
  final ArchivingRepository _archivingRepository;

  ArchivingRestartViewModel({
    required ArchivingRepository archivingrepository,
  })  : _archivingRepository = archivingrepository,
        super(ArchivingRestartState());

  Future<void> restartArchivingPlan(int planId) async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final RepositoryResult<ArchivingRestartModel> archivingPlanresult =
        await _archivingRepository.restartPlanByPlanId(planId);
    switch (archivingPlanresult) {
      case SuccessRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
        );
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '아키이빙 재시작에 실패했어요.',
        );
    }
  }
}

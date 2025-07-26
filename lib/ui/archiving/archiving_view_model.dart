import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/archiving/archiving_repository.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';
import 'package:planit/ui/archiving/archiving_state.dart';

final archivingViewModelProvider =
    StateNotifierProvider<ArchivingViewModel, ArchivingState>((ref) =>
        ArchivingViewModel(
            archivingrepository: ref.read(archivingRepositoryProvider)));

class ArchivingViewModel extends StateNotifier<ArchivingState> {
  final ArchivingRepository _archivingRepository;

  ArchivingViewModel({
    required ArchivingRepository archivingrepository,
  })  : _archivingRepository = archivingrepository,
        super(ArchivingState());
  void init() {
    getArchivingPlanList();
  }

  Future<void> getArchivingPlanList() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final RepositoryResult<List<ArchivingPlanModel>> archivingPlanresult =
        await _archivingRepository.getArchivingPlanList();
    switch (archivingPlanresult) {
      case SuccessRepositoryResult():
        state = state.copyWith(
            loadingStatus: LoadingStatus.success,
            archivingPlans: archivingPlanresult.data);
      case FailureRepositoryResult():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: '아키이빙 불러오기에 실패했어요.',
        );
    }
  }
}

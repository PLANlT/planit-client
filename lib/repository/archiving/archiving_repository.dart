import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/error_message.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/archiving/archiving_data_source.dart';
import 'package:planit/data_source/archiving/response_body/archiving_restart_plan_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/archiving_complete_plan_response_body.dart';
import 'package:planit/data_source/archiving/response_body/archiving_plan_response_body.dart';
import 'package:planit/repository/archiving/model/archiving_complete_model.dart';
import 'package:planit/repository/archiving/model/archiving_plan_model.dart';
import 'package:planit/repository/archiving/model/archiving_restart_model.dart';

final AutoDisposeProvider<ArchivingRepository> archivingRepositoryProvider =
    Provider.autoDispose<ArchivingRepository>((ref) => ArchivingRepository(
        archivingDataSource: ref.read(archivingDataSourceProvider)));

class ArchivingRepository {
  final ArchivingDataSource _archivingDataSource;

  const ArchivingRepository({
    required ArchivingDataSource archivingDataSource,
  }) : _archivingDataSource = archivingDataSource;

  Future<RepositoryResult<List<ArchivingPlanModel>>>
      getArchivingPlanList() async {
    try {
      final ApiResponse<ArchivingPlanResponseBody> result =
          await _archivingDataSource.getArchivingPlanLists();
      final data = result.data;

      final models =
          data.archives.map((e) => ArchivingPlanModel.fromResponse(e)).toList();
      return SuccessRepositoryResult(data: models);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<ArchivingRestartModel>> restartPlanByPlanId(
      int planId) async {
    try {
      final ApiResponse<ArchivingRestartPlanResponseBody> result =
          await _archivingDataSource.restartPlan(planId: planId);
      final data = result.data;
      final model = ArchivingRestartModel.fromResponse(data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }
}

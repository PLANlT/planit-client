import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/error_message.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/plan/plan_data_source.dart';
import 'package:planit/data_source/plan/reponse_body/archiving_complete_plan_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_create_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_detail_response_body.dart';
import 'package:planit/data_source/plan/reponse_body/plan_response_body.dart';
import 'package:planit/data_source/plan/request_%20body/plan_request_body.dart';
import 'package:planit/repository/archiving/model/archiving_complete_model.dart';
import 'package:planit/repository/plan/model/plan_create_model.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';

final AutoDisposeProvider<PlanRepository> planRepositoryProvider =
    Provider.autoDispose<PlanRepository>(
  (ref) => PlanRepository(planDataSource: ref.read(planDataSourceProvider)),
);

class PlanRepository {
  final PlanDataSource _planDataSource;

  const PlanRepository({
    required PlanDataSource planDataSource,
  }) : _planDataSource = planDataSource;

  Future<RepositoryResult<void>> removePlan({required int planId}) async {
    try {
      await _planDataSource.deletePlan(planId: planId);
      return const SuccessRepositoryResult(data: null);
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    }
  }

  Future<RepositoryResult<PlanCreateModel>> createPlan({
    required String title,
    required String motivation,
    required String icon,
    required String planStatus,
    required String startedAt,
    required String? finishedAt,
  }) async {
    try {
      final ApiResponse<PlanCreateResponseBody> result =
          await _planDataSource.postPlan(
        body: PlanCreateRequestBody(
          title: title,
          motivation: motivation,
          icon: icon,
          planStatus: planStatus,
          startedAt: startedAt,
          finishedAt: finishedAt != null && finishedAt.length == 8
              ? '20$finishedAt'
              : finishedAt,
        ),
      );
      final model = PlanCreateModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<List<PlanModel>>> getActivePlanList() async {
    try {
      final ApiResponse<PlanListResponseBody> result =
          await _planDataSource.getPlanLists('IN_PROGRESS');

      final data = result.data;

      if (data.planStatus == 'IN_PROGRESS') {
        final plans = data.plans;
        final models =
            plans.map((e) => PlanModel.fromResponse(e, 'IN_PROGRESS')).toList();
        return SuccessRepositoryResult(data: models);
      } else {
        return SuccessRepositoryResult(data: []);
      }
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<List<PlanModel>>> getPausePlanList() async {
    try {
      final ApiResponse<PlanListResponseBody> result =
          await _planDataSource.getPlanLists('PAUSED');

      final data = result.data;

      if (data.planStatus == 'PAUSED') {
        final plans = data.plans;
        final models =
            plans.map((e) => PlanModel.fromResponse(e, 'PAUSED')).toList();
        return SuccessRepositoryResult(data: models);
      } else {
        return SuccessRepositoryResult(data: []);
      }
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<PlanCreateModel>> editPlanCreateState({
    required int planId,
    required String title,
    required String motivation,
    required String icon,
    required String planStatus,
    required String startedAt,
    required String finishedAt,
  }) async {
    try {
      final ApiResponse<PlanCreateResponseBody> result =
          await _planDataSource.patchPlan(
        planId: planId,
        body: PlanCreateRequestBody(
          title: title,
          motivation: motivation,
          icon: icon,
          planStatus: planStatus,
          startedAt: startedAt,
          finishedAt: finishedAt.length == 8 ? '20$finishedAt' : finishedAt,
        ),
      );
      final model = PlanCreateModel.fromResponse(result.data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<PlanDetailModel>> getPlanDetailByPlanId(
      int planId) async {
    try {
      final ApiResponse<PlanDetailResponseBody> result =
          await _planDataSource.getPlanDetails(planId);
      final data = result.data;
      final model = PlanDetailModel.fromResponse(data);

      return SuccessRepositoryResult(
        data: model,
      );
    } on DioException catch (e) {
      return FailureRepositoryResult(
        error: e,
        messages: [networkErrorMsg],
      );
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }

  Future<RepositoryResult<ArchivingCompleteModel>> completePlanByPlanId(
      int planId) async {
    try {
      final ApiResponse<ArchivingCompletePlanResponseBody> result =
          await _planDataSource.completePlan(planId: planId);
      final data = result.data;
      final model = ArchivingCompleteModel.fromResponse(data);
      return SuccessRepositoryResult(data: model);
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    } catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }
}

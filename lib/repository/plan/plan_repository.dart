import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/api_response.dart';
import 'package:planit/core/error_message.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/data_source/plan/plan_data_source.dart';
import 'package:planit/data_source/plan/reponse_body/plan_response_body.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/repository/plan/model/task_model.dart';
import 'package:planit/ui/common/assets.dart';

final AutoDisposeProvider<PlanRepository> planRepositoryProvider =
    Provider.autoDispose<PlanRepository>(
  (ref) => PlanRepository(planDataSource: ref.read(planDataSourceProvider)),
);

class PlanRepository {
  final PlanDataSource _planDataSource;

  const PlanRepository({
    required PlanDataSource planDataSource,
  }) : _planDataSource = planDataSource;

  Future<RepositoryResult<List<PlanModel>>> getActivePlanList() async {
    try {
      final ApiResponse<PlanListResponseBody> result =
          await _planDataSource.getPlanLists();

      final data = result.data;

      if (data.planStatus == 'IN_PROGRESS') {
        final plans = data.plans;
        final models = plans.map((e) => PlanModel.fromResponse(e)).toList();
        return SuccessRepositoryResult(data: models);
      } else {
        return SuccessRepositoryResult(data: []);
      }
    } on DioException catch (e) {
      return FailureRepositoryResult(error: e, messages: [networkErrorMsg]);
    }
  }
//
  Future<RepositoryResult<List<PlanModel>>> getPausePlanList() async {
    return SuccessRepositoryResult(data: []);
  }

  Future<RepositoryResult<PlanDetailModel>> getPlanDetailByPlanId(
      int planId) async {
    return SuccessRepositoryResult(
      data: PlanDetailModel(
        planId: 0,
        title: '다이어트',
        icon: Assets.planet1,
        motivation: '매일 조금씩 , 꾸준히 나아가자',
        tasks: [
          TaskModel(taskId: 0, taskType: 'ALL', title: '아침 식단 기록하기'),
          TaskModel(taskId: 0, taskType: 'ALL', title: '30분 산책하기'),
          TaskModel(taskId: 0, taskType: 'ALL', title: '저녁 과식 피하기'),
        ],
      ),
    );
  }
}

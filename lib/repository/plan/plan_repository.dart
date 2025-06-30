import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/model/plan_overview_model.dart';
import 'package:planit/repository/plan/model/task_model.dart';
import 'package:planit/ui/common/assets.dart';

final AutoDisposeProvider<PlanRepository> planRepositoryProvider =
    Provider.autoDispose<PlanRepository>(
  (ref) => PlanRepository(),
);

class PlanRepository {
  const PlanRepository();

  //서버 연결되면 바꾸기!!!!!!
  Future<RepositoryResult<List<PlanOverviewModel>>> getActivePlanList() async {
    return SuccessRepositoryResult(data: [
      PlanOverviewModel(
          title: 'TOEIC 고득점',
          subtitle: '매일 조금씩 나아지는..',
          routinNum: 5,
          dDay: 12,
          imagePath: 'assets/planets/planet1.svg'),
      PlanOverviewModel(
          title: '독서 습관',
          subtitle: '독서 습관을 기르자',
          routinNum: 2,
          dDay: 7,
          imagePath: 'assets/planets/planet3.svg'),
      PlanOverviewModel(
          title: '헬스장 꾸준히 가기',
          subtitle: '작심삼일 10번이면 한달이다',
          routinNum: 3,
          dDay: 20,
          imagePath: 'assets/planets/planet6.svg'),
    ]);
  }

  Future<RepositoryResult<List<PlanOverviewModel>>> getPausePlanList() async {
    return SuccessRepositoryResult(data: [
      PlanOverviewModel(
          title: '헬스장 꾸준히 가기',
          subtitle: '작심삼일 10번이면 한달이다',
          routinNum: 3,
          dDay: 20,
          imagePath: 'assets/planets/planet6.svg'),
    ]);
  }

  Future<RepositoryResult<PlanDetailModel>> getPlanDetailByPlanId(int planId) async {
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

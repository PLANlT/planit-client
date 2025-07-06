import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';
import 'package:planit/repository/plan/model/task_model.dart';
import 'package:planit/ui/common/assets.dart';

final AutoDisposeProvider<PlanRepository> planRepositoryProvider =
    Provider.autoDispose<PlanRepository>(
  (ref) => PlanRepository(),
);

class PlanRepository {
  const PlanRepository();

  //서버 연결되면 바꾸기!!!!!!
  Future<RepositoryResult<List<PlanModel>>> getActivePlanList() async {
    return SuccessRepositoryResult(data: [
      PlanModel(
          planId: 0,
          title: 'TOEIC 고득점',
          motivation: '매일 조금씩 나아지는..',
          totalTask: 5,
          dDay: 12,
          icon: 'assets/planets/planet1.svg'),
      PlanModel(
          planId: 1,
          title: '독서 습관',
          motivation: '독서 습관을 기르자',
          totalTask: 2,
          dDay: 7,
          icon: 'assets/planets/planet3.svg'),
      PlanModel(
          planId: 2,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 2,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 2,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 2,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
    ]);
  }

  Future<RepositoryResult<List<PlanModel>>> getPausePlanList() async {
    return SuccessRepositoryResult(data: [
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
      PlanModel(
          planId: 5,
          title: '헬스장 꾸준히 가기',
          motivation: '작심삼일 10번이면 한달이다',
          totalTask: 3,
          dDay: 20,
          icon: 'assets/planets/planet6.svg'),
    ]);
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

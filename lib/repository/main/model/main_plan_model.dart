import '../../../data_source/main/reponse_body/today_tasks_response_body.dart';

class TodayPlanListModel {
  final List<TodayPlanModel> slowPlans;
  final List<TodayPlanModel> passionatePlans;

  const TodayPlanListModel({
    required this.slowPlans,
    required this.passionatePlans,
  });

  TodayPlanListModel.fromResponse(TodayPlanListResponseBody response)
      : slowPlans = response.slowPlans
            .map((plan) => TodayPlanModel.fromResponse(plan))
            .toList(),
        passionatePlans = response.passionatePlans
            .map((plan) => TodayPlanModel.fromResponse(plan))
            .toList();
}

class TodayPlanModel {
  final int planId;
  final String title;
  final List<TaskStatusModel> tasks;
  final String dDay;

  const TodayPlanModel({
    required this.planId,
    required this.title,
    required this.tasks,
    required this.dDay,
  });

  TodayPlanModel.fromResponse(TodayPlanResponseBody response)
      : planId = response.planId,
        title = response.title,
        tasks = response.tasks
            .map((task) => TaskStatusModel.fromResponse(task))
            .toList(),
        dDay = response.dDay;
}

class TaskStatusModel {
  final int taskId;
  final String title;
  final bool isCompleted;

  const TaskStatusModel({
    required this.taskId,
    required this.title,
    required this.isCompleted,
  });

  TaskStatusModel.fromResponse(TaskStatusResponseBody response)
      : taskId = response.taskId,
        title = response.title,
        isCompleted = response.isCompleted;
}

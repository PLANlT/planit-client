import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_create_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/repository/task/task_repository.dart';
import 'package:planit/ui/plan/plan_template/plan_template.dart';
import 'package:planit/ui/plan/plan_template/plan_template_state.dart';

final planTemplateViewModelProvider =
    StateNotifierProvider<PlanTemplateViewModel, PlanTemplateState>(
  (ref) => PlanTemplateViewModel(
      planRepository: ref.read(planRepositoryProvider),
      taskRepository: ref.read(taskRepositoryProvider)),
);

class PlanTemplateViewModel extends StateNotifier<PlanTemplateState> {
  final PlanRepository _planRepository;
  final TaskRepository _taskRepository;

  PlanTemplateViewModel(
      {required PlanRepository planRepository,
      required TaskRepository taskRepository})
      : _planRepository = planRepository,
        _taskRepository = taskRepository,
        super(const PlanTemplateState());

  Future<RepositoryResult<void>> createPlanAndAddTask(
      PlanTemplateDetail templateDetail) async {
    final startedAt = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final iconMap = {
      '운동': 'assets/planets/planet3',
      '마음 정리': 'assets/planets/planet4',
      '재정': 'assets/planets/planet6',
      '자기계발': 'assets/planets/planet1',
      '관계': 'assets/planets/planet5',
    };

    final icon = iconMap[templateDetail.category] ?? 'assets/planets/planet3';

    final planCreateResult = await _planRepository.createPlan(
      title: templateDetail.title,
      motivation: templateDetail.descriptionShort,
      icon: icon,
      planStatus: 'IN_PROGRESS',
      startedAt: startedAt,
      finishedAt: null,
    );

    if (planCreateResult is FailureRepositoryResult) {
      return planCreateResult; // 실패 바로 반환
    }

    final PlanCreateModel createdPlan =
        (planCreateResult as SuccessRepositoryResult).data;
    final planId = createdPlan.planId;
    if (planId == null) {
      return const FailureRepositoryResult(
        error: 'Plan creation failed: planId is null',
        messages: ['플랜 생성에 실패했습니다.'],
      );
    }

    for (final task in templateDetail.tasks) {
      final taskAddResult = await _taskRepository.addTask(
        title: task.title,
        planId: planId,
        taskType: task.taskType,
      );

      if (taskAddResult is FailureRepositoryResult) {
        // 실패 시 처리 (예: 에러 반환, 로그 기록 등)
        return taskAddResult;
      }
    }

    // 성공
    return const SuccessRepositoryResult(data: null);
  }
}

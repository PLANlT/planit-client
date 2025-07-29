import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/plan/model/plan_create_model.dart';
import 'package:planit/repository/plan/plan_repository.dart';
import 'package:planit/repository/task/task_repository.dart';
import 'package:planit/ui/plan/plan_template/plan_template.dart';
import 'package:planit/ui/plan/plan_template/plan_template_state.dart';

final planTemplateViewModelProvider =
    StateNotifierProvider.autoDispose<PlanTemplateViewModel, PlanTemplateState>(
        (ref) {
  final link = ref.keepAlive();
  Future.delayed(const Duration(seconds: 30), () {
    link.close();
  });

  return PlanTemplateViewModel(
    planRepository: ref.read(planRepositoryProvider),
    taskRepository: ref.read(taskRepositoryProvider),
  );
});

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
    try {
      final startedAt = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final iconMap = {
        '운동': 'assets/planets/planet3',
        '마음 정리': 'assets/planets/planet4',
        '재정': 'assets/planets/planet5',
        '자기계발': 'assets/planets/planet1',
        '관계': 'assets/planets/planet6',
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

      if (!mounted) {
        print('⚠️ 뷰모델이 해제되었습니다.');
        return const FailureRepositoryResult(
          error: '뷰모델이 해제되었습니다.',
          messages: ['작업이 취소되었습니다.'],
        );
      }

      if (planCreateResult is! SuccessRepositoryResult<PlanCreateModel>) {
        return const FailureRepositoryResult(
          error: '플랜 생성 실패',
          messages: ['서버 응답을 처리할 수 없습니다.'],
        );
      }

      final createdPlan = planCreateResult.data;
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

        if (!mounted) {
          return const FailureRepositoryResult(
            error: '뷰모델이 해제되었습니다.',
            messages: ['작업이 취소되었습니다.'],
          );
        }

        if (taskAddResult is FailureRepositoryResult) {
          return taskAddResult;
        }
      }

      return const SuccessRepositoryResult(data: null);
    } catch (e, stack) {
      return const FailureRepositoryResult(
        error: '예상치 못한 오류',
        messages: ['잠시 후 다시 시도해주세요.'],
      );
    }
  }
}

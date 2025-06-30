import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/repository/plan/plan_repository.dart';

class TaskMoreBottomSheetViewModel {
  final PlanRepository _planRepository;

  TaskMoreBottomSheetViewModel({required PlanRepository planRepository})
      : _planRepository = planRepository;
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planit/repository/plan/plan_repository.dart';

class PlanMoreBottomSheetViewModel {
  final PlanRepository _planRepository;

  PlanMoreBottomSheetViewModel({required PlanRepository planRepository})
      : _planRepository = planRepository;
}

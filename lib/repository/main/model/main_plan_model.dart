import 'package:planit/ui/main/component/task_widget.dart';

class MainPlanModel {
  final String planTitle;
  final List<TempTaskModel> tasks;
  final int? dDay;

  MainPlanModel({
    required this.planTitle,
    required this.tasks,
    this.dDay,
  });
}

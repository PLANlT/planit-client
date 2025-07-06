// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planit/repository/plan/model/task_model.dart';

class TaskModel {
  final int taskId;
  final String taskType;
  final String title;

  TaskModel({
    required this.taskId,
    required this.taskType,
    required this.title,
  });
}

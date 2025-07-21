// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planit/data_source/plan/reponse_body/plan_detail_response_body.dart';
import 'package:planit/data_source/task/response_body/task_create_response_body.dart';
import 'package:planit/repository/task/model/task_model.dart';

class TaskModel {
  final int taskId;
  final String taskType;
  final String title;

  TaskModel({
    required this.taskId,
    required this.taskType,
    required this.title,
  });
  factory TaskModel.fromResponse(TaskCreateResponseBody response) {
    return TaskModel(
      taskId: response.taskId,
      taskType: response.taskType,
      title: response.title,
    );
  }
}

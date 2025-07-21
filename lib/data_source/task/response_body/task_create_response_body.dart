import 'package:json_annotation/json_annotation.dart';

part 'task_create_response_body.g.dart';

@JsonSerializable()
class TaskCreateResponseBody {
  final int taskId;
  final String taskType;
  final String title;

  TaskCreateResponseBody(
      {required this.taskId, required this.taskType, required this.title});
  factory TaskCreateResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TaskCreateResponseBodyFromJson(json);
}

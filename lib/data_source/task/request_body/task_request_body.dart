import 'package:json_annotation/json_annotation.dart';

part 'task_request_body.g.dart';

@JsonSerializable()
class TaskRequestBody {
  final String title;
  final String taskType;

  TaskRequestBody({
    required this.title,
    required this.taskType,
  });

  Map<String, dynamic> toJson() => _$TaskRequestBodyToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

// API 응답 구조
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool isSuccess;
  final String code;
  final String message;
  final T data;
  final bool success;

  const ApiResponse({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.data,
    required this.success,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromjsonT) =>
      _$ApiResponseFromJson(json, fromjsonT);
}

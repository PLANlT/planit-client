import 'package:freezed_annotation/freezed_annotation.dart';

part 'consecutive_days_response_body.g.dart';

@JsonSerializable()
class ConsecutiveDaysResponseBody {
  final int currentConsecutiveDays;
  final int maxConsecutiveDays;
  final int perfectConsecutiveDays;

  ConsecutiveDaysResponseBody({
    required this.currentConsecutiveDays,
    required this.maxConsecutiveDays,
    required this.perfectConsecutiveDays,
  });

  factory ConsecutiveDaysResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ConsecutiveDaysResponseBodyFromJson(json);
}

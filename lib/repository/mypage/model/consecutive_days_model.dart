import '../../../data_source/mypage/response_body/consecutive_days_response_body.dart';

class ConsecutiveDaysModel {
  final int currentConsecutiveDays;
  final int maxConsecutiveDays;
  final int perfectConsecutiveDays;

  ConsecutiveDaysModel({
    required this.currentConsecutiveDays,
    required this.maxConsecutiveDays,
    required this.perfectConsecutiveDays,
  });

  ConsecutiveDaysModel.fromResponse(ConsecutiveDaysResponseBody response)
      : currentConsecutiveDays = response.currentConsecutiveDays,
        maxConsecutiveDays = response.maxConsecutiveDays,
        perfectConsecutiveDays = response.perfectConsecutiveDays;
}

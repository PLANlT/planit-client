import 'package:planit/data_source/guilty_free/response_body/guilty_free_reason_list_response_body.dart';

class GuiltyFreeReasonListModel {
  final List<GuiltyFreeReasonModel> reasons;

  const GuiltyFreeReasonListModel({
    required this.reasons,
  });

  GuiltyFreeReasonListModel.fromResponse(
      GuiltyFreeReasonListResponseBody response)
      : reasons = response.guiltyFreeReasons
            .map((guiltyFreeReason) => GuiltyFreeReasonModel(
                  reason: guiltyFreeReason.reason,
                  date: guiltyFreeReason.activatedAt,
                ))
            .toList();
}

class GuiltyFreeReasonModel {
  final String reason;
  final String date;

  const GuiltyFreeReasonModel({
    required this.reason,
    required this.date,
  });
}

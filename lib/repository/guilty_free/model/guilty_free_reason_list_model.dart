import 'package:planit/data_source/guilty_free/response_body/guilty_free_reason_list_response_body.dart';

class GuiltyFreeReasonListModel {
  final List<String> reasons;

  const GuiltyFreeReasonListModel({
    required this.reasons,
  });

  GuiltyFreeReasonListModel.fromResponse(
      GuiltyFreeReasonListResponseBody response)
      : reasons = response.guiltyFreeReasons
            .map((guiltyFreeReason) => guiltyFreeReason.reason)
            .toList();
}

import 'package:planit/data_source/guilty_free/response_body/guilty_free_date_response_body.dart';

class GuiltyFreeDateModel {
  final String activatedAt;

  const GuiltyFreeDateModel({
    required this.activatedAt,
  });

  GuiltyFreeDateModel.fromResponse(GuiltyFreeDateResponseBody response)
      : activatedAt = response.activatedAt;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'guilty_free_reason_list_response_body.g.dart';

@JsonSerializable()
class GuiltyFreeReasonListResponseBody {
  final String memberName;
  final List<GuiltyFreeReasonResponseBody> guiltyFreeReasons;

  GuiltyFreeReasonListResponseBody({
    required this.memberName,
    required this.guiltyFreeReasons,
  });

  factory GuiltyFreeReasonListResponseBody.fromJson(
          Map<String, dynamic> json) =>
      _$GuiltyFreeReasonListResponseBodyFromJson(json);
}

@JsonSerializable()
class GuiltyFreeReasonResponseBody {
  final String activatedAt;
  final String reason;

  GuiltyFreeReasonResponseBody({
    required this.activatedAt,
    required this.reason,
  });

  factory GuiltyFreeReasonResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GuiltyFreeReasonResponseBodyFromJson(json);
}

import '../../common/assets.dart';

class GuiltyFreeReasonModel {
  final String reason;
  final String description;
  final String asset;
  final String apiReason;

  GuiltyFreeReasonModel({
    required this.reason,
    required this.description,
    required this.asset,
    required this.apiReason,
  });
}

List<GuiltyFreeReasonModel> reasons = [
  GuiltyFreeReasonModel(
    reason: '손에 안 잡혀요',
    description: '집중이 안 될 때',
    asset: Assets.imgGuiltyFreeReason1,
    apiReason: 'LACK_OF_MOTIVATION',
  ),
  GuiltyFreeReasonModel(
    reason: '계획대로 안돼요',
    description: '계획이 자꾸 틀어질 때',
    asset: Assets.imgGuiltyFreeReason2,
    apiReason: 'PLAN_FAILED',
  ),
  GuiltyFreeReasonModel(
    reason: '할 일이 많았어요',
    description: '밀려오는 일정에 압도될 때',
    asset: Assets.imgGuiltyFreeReason3,
    apiReason: 'NO_TIME_FOR_SCHEDULE',
  ),
  GuiltyFreeReasonModel(
    reason: '너무 지쳐버렸어요',
    description: '쉬지 못해 탈진했을 때',
    asset: Assets.imgGuiltyFreeReason4,
    apiReason: 'PHYSICALLY_EXHAUSTED',
  ),
];

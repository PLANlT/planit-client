import '../../common/assets.dart';

class ReasonModel {
  final String reason;
  final String description;
  final String asset;

  ReasonModel({
    required this.reason,
    required this.description,
    required this.asset,
  });
}

List<ReasonModel> reasons = [
  ReasonModel(
    reason: '손에 안 잡혀요',
    description: '집중이 안 될 때',
    asset: Assets.imgGuiltyFreeReason1,
  ),
  ReasonModel(
    reason: '계획대로 안돼요',
    description: '계획이 자꾸 틀어질 때',
    asset: Assets.imgGuiltyFreeReason2,
  ),
  ReasonModel(
    reason: '할 일이 많았어요',
    description: '밀려오는 일정에 압도될 때',
    asset: Assets.imgGuiltyFreeReason3,
  ),
  ReasonModel(
    reason: '너무 지쳐버렸어요',
    description: '쉬지 못해 탈진했을 때',
    asset: Assets.imgGuiltyFreeReason4,
  ),
];

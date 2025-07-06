import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';

part 'mypage_state.freezed.dart';

@freezed
abstract class MypageState with _$MypageState {
  const factory MypageState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
    @Default('') String userName,
    @Default('') String userEmail,
    @Default(-1) int currentConsecutiveDays,
    @Default(-1) int maxConsecutiveDays,
    @Default(-1) int perfectConsecutiveDays,
    @Default('') String appVersion,
    @Default(true) bool isSystemPushAccept,
    @Default(true) bool isTaskPushAccept,
    @Default(true) bool isGuiltyFreePushAccept,
    @Default('') String registrationDate,
    @Default('') String oAuthType,
  }) = _MypageState;
}

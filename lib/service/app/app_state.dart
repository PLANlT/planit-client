import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/guilty_free_status.dart';

part 'app_state.freezed.dart';
// 앱 전역상태를 저장합니다
@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isSignedIn,
    @Default(GuiltyFreeStatus.none) GuiltyFreeStatus guiltyFreeStatus,
  }) = _AppState;
}
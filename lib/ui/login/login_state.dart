import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/loading_status.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _LoginState;
}

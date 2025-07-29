import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/loading_status.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
    @Default('') String tempAccessToken,
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default('') String signUpType,
    @Default('') String oAuthToken,
    @Default(null) bool? isLoginCompleted,
    @Default(false) bool isTermOfInfoAgreed,
    @Default(false) bool isTermOfUseAgreed,
    @Default(false) bool isThirdPartyAdConsent,
    @Default(false) bool isTermOfPrivacyAgreed,
    @Default(false) bool isAgeRestrictionAgreed
  }) = _LoginState;
}

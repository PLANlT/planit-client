// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  LoadingStatus get loadingStatus;
  String get errorMessage;
  String get tempAccessToken;
  String get accessToken;
  String get refreshToken;
  String get signUpType;
  String get oAuthToken;
  bool? get isLoginCompleted;
  bool get isTermOfInfoAgreed;
  bool get isTermOfUseAgreed;
  bool get isThirdPartyAdConsent;
  bool get isTermOfPrivacyAgreed;
  bool get isAgeRestrictionAgreed;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.tempAccessToken, tempAccessToken) ||
                other.tempAccessToken == tempAccessToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.signUpType, signUpType) ||
                other.signUpType == signUpType) &&
            (identical(other.oAuthToken, oAuthToken) ||
                other.oAuthToken == oAuthToken) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.isTermOfInfoAgreed, isTermOfInfoAgreed) ||
                other.isTermOfInfoAgreed == isTermOfInfoAgreed) &&
            (identical(other.isTermOfUseAgreed, isTermOfUseAgreed) ||
                other.isTermOfUseAgreed == isTermOfUseAgreed) &&
            (identical(other.isThirdPartyAdConsent, isThirdPartyAdConsent) ||
                other.isThirdPartyAdConsent == isThirdPartyAdConsent) &&
            (identical(other.isTermOfPrivacyAgreed, isTermOfPrivacyAgreed) ||
                other.isTermOfPrivacyAgreed == isTermOfPrivacyAgreed) &&
            (identical(other.isAgeRestrictionAgreed, isAgeRestrictionAgreed) ||
                other.isAgeRestrictionAgreed == isAgeRestrictionAgreed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      errorMessage,
      tempAccessToken,
      accessToken,
      refreshToken,
      signUpType,
      oAuthToken,
      isLoginCompleted,
      isTermOfInfoAgreed,
      isTermOfUseAgreed,
      isThirdPartyAdConsent,
      isTermOfPrivacyAgreed,
      isAgeRestrictionAgreed);

  @override
  String toString() {
    return 'LoginState(loadingStatus: $loadingStatus, errorMessage: $errorMessage, tempAccessToken: $tempAccessToken, accessToken: $accessToken, refreshToken: $refreshToken, signUpType: $signUpType, oAuthToken: $oAuthToken, isLoginCompleted: $isLoginCompleted, isTermOfInfoAgreed: $isTermOfInfoAgreed, isTermOfUseAgreed: $isTermOfUseAgreed, isThirdPartyAdConsent: $isThirdPartyAdConsent, isTermOfPrivacyAgreed: $isTermOfPrivacyAgreed, isAgeRestrictionAgreed: $isAgeRestrictionAgreed)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      String errorMessage,
      String tempAccessToken,
      String accessToken,
      String refreshToken,
      String signUpType,
      String oAuthToken,
      bool? isLoginCompleted,
      bool isTermOfInfoAgreed,
      bool isTermOfUseAgreed,
      bool isThirdPartyAdConsent,
      bool isTermOfPrivacyAgreed,
      bool isAgeRestrictionAgreed});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
    Object? tempAccessToken = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? signUpType = null,
    Object? oAuthToken = null,
    Object? isLoginCompleted = freezed,
    Object? isTermOfInfoAgreed = null,
    Object? isTermOfUseAgreed = null,
    Object? isThirdPartyAdConsent = null,
    Object? isTermOfPrivacyAgreed = null,
    Object? isAgeRestrictionAgreed = null,
  }) {
    return _then(_self.copyWith(
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      tempAccessToken: null == tempAccessToken
          ? _self.tempAccessToken
          : tempAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      signUpType: null == signUpType
          ? _self.signUpType
          : signUpType // ignore: cast_nullable_to_non_nullable
              as String,
      oAuthToken: null == oAuthToken
          ? _self.oAuthToken
          : oAuthToken // ignore: cast_nullable_to_non_nullable
              as String,
      isLoginCompleted: freezed == isLoginCompleted
          ? _self.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTermOfInfoAgreed: null == isTermOfInfoAgreed
          ? _self.isTermOfInfoAgreed
          : isTermOfInfoAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermOfUseAgreed: null == isTermOfUseAgreed
          ? _self.isTermOfUseAgreed
          : isTermOfUseAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      isThirdPartyAdConsent: null == isThirdPartyAdConsent
          ? _self.isThirdPartyAdConsent
          : isThirdPartyAdConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermOfPrivacyAgreed: null == isTermOfPrivacyAgreed
          ? _self.isTermOfPrivacyAgreed
          : isTermOfPrivacyAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgeRestrictionAgreed: null == isAgeRestrictionAgreed
          ? _self.isAgeRestrictionAgreed
          : isAgeRestrictionAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _LoginState implements LoginState {
  const _LoginState(
      {this.loadingStatus = LoadingStatus.none,
      this.errorMessage = '',
      this.tempAccessToken = '',
      this.accessToken = '',
      this.refreshToken = '',
      this.signUpType = '',
      this.oAuthToken = '',
      this.isLoginCompleted = null,
      this.isTermOfInfoAgreed = false,
      this.isTermOfUseAgreed = false,
      this.isThirdPartyAdConsent = false,
      this.isTermOfPrivacyAgreed = false,
      this.isAgeRestrictionAgreed = false});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String tempAccessToken;
  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final String refreshToken;
  @override
  @JsonKey()
  final String signUpType;
  @override
  @JsonKey()
  final String oAuthToken;
  @override
  @JsonKey()
  final bool? isLoginCompleted;
  @override
  @JsonKey()
  final bool isTermOfInfoAgreed;
  @override
  @JsonKey()
  final bool isTermOfUseAgreed;
  @override
  @JsonKey()
  final bool isThirdPartyAdConsent;
  @override
  @JsonKey()
  final bool isTermOfPrivacyAgreed;
  @override
  @JsonKey()
  final bool isAgeRestrictionAgreed;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.tempAccessToken, tempAccessToken) ||
                other.tempAccessToken == tempAccessToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.signUpType, signUpType) ||
                other.signUpType == signUpType) &&
            (identical(other.oAuthToken, oAuthToken) ||
                other.oAuthToken == oAuthToken) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.isTermOfInfoAgreed, isTermOfInfoAgreed) ||
                other.isTermOfInfoAgreed == isTermOfInfoAgreed) &&
            (identical(other.isTermOfUseAgreed, isTermOfUseAgreed) ||
                other.isTermOfUseAgreed == isTermOfUseAgreed) &&
            (identical(other.isThirdPartyAdConsent, isThirdPartyAdConsent) ||
                other.isThirdPartyAdConsent == isThirdPartyAdConsent) &&
            (identical(other.isTermOfPrivacyAgreed, isTermOfPrivacyAgreed) ||
                other.isTermOfPrivacyAgreed == isTermOfPrivacyAgreed) &&
            (identical(other.isAgeRestrictionAgreed, isAgeRestrictionAgreed) ||
                other.isAgeRestrictionAgreed == isAgeRestrictionAgreed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      errorMessage,
      tempAccessToken,
      accessToken,
      refreshToken,
      signUpType,
      oAuthToken,
      isLoginCompleted,
      isTermOfInfoAgreed,
      isTermOfUseAgreed,
      isThirdPartyAdConsent,
      isTermOfPrivacyAgreed,
      isAgeRestrictionAgreed);

  @override
  String toString() {
    return 'LoginState(loadingStatus: $loadingStatus, errorMessage: $errorMessage, tempAccessToken: $tempAccessToken, accessToken: $accessToken, refreshToken: $refreshToken, signUpType: $signUpType, oAuthToken: $oAuthToken, isLoginCompleted: $isLoginCompleted, isTermOfInfoAgreed: $isTermOfInfoAgreed, isTermOfUseAgreed: $isTermOfUseAgreed, isThirdPartyAdConsent: $isThirdPartyAdConsent, isTermOfPrivacyAgreed: $isTermOfPrivacyAgreed, isAgeRestrictionAgreed: $isAgeRestrictionAgreed)';
  }
}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) _then) =
      __$LoginStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      String errorMessage,
      String tempAccessToken,
      String accessToken,
      String refreshToken,
      String signUpType,
      String oAuthToken,
      bool? isLoginCompleted,
      bool isTermOfInfoAgreed,
      bool isTermOfUseAgreed,
      bool isThirdPartyAdConsent,
      bool isTermOfPrivacyAgreed,
      bool isAgeRestrictionAgreed});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
    Object? tempAccessToken = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? signUpType = null,
    Object? oAuthToken = null,
    Object? isLoginCompleted = freezed,
    Object? isTermOfInfoAgreed = null,
    Object? isTermOfUseAgreed = null,
    Object? isThirdPartyAdConsent = null,
    Object? isTermOfPrivacyAgreed = null,
    Object? isAgeRestrictionAgreed = null,
  }) {
    return _then(_LoginState(
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      tempAccessToken: null == tempAccessToken
          ? _self.tempAccessToken
          : tempAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      signUpType: null == signUpType
          ? _self.signUpType
          : signUpType // ignore: cast_nullable_to_non_nullable
              as String,
      oAuthToken: null == oAuthToken
          ? _self.oAuthToken
          : oAuthToken // ignore: cast_nullable_to_non_nullable
              as String,
      isLoginCompleted: freezed == isLoginCompleted
          ? _self.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTermOfInfoAgreed: null == isTermOfInfoAgreed
          ? _self.isTermOfInfoAgreed
          : isTermOfInfoAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermOfUseAgreed: null == isTermOfUseAgreed
          ? _self.isTermOfUseAgreed
          : isTermOfUseAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      isThirdPartyAdConsent: null == isThirdPartyAdConsent
          ? _self.isThirdPartyAdConsent
          : isThirdPartyAdConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermOfPrivacyAgreed: null == isTermOfPrivacyAgreed
          ? _self.isTermOfPrivacyAgreed
          : isTermOfPrivacyAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgeRestrictionAgreed: null == isAgeRestrictionAgreed
          ? _self.isAgeRestrictionAgreed
          : isAgeRestrictionAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

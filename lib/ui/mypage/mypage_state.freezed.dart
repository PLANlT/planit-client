// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mypage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MypageState {
  LoadingStatus get loadingStatus;
  String get errorMessage;
  String get userName;
  String get userEmail;
  int get currentConsecutiveDays;
  int get maxConsecutiveDays;
  int get perfectConsecutiveDays;
  String get appVersion;
  bool get isSystemPushAccept;
  bool get isTaskPushAccept;
  bool get isGuiltyFreePushAccept;
  String get registrationDate;
  String get oAuthType;

  /// Create a copy of MypageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MypageStateCopyWith<MypageState> get copyWith =>
      _$MypageStateCopyWithImpl<MypageState>(this as MypageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MypageState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.currentConsecutiveDays, currentConsecutiveDays) ||
                other.currentConsecutiveDays == currentConsecutiveDays) &&
            (identical(other.maxConsecutiveDays, maxConsecutiveDays) ||
                other.maxConsecutiveDays == maxConsecutiveDays) &&
            (identical(other.perfectConsecutiveDays, perfectConsecutiveDays) ||
                other.perfectConsecutiveDays == perfectConsecutiveDays) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.isSystemPushAccept, isSystemPushAccept) ||
                other.isSystemPushAccept == isSystemPushAccept) &&
            (identical(other.isTaskPushAccept, isTaskPushAccept) ||
                other.isTaskPushAccept == isTaskPushAccept) &&
            (identical(other.isGuiltyFreePushAccept, isGuiltyFreePushAccept) ||
                other.isGuiltyFreePushAccept == isGuiltyFreePushAccept) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.oAuthType, oAuthType) ||
                other.oAuthType == oAuthType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      errorMessage,
      userName,
      userEmail,
      currentConsecutiveDays,
      maxConsecutiveDays,
      perfectConsecutiveDays,
      appVersion,
      isSystemPushAccept,
      isTaskPushAccept,
      isGuiltyFreePushAccept,
      registrationDate,
      oAuthType);

  @override
  String toString() {
    return 'MypageState(loadingStatus: $loadingStatus, errorMessage: $errorMessage, userName: $userName, userEmail: $userEmail, currentConsecutiveDays: $currentConsecutiveDays, maxConsecutiveDays: $maxConsecutiveDays, perfectConsecutiveDays: $perfectConsecutiveDays, appVersion: $appVersion, isSystemPushAccept: $isSystemPushAccept, isTaskPushAccept: $isTaskPushAccept, isGuiltyFreePushAccept: $isGuiltyFreePushAccept, registrationDate: $registrationDate, oAuthType: $oAuthType)';
  }
}

/// @nodoc
abstract mixin class $MypageStateCopyWith<$Res> {
  factory $MypageStateCopyWith(
          MypageState value, $Res Function(MypageState) _then) =
      _$MypageStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      String errorMessage,
      String userName,
      String userEmail,
      int currentConsecutiveDays,
      int maxConsecutiveDays,
      int perfectConsecutiveDays,
      String appVersion,
      bool isSystemPushAccept,
      bool isTaskPushAccept,
      bool isGuiltyFreePushAccept,
      String registrationDate,
      String oAuthType});
}

/// @nodoc
class _$MypageStateCopyWithImpl<$Res> implements $MypageStateCopyWith<$Res> {
  _$MypageStateCopyWithImpl(this._self, this._then);

  final MypageState _self;
  final $Res Function(MypageState) _then;

  /// Create a copy of MypageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? currentConsecutiveDays = null,
    Object? maxConsecutiveDays = null,
    Object? perfectConsecutiveDays = null,
    Object? appVersion = null,
    Object? isSystemPushAccept = null,
    Object? isTaskPushAccept = null,
    Object? isGuiltyFreePushAccept = null,
    Object? registrationDate = null,
    Object? oAuthType = null,
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
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      currentConsecutiveDays: null == currentConsecutiveDays
          ? _self.currentConsecutiveDays
          : currentConsecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxConsecutiveDays: null == maxConsecutiveDays
          ? _self.maxConsecutiveDays
          : maxConsecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      perfectConsecutiveDays: null == perfectConsecutiveDays
          ? _self.perfectConsecutiveDays
          : perfectConsecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isSystemPushAccept: null == isSystemPushAccept
          ? _self.isSystemPushAccept
          : isSystemPushAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      isTaskPushAccept: null == isTaskPushAccept
          ? _self.isTaskPushAccept
          : isTaskPushAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      isGuiltyFreePushAccept: null == isGuiltyFreePushAccept
          ? _self.isGuiltyFreePushAccept
          : isGuiltyFreePushAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationDate: null == registrationDate
          ? _self.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      oAuthType: null == oAuthType
          ? _self.oAuthType
          : oAuthType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _MypageState implements MypageState {
  const _MypageState(
      {this.loadingStatus = LoadingStatus.none,
      this.errorMessage = '',
      this.userName = '',
      this.userEmail = '',
      this.currentConsecutiveDays = 0,
      this.maxConsecutiveDays = 0,
      this.perfectConsecutiveDays = 0,
      this.appVersion = '',
      this.isSystemPushAccept = true,
      this.isTaskPushAccept = true,
      this.isGuiltyFreePushAccept = true,
      this.registrationDate = '',
      this.oAuthType = ''});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String userEmail;
  @override
  @JsonKey()
  final int currentConsecutiveDays;
  @override
  @JsonKey()
  final int maxConsecutiveDays;
  @override
  @JsonKey()
  final int perfectConsecutiveDays;
  @override
  @JsonKey()
  final String appVersion;
  @override
  @JsonKey()
  final bool isSystemPushAccept;
  @override
  @JsonKey()
  final bool isTaskPushAccept;
  @override
  @JsonKey()
  final bool isGuiltyFreePushAccept;
  @override
  @JsonKey()
  final String registrationDate;
  @override
  @JsonKey()
  final String oAuthType;

  /// Create a copy of MypageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MypageStateCopyWith<_MypageState> get copyWith =>
      __$MypageStateCopyWithImpl<_MypageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MypageState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.currentConsecutiveDays, currentConsecutiveDays) ||
                other.currentConsecutiveDays == currentConsecutiveDays) &&
            (identical(other.maxConsecutiveDays, maxConsecutiveDays) ||
                other.maxConsecutiveDays == maxConsecutiveDays) &&
            (identical(other.perfectConsecutiveDays, perfectConsecutiveDays) ||
                other.perfectConsecutiveDays == perfectConsecutiveDays) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.isSystemPushAccept, isSystemPushAccept) ||
                other.isSystemPushAccept == isSystemPushAccept) &&
            (identical(other.isTaskPushAccept, isTaskPushAccept) ||
                other.isTaskPushAccept == isTaskPushAccept) &&
            (identical(other.isGuiltyFreePushAccept, isGuiltyFreePushAccept) ||
                other.isGuiltyFreePushAccept == isGuiltyFreePushAccept) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.oAuthType, oAuthType) ||
                other.oAuthType == oAuthType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      errorMessage,
      userName,
      userEmail,
      currentConsecutiveDays,
      maxConsecutiveDays,
      perfectConsecutiveDays,
      appVersion,
      isSystemPushAccept,
      isTaskPushAccept,
      isGuiltyFreePushAccept,
      registrationDate,
      oAuthType);

  @override
  String toString() {
    return 'MypageState(loadingStatus: $loadingStatus, errorMessage: $errorMessage, userName: $userName, userEmail: $userEmail, currentConsecutiveDays: $currentConsecutiveDays, maxConsecutiveDays: $maxConsecutiveDays, perfectConsecutiveDays: $perfectConsecutiveDays, appVersion: $appVersion, isSystemPushAccept: $isSystemPushAccept, isTaskPushAccept: $isTaskPushAccept, isGuiltyFreePushAccept: $isGuiltyFreePushAccept, registrationDate: $registrationDate, oAuthType: $oAuthType)';
  }
}

/// @nodoc
abstract mixin class _$MypageStateCopyWith<$Res>
    implements $MypageStateCopyWith<$Res> {
  factory _$MypageStateCopyWith(
          _MypageState value, $Res Function(_MypageState) _then) =
      __$MypageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      String errorMessage,
      String userName,
      String userEmail,
      int currentConsecutiveDays,
      int maxConsecutiveDays,
      int perfectConsecutiveDays,
      String appVersion,
      bool isSystemPushAccept,
      bool isTaskPushAccept,
      bool isGuiltyFreePushAccept,
      String registrationDate,
      String oAuthType});
}

/// @nodoc
class __$MypageStateCopyWithImpl<$Res> implements _$MypageStateCopyWith<$Res> {
  __$MypageStateCopyWithImpl(this._self, this._then);

  final _MypageState _self;
  final $Res Function(_MypageState) _then;

  /// Create a copy of MypageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? currentConsecutiveDays = null,
    Object? maxConsecutiveDays = null,
    Object? perfectConsecutiveDays = null,
    Object? appVersion = null,
    Object? isSystemPushAccept = null,
    Object? isTaskPushAccept = null,
    Object? isGuiltyFreePushAccept = null,
    Object? registrationDate = null,
    Object? oAuthType = null,
  }) {
    return _then(_MypageState(
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      currentConsecutiveDays: null == currentConsecutiveDays
          ? _self.currentConsecutiveDays
          : currentConsecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxConsecutiveDays: null == maxConsecutiveDays
          ? _self.maxConsecutiveDays
          : maxConsecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      perfectConsecutiveDays: null == perfectConsecutiveDays
          ? _self.perfectConsecutiveDays
          : perfectConsecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isSystemPushAccept: null == isSystemPushAccept
          ? _self.isSystemPushAccept
          : isSystemPushAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      isTaskPushAccept: null == isTaskPushAccept
          ? _self.isTaskPushAccept
          : isTaskPushAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      isGuiltyFreePushAccept: null == isGuiltyFreePushAccept
          ? _self.isGuiltyFreePushAccept
          : isGuiltyFreePushAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationDate: null == registrationDate
          ? _self.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      oAuthType: null == oAuthType
          ? _self.oAuthType
          : oAuthType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guilty_free_start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuiltyFreeStartState {
  String get reason;
  String get errorMessage;
  LoadingStatus get loadingStatus;
  bool get canStartGuiltyFree;

  /// Create a copy of GuiltyFreeStartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GuiltyFreeStartStateCopyWith<GuiltyFreeStartState> get copyWith =>
      _$GuiltyFreeStartStateCopyWithImpl<GuiltyFreeStartState>(
          this as GuiltyFreeStartState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GuiltyFreeStartState &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.canStartGuiltyFree, canStartGuiltyFree) ||
                other.canStartGuiltyFree == canStartGuiltyFree));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, reason, errorMessage, loadingStatus, canStartGuiltyFree);

  @override
  String toString() {
    return 'GuiltyFreeStartState(reason: $reason, errorMessage: $errorMessage, loadingStatus: $loadingStatus, canStartGuiltyFree: $canStartGuiltyFree)';
  }
}

/// @nodoc
abstract mixin class $GuiltyFreeStartStateCopyWith<$Res> {
  factory $GuiltyFreeStartStateCopyWith(GuiltyFreeStartState value,
          $Res Function(GuiltyFreeStartState) _then) =
      _$GuiltyFreeStartStateCopyWithImpl;
  @useResult
  $Res call(
      {String reason,
      String errorMessage,
      LoadingStatus loadingStatus,
      bool canStartGuiltyFree});
}

/// @nodoc
class _$GuiltyFreeStartStateCopyWithImpl<$Res>
    implements $GuiltyFreeStartStateCopyWith<$Res> {
  _$GuiltyFreeStartStateCopyWithImpl(this._self, this._then);

  final GuiltyFreeStartState _self;
  final $Res Function(GuiltyFreeStartState) _then;

  /// Create a copy of GuiltyFreeStartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? errorMessage = null,
    Object? loadingStatus = null,
    Object? canStartGuiltyFree = null,
  }) {
    return _then(_self.copyWith(
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      canStartGuiltyFree: null == canStartGuiltyFree
          ? _self.canStartGuiltyFree
          : canStartGuiltyFree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _GuiltyFreeStartState implements GuiltyFreeStartState {
  const _GuiltyFreeStartState(
      {this.reason = '',
      this.errorMessage = '',
      this.loadingStatus = LoadingStatus.none,
      this.canStartGuiltyFree = false});

  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final bool canStartGuiltyFree;

  /// Create a copy of GuiltyFreeStartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GuiltyFreeStartStateCopyWith<_GuiltyFreeStartState> get copyWith =>
      __$GuiltyFreeStartStateCopyWithImpl<_GuiltyFreeStartState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GuiltyFreeStartState &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.canStartGuiltyFree, canStartGuiltyFree) ||
                other.canStartGuiltyFree == canStartGuiltyFree));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, reason, errorMessage, loadingStatus, canStartGuiltyFree);

  @override
  String toString() {
    return 'GuiltyFreeStartState(reason: $reason, errorMessage: $errorMessage, loadingStatus: $loadingStatus, canStartGuiltyFree: $canStartGuiltyFree)';
  }
}

/// @nodoc
abstract mixin class _$GuiltyFreeStartStateCopyWith<$Res>
    implements $GuiltyFreeStartStateCopyWith<$Res> {
  factory _$GuiltyFreeStartStateCopyWith(_GuiltyFreeStartState value,
          $Res Function(_GuiltyFreeStartState) _then) =
      __$GuiltyFreeStartStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String reason,
      String errorMessage,
      LoadingStatus loadingStatus,
      bool canStartGuiltyFree});
}

/// @nodoc
class __$GuiltyFreeStartStateCopyWithImpl<$Res>
    implements _$GuiltyFreeStartStateCopyWith<$Res> {
  __$GuiltyFreeStartStateCopyWithImpl(this._self, this._then);

  final _GuiltyFreeStartState _self;
  final $Res Function(_GuiltyFreeStartState) _then;

  /// Create a copy of GuiltyFreeStartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
    Object? errorMessage = null,
    Object? loadingStatus = null,
    Object? canStartGuiltyFree = null,
  }) {
    return _then(_GuiltyFreeStartState(
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      canStartGuiltyFree: null == canStartGuiltyFree
          ? _self.canStartGuiltyFree
          : canStartGuiltyFree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

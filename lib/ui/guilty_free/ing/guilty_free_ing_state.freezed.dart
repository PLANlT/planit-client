// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guilty_free_ing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuiltyFreeIngState {
  String get errorMessage;
  LoadingStatus get loadingStatus;

  /// Create a copy of GuiltyFreeIngState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GuiltyFreeIngStateCopyWith<GuiltyFreeIngState> get copyWith =>
      _$GuiltyFreeIngStateCopyWithImpl<GuiltyFreeIngState>(
          this as GuiltyFreeIngState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GuiltyFreeIngState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, loadingStatus);

  @override
  String toString() {
    return 'GuiltyFreeIngState(errorMessage: $errorMessage, loadingStatus: $loadingStatus)';
  }
}

/// @nodoc
abstract mixin class $GuiltyFreeIngStateCopyWith<$Res> {
  factory $GuiltyFreeIngStateCopyWith(
          GuiltyFreeIngState value, $Res Function(GuiltyFreeIngState) _then) =
      _$GuiltyFreeIngStateCopyWithImpl;
  @useResult
  $Res call({String errorMessage, LoadingStatus loadingStatus});
}

/// @nodoc
class _$GuiltyFreeIngStateCopyWithImpl<$Res>
    implements $GuiltyFreeIngStateCopyWith<$Res> {
  _$GuiltyFreeIngStateCopyWithImpl(this._self, this._then);

  final GuiltyFreeIngState _self;
  final $Res Function(GuiltyFreeIngState) _then;

  /// Create a copy of GuiltyFreeIngState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? loadingStatus = null,
  }) {
    return _then(_self.copyWith(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _GuiltyIngStartState implements GuiltyFreeIngState {
  const _GuiltyIngStartState(
      {this.errorMessage = '', this.loadingStatus = LoadingStatus.none});

  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;

  /// Create a copy of GuiltyFreeIngState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GuiltyIngStartStateCopyWith<_GuiltyIngStartState> get copyWith =>
      __$GuiltyIngStartStateCopyWithImpl<_GuiltyIngStartState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GuiltyIngStartState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, loadingStatus);

  @override
  String toString() {
    return 'GuiltyFreeIngState(errorMessage: $errorMessage, loadingStatus: $loadingStatus)';
  }
}

/// @nodoc
abstract mixin class _$GuiltyIngStartStateCopyWith<$Res>
    implements $GuiltyFreeIngStateCopyWith<$Res> {
  factory _$GuiltyIngStartStateCopyWith(_GuiltyIngStartState value,
          $Res Function(_GuiltyIngStartState) _then) =
      __$GuiltyIngStartStateCopyWithImpl;
  @override
  @useResult
  $Res call({String errorMessage, LoadingStatus loadingStatus});
}

/// @nodoc
class __$GuiltyIngStartStateCopyWithImpl<$Res>
    implements _$GuiltyIngStartStateCopyWith<$Res> {
  __$GuiltyIngStartStateCopyWithImpl(this._self, this._then);

  final _GuiltyIngStartState _self;
  final $Res Function(_GuiltyIngStartState) _then;

  /// Create a copy of GuiltyFreeIngState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
    Object? loadingStatus = null,
  }) {
    return _then(_GuiltyIngStartState(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

// dart format on

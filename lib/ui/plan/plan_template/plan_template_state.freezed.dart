// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_template_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanTemplateState {
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of PlanTemplateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanTemplateStateCopyWith<PlanTemplateState> get copyWith =>
      _$PlanTemplateStateCopyWithImpl<PlanTemplateState>(
          this as PlanTemplateState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlanTemplateState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanTemplateState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PlanTemplateStateCopyWith<$Res> {
  factory $PlanTemplateStateCopyWith(
          PlanTemplateState value, $Res Function(PlanTemplateState) _then) =
      _$PlanTemplateStateCopyWithImpl;
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class _$PlanTemplateStateCopyWithImpl<$Res>
    implements $PlanTemplateStateCopyWith<$Res> {
  _$PlanTemplateStateCopyWithImpl(this._self, this._then);

  final PlanTemplateState _self;
  final $Res Function(PlanTemplateState) _then;

  /// Create a copy of PlanTemplateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
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
    ));
  }
}

/// @nodoc

class _PlanTemplateState implements PlanTemplateState {
  const _PlanTemplateState(
      {this.loadingStatus = LoadingStatus.none, this.errorMessage = ''});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of PlanTemplateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanTemplateStateCopyWith<_PlanTemplateState> get copyWith =>
      __$PlanTemplateStateCopyWithImpl<_PlanTemplateState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanTemplateState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanTemplateState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PlanTemplateStateCopyWith<$Res>
    implements $PlanTemplateStateCopyWith<$Res> {
  factory _$PlanTemplateStateCopyWith(
          _PlanTemplateState value, $Res Function(_PlanTemplateState) _then) =
      __$PlanTemplateStateCopyWithImpl;
  @override
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class __$PlanTemplateStateCopyWithImpl<$Res>
    implements _$PlanTemplateStateCopyWith<$Res> {
  __$PlanTemplateStateCopyWithImpl(this._self, this._then);

  final _PlanTemplateState _self;
  final $Res Function(_PlanTemplateState) _then;

  /// Create a copy of PlanTemplateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_PlanTemplateState(
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

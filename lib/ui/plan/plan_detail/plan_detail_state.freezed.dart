// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanDetailState {
  PlanDetailModel? get planDetail;
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of PlanDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanDetailStateCopyWith<PlanDetailState> get copyWith =>
      _$PlanDetailStateCopyWithImpl<PlanDetailState>(
          this as PlanDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlanDetailState &&
            (identical(other.planDetail, planDetail) ||
                other.planDetail == planDetail) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, planDetail, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanDetailState(planDetail: $planDetail, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PlanDetailStateCopyWith<$Res> {
  factory $PlanDetailStateCopyWith(
          PlanDetailState value, $Res Function(PlanDetailState) _then) =
      _$PlanDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {PlanDetailModel? planDetail,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class _$PlanDetailStateCopyWithImpl<$Res>
    implements $PlanDetailStateCopyWith<$Res> {
  _$PlanDetailStateCopyWithImpl(this._self, this._then);

  final PlanDetailState _self;
  final $Res Function(PlanDetailState) _then;

  /// Create a copy of PlanDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planDetail = freezed,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_self.copyWith(
      planDetail: freezed == planDetail
          ? _self.planDetail
          : planDetail // ignore: cast_nullable_to_non_nullable
              as PlanDetailModel?,
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

class _PlanDetailState implements PlanDetailState {
  const _PlanDetailState(
      {this.planDetail,
      this.loadingStatus = LoadingStatus.none,
      this.errorMessage = ''});

  @override
  final PlanDetailModel? planDetail;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of PlanDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanDetailStateCopyWith<_PlanDetailState> get copyWith =>
      __$PlanDetailStateCopyWithImpl<_PlanDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanDetailState &&
            (identical(other.planDetail, planDetail) ||
                other.planDetail == planDetail) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, planDetail, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanDetailState(planDetail: $planDetail, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PlanDetailStateCopyWith<$Res>
    implements $PlanDetailStateCopyWith<$Res> {
  factory _$PlanDetailStateCopyWith(
          _PlanDetailState value, $Res Function(_PlanDetailState) _then) =
      __$PlanDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PlanDetailModel? planDetail,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class __$PlanDetailStateCopyWithImpl<$Res>
    implements _$PlanDetailStateCopyWith<$Res> {
  __$PlanDetailStateCopyWithImpl(this._self, this._then);

  final _PlanDetailState _self;
  final $Res Function(_PlanDetailState) _then;

  /// Create a copy of PlanDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? planDetail = freezed,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_PlanDetailState(
      planDetail: freezed == planDetail
          ? _self.planDetail
          : planDetail // ignore: cast_nullable_to_non_nullable
              as PlanDetailModel?,
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

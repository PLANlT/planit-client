// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guilty_free_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuiltyFreeHistoryState {
  GuiltyFreeReasonListModel get reasonList;
  String get advice;
  LoadingStatus get loadingStatus;

  /// Create a copy of GuiltyFreeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GuiltyFreeHistoryStateCopyWith<GuiltyFreeHistoryState> get copyWith =>
      _$GuiltyFreeHistoryStateCopyWithImpl<GuiltyFreeHistoryState>(
          this as GuiltyFreeHistoryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GuiltyFreeHistoryState &&
            (identical(other.reasonList, reasonList) ||
                other.reasonList == reasonList) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reasonList, advice, loadingStatus);

  @override
  String toString() {
    return 'GuiltyFreeHistoryState(reasonList: $reasonList, advice: $advice, loadingStatus: $loadingStatus)';
  }
}

/// @nodoc
abstract mixin class $GuiltyFreeHistoryStateCopyWith<$Res> {
  factory $GuiltyFreeHistoryStateCopyWith(GuiltyFreeHistoryState value,
          $Res Function(GuiltyFreeHistoryState) _then) =
      _$GuiltyFreeHistoryStateCopyWithImpl;
  @useResult
  $Res call(
      {GuiltyFreeReasonListModel reasonList,
      String advice,
      LoadingStatus loadingStatus});
}

/// @nodoc
class _$GuiltyFreeHistoryStateCopyWithImpl<$Res>
    implements $GuiltyFreeHistoryStateCopyWith<$Res> {
  _$GuiltyFreeHistoryStateCopyWithImpl(this._self, this._then);

  final GuiltyFreeHistoryState _self;
  final $Res Function(GuiltyFreeHistoryState) _then;

  /// Create a copy of GuiltyFreeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonList = null,
    Object? advice = null,
    Object? loadingStatus = null,
  }) {
    return _then(_self.copyWith(
      reasonList: null == reasonList
          ? _self.reasonList
          : reasonList // ignore: cast_nullable_to_non_nullable
              as GuiltyFreeReasonListModel,
      advice: null == advice
          ? _self.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _GuiltyFreeHistoryState implements GuiltyFreeHistoryState {
  _GuiltyFreeHistoryState(
      {this.reasonList = const GuiltyFreeReasonListModel(reasons: []),
      this.advice = '',
      this.loadingStatus = LoadingStatus.none});

  @override
  @JsonKey()
  final GuiltyFreeReasonListModel reasonList;
  @override
  @JsonKey()
  final String advice;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;

  /// Create a copy of GuiltyFreeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GuiltyFreeHistoryStateCopyWith<_GuiltyFreeHistoryState> get copyWith =>
      __$GuiltyFreeHistoryStateCopyWithImpl<_GuiltyFreeHistoryState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GuiltyFreeHistoryState &&
            (identical(other.reasonList, reasonList) ||
                other.reasonList == reasonList) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reasonList, advice, loadingStatus);

  @override
  String toString() {
    return 'GuiltyFreeHistoryState(reasonList: $reasonList, advice: $advice, loadingStatus: $loadingStatus)';
  }
}

/// @nodoc
abstract mixin class _$GuiltyFreeHistoryStateCopyWith<$Res>
    implements $GuiltyFreeHistoryStateCopyWith<$Res> {
  factory _$GuiltyFreeHistoryStateCopyWith(_GuiltyFreeHistoryState value,
          $Res Function(_GuiltyFreeHistoryState) _then) =
      __$GuiltyFreeHistoryStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GuiltyFreeReasonListModel reasonList,
      String advice,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$GuiltyFreeHistoryStateCopyWithImpl<$Res>
    implements _$GuiltyFreeHistoryStateCopyWith<$Res> {
  __$GuiltyFreeHistoryStateCopyWithImpl(this._self, this._then);

  final _GuiltyFreeHistoryState _self;
  final $Res Function(_GuiltyFreeHistoryState) _then;

  /// Create a copy of GuiltyFreeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reasonList = null,
    Object? advice = null,
    Object? loadingStatus = null,
  }) {
    return _then(_GuiltyFreeHistoryState(
      reasonList: null == reasonList
          ? _self.reasonList
          : reasonList // ignore: cast_nullable_to_non_nullable
              as GuiltyFreeReasonListModel,
      advice: null == advice
          ? _self.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

// dart format on

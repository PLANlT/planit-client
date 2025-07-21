// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_more_bottom_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskMoreBottomSheetState {
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of TaskMoreBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskMoreBottomSheetStateCopyWith<TaskMoreBottomSheetState> get copyWith =>
      _$TaskMoreBottomSheetStateCopyWithImpl<TaskMoreBottomSheetState>(
          this as TaskMoreBottomSheetState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskMoreBottomSheetState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'TaskMoreBottomSheetState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $TaskMoreBottomSheetStateCopyWith<$Res> {
  factory $TaskMoreBottomSheetStateCopyWith(TaskMoreBottomSheetState value,
          $Res Function(TaskMoreBottomSheetState) _then) =
      _$TaskMoreBottomSheetStateCopyWithImpl;
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class _$TaskMoreBottomSheetStateCopyWithImpl<$Res>
    implements $TaskMoreBottomSheetStateCopyWith<$Res> {
  _$TaskMoreBottomSheetStateCopyWithImpl(this._self, this._then);

  final TaskMoreBottomSheetState _self;
  final $Res Function(TaskMoreBottomSheetState) _then;

  /// Create a copy of TaskMoreBottomSheetState
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

class _TaskMoreBottomSheetState implements TaskMoreBottomSheetState {
  const _TaskMoreBottomSheetState(
      {this.loadingStatus = LoadingStatus.none, this.errorMessage = ''});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of TaskMoreBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskMoreBottomSheetStateCopyWith<_TaskMoreBottomSheetState> get copyWith =>
      __$TaskMoreBottomSheetStateCopyWithImpl<_TaskMoreBottomSheetState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskMoreBottomSheetState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'TaskMoreBottomSheetState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$TaskMoreBottomSheetStateCopyWith<$Res>
    implements $TaskMoreBottomSheetStateCopyWith<$Res> {
  factory _$TaskMoreBottomSheetStateCopyWith(_TaskMoreBottomSheetState value,
          $Res Function(_TaskMoreBottomSheetState) _then) =
      __$TaskMoreBottomSheetStateCopyWithImpl;
  @override
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class __$TaskMoreBottomSheetStateCopyWithImpl<$Res>
    implements _$TaskMoreBottomSheetStateCopyWith<$Res> {
  __$TaskMoreBottomSheetStateCopyWithImpl(this._self, this._then);

  final _TaskMoreBottomSheetState _self;
  final $Res Function(_TaskMoreBottomSheetState) _then;

  /// Create a copy of TaskMoreBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_TaskMoreBottomSheetState(
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

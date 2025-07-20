// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_edit_bottom_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEditBottomSheetState {
  List<String> get routinDayList;
  List<String> get timeList;
  bool get timeSetting;
  List<String> get taskType;
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of TaskEditBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskEditBottomSheetStateCopyWith<TaskEditBottomSheetState> get copyWith =>
      _$TaskEditBottomSheetStateCopyWithImpl<TaskEditBottomSheetState>(
          this as TaskEditBottomSheetState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskEditBottomSheetState &&
            const DeepCollectionEquality()
                .equals(other.routinDayList, routinDayList) &&
            const DeepCollectionEquality().equals(other.timeList, timeList) &&
            (identical(other.timeSetting, timeSetting) ||
                other.timeSetting == timeSetting) &&
            const DeepCollectionEquality().equals(other.taskType, taskType) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(routinDayList),
      const DeepCollectionEquality().hash(timeList),
      timeSetting,
      const DeepCollectionEquality().hash(taskType),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'TaskEditBottomSheetState(routinDayList: $routinDayList, timeList: $timeList, timeSetting: $timeSetting, taskType: $taskType, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $TaskEditBottomSheetStateCopyWith<$Res> {
  factory $TaskEditBottomSheetStateCopyWith(TaskEditBottomSheetState value,
          $Res Function(TaskEditBottomSheetState) _then) =
      _$TaskEditBottomSheetStateCopyWithImpl;
  @useResult
  $Res call(
      {List<String> routinDayList,
      List<String> timeList,
      bool timeSetting,
      List<String> taskType,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class _$TaskEditBottomSheetStateCopyWithImpl<$Res>
    implements $TaskEditBottomSheetStateCopyWith<$Res> {
  _$TaskEditBottomSheetStateCopyWithImpl(this._self, this._then);

  final TaskEditBottomSheetState _self;
  final $Res Function(TaskEditBottomSheetState) _then;

  /// Create a copy of TaskEditBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routinDayList = null,
    Object? timeList = null,
    Object? timeSetting = null,
    Object? taskType = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_self.copyWith(
      routinDayList: null == routinDayList
          ? _self.routinDayList
          : routinDayList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeList: null == timeList
          ? _self.timeList
          : timeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeSetting: null == timeSetting
          ? _self.timeSetting
          : timeSetting // ignore: cast_nullable_to_non_nullable
              as bool,
      taskType: null == taskType
          ? _self.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

class _TaskEditBottomSheetState implements TaskEditBottomSheetState {
  const _TaskEditBottomSheetState(
      {final List<String> routinDayList = const [],
      final List<String> timeList = const [],
      this.timeSetting = false,
      final List<String> taskType = const [],
      this.loadingStatus = LoadingStatus.none,
      this.errorMessage = ''})
      : _routinDayList = routinDayList,
        _timeList = timeList,
        _taskType = taskType;

  final List<String> _routinDayList;
  @override
  @JsonKey()
  List<String> get routinDayList {
    if (_routinDayList is EqualUnmodifiableListView) return _routinDayList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routinDayList);
  }

  final List<String> _timeList;
  @override
  @JsonKey()
  List<String> get timeList {
    if (_timeList is EqualUnmodifiableListView) return _timeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeList);
  }

  @override
  @JsonKey()
  final bool timeSetting;
  final List<String> _taskType;
  @override
  @JsonKey()
  List<String> get taskType {
    if (_taskType is EqualUnmodifiableListView) return _taskType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskType);
  }

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of TaskEditBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskEditBottomSheetStateCopyWith<_TaskEditBottomSheetState> get copyWith =>
      __$TaskEditBottomSheetStateCopyWithImpl<_TaskEditBottomSheetState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskEditBottomSheetState &&
            const DeepCollectionEquality()
                .equals(other._routinDayList, _routinDayList) &&
            const DeepCollectionEquality().equals(other._timeList, _timeList) &&
            (identical(other.timeSetting, timeSetting) ||
                other.timeSetting == timeSetting) &&
            const DeepCollectionEquality().equals(other._taskType, _taskType) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_routinDayList),
      const DeepCollectionEquality().hash(_timeList),
      timeSetting,
      const DeepCollectionEquality().hash(_taskType),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'TaskEditBottomSheetState(routinDayList: $routinDayList, timeList: $timeList, timeSetting: $timeSetting, taskType: $taskType, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$TaskEditBottomSheetStateCopyWith<$Res>
    implements $TaskEditBottomSheetStateCopyWith<$Res> {
  factory _$TaskEditBottomSheetStateCopyWith(_TaskEditBottomSheetState value,
          $Res Function(_TaskEditBottomSheetState) _then) =
      __$TaskEditBottomSheetStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> routinDayList,
      List<String> timeList,
      bool timeSetting,
      List<String> taskType,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class __$TaskEditBottomSheetStateCopyWithImpl<$Res>
    implements _$TaskEditBottomSheetStateCopyWith<$Res> {
  __$TaskEditBottomSheetStateCopyWithImpl(this._self, this._then);

  final _TaskEditBottomSheetState _self;
  final $Res Function(_TaskEditBottomSheetState) _then;

  /// Create a copy of TaskEditBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? routinDayList = null,
    Object? timeList = null,
    Object? timeSetting = null,
    Object? taskType = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_TaskEditBottomSheetState(
      routinDayList: null == routinDayList
          ? _self._routinDayList
          : routinDayList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeList: null == timeList
          ? _self._timeList
          : timeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeSetting: null == timeSetting
          ? _self.timeSetting
          : timeSetting // ignore: cast_nullable_to_non_nullable
              as bool,
      taskType: null == taskType
          ? _self._taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  String get time;
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
            (identical(other.time, time) || other.time == time) &&
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
      time,
      timeSetting,
      const DeepCollectionEquality().hash(taskType),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'TaskEditBottomSheetState(routinDayList: $routinDayList, time: $time, timeSetting: $timeSetting, taskType: $taskType, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
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
      String time,
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
    Object? time = null,
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
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
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

/// Adds pattern-matching-related methods to [TaskEditBottomSheetState].
extension TaskEditBottomSheetStatePatterns on TaskEditBottomSheetState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskEditBottomSheetState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskEditBottomSheetState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskEditBottomSheetState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskEditBottomSheetState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TaskEditBottomSheetState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskEditBottomSheetState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<String> routinDayList,
            String time,
            bool timeSetting,
            List<String> taskType,
            LoadingStatus loadingStatus,
            String errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskEditBottomSheetState() when $default != null:
        return $default(_that.routinDayList, _that.time, _that.timeSetting,
            _that.taskType, _that.loadingStatus, _that.errorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<String> routinDayList,
            String time,
            bool timeSetting,
            List<String> taskType,
            LoadingStatus loadingStatus,
            String errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskEditBottomSheetState():
        return $default(_that.routinDayList, _that.time, _that.timeSetting,
            _that.taskType, _that.loadingStatus, _that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<String> routinDayList,
            String time,
            bool timeSetting,
            List<String> taskType,
            LoadingStatus loadingStatus,
            String errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskEditBottomSheetState() when $default != null:
        return $default(_that.routinDayList, _that.time, _that.timeSetting,
            _that.taskType, _that.loadingStatus, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaskEditBottomSheetState implements TaskEditBottomSheetState {
  const _TaskEditBottomSheetState(
      {final List<String> routinDayList = const [],
      this.time = '',
      this.timeSetting = false,
      final List<String> taskType = const [],
      this.loadingStatus = LoadingStatus.none,
      this.errorMessage = ''})
      : _routinDayList = routinDayList,
        _taskType = taskType;

  final List<String> _routinDayList;
  @override
  @JsonKey()
  List<String> get routinDayList {
    if (_routinDayList is EqualUnmodifiableListView) return _routinDayList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routinDayList);
  }

  @override
  @JsonKey()
  final String time;
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
            (identical(other.time, time) || other.time == time) &&
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
      time,
      timeSetting,
      const DeepCollectionEquality().hash(_taskType),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'TaskEditBottomSheetState(routinDayList: $routinDayList, time: $time, timeSetting: $timeSetting, taskType: $taskType, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
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
      String time,
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
    Object? time = null,
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
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
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

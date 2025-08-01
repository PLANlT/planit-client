// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainState {
  RouteType get routeType;
  TodayPlanListModel get plans;
  TaskStatus get taskStatus;
  LoadingStatus get loadingStatus;
  bool get showRecoveryRoutineBanner;
  String get errorMessage;
  String get completeMessage;
  bool? get canUseGuiltyFree;
  int get consecutiveDay;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainStateCopyWith<MainState> get copyWith =>
      _$MainStateCopyWithImpl<MainState>(this as MainState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainState &&
            (identical(other.routeType, routeType) ||
                other.routeType == routeType) &&
            (identical(other.plans, plans) || other.plans == plans) &&
            (identical(other.taskStatus, taskStatus) ||
                other.taskStatus == taskStatus) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.showRecoveryRoutineBanner,
                    showRecoveryRoutineBanner) ||
                other.showRecoveryRoutineBanner == showRecoveryRoutineBanner) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.completeMessage, completeMessage) ||
                other.completeMessage == completeMessage) &&
            (identical(other.canUseGuiltyFree, canUseGuiltyFree) ||
                other.canUseGuiltyFree == canUseGuiltyFree) &&
            (identical(other.consecutiveDay, consecutiveDay) ||
                other.consecutiveDay == consecutiveDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      routeType,
      plans,
      taskStatus,
      loadingStatus,
      showRecoveryRoutineBanner,
      errorMessage,
      completeMessage,
      canUseGuiltyFree,
      consecutiveDay);

  @override
  String toString() {
    return 'MainState(routeType: $routeType, plans: $plans, taskStatus: $taskStatus, loadingStatus: $loadingStatus, showRecoveryRoutineBanner: $showRecoveryRoutineBanner, errorMessage: $errorMessage, completeMessage: $completeMessage, canUseGuiltyFree: $canUseGuiltyFree, consecutiveDay: $consecutiveDay)';
  }
}

/// @nodoc
abstract mixin class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) _then) =
      _$MainStateCopyWithImpl;
  @useResult
  $Res call(
      {RouteType routeType,
      TodayPlanListModel plans,
      TaskStatus taskStatus,
      LoadingStatus loadingStatus,
      bool showRecoveryRoutineBanner,
      String errorMessage,
      String completeMessage,
      bool? canUseGuiltyFree,
      int consecutiveDay});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res> implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._self, this._then);

  final MainState _self;
  final $Res Function(MainState) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeType = null,
    Object? plans = null,
    Object? taskStatus = null,
    Object? loadingStatus = null,
    Object? showRecoveryRoutineBanner = null,
    Object? errorMessage = null,
    Object? completeMessage = null,
    Object? canUseGuiltyFree = freezed,
    Object? consecutiveDay = null,
  }) {
    return _then(_self.copyWith(
      routeType: null == routeType
          ? _self.routeType
          : routeType // ignore: cast_nullable_to_non_nullable
              as RouteType,
      plans: null == plans
          ? _self.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as TodayPlanListModel,
      taskStatus: null == taskStatus
          ? _self.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      showRecoveryRoutineBanner: null == showRecoveryRoutineBanner
          ? _self.showRecoveryRoutineBanner
          : showRecoveryRoutineBanner // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      completeMessage: null == completeMessage
          ? _self.completeMessage
          : completeMessage // ignore: cast_nullable_to_non_nullable
              as String,
      canUseGuiltyFree: freezed == canUseGuiltyFree
          ? _self.canUseGuiltyFree
          : canUseGuiltyFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      consecutiveDay: null == consecutiveDay
          ? _self.consecutiveDay
          : consecutiveDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _MainState implements MainState {
  _MainState(
      {this.routeType = RouteType.slow,
      this.plans = const TodayPlanListModel(slowPlans: [], passionatePlans: []),
      this.taskStatus = TaskStatus.none,
      this.loadingStatus = LoadingStatus.none,
      this.showRecoveryRoutineBanner = true,
      this.errorMessage = '',
      this.completeMessage = '',
      this.canUseGuiltyFree = null,
      this.consecutiveDay = 0});

  @override
  @JsonKey()
  final RouteType routeType;
  @override
  @JsonKey()
  final TodayPlanListModel plans;
  @override
  @JsonKey()
  final TaskStatus taskStatus;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final bool showRecoveryRoutineBanner;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String completeMessage;
  @override
  @JsonKey()
  final bool? canUseGuiltyFree;
  @override
  @JsonKey()
  final int consecutiveDay;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MainStateCopyWith<_MainState> get copyWith =>
      __$MainStateCopyWithImpl<_MainState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainState &&
            (identical(other.routeType, routeType) ||
                other.routeType == routeType) &&
            (identical(other.plans, plans) || other.plans == plans) &&
            (identical(other.taskStatus, taskStatus) ||
                other.taskStatus == taskStatus) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.showRecoveryRoutineBanner,
                    showRecoveryRoutineBanner) ||
                other.showRecoveryRoutineBanner == showRecoveryRoutineBanner) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.completeMessage, completeMessage) ||
                other.completeMessage == completeMessage) &&
            (identical(other.canUseGuiltyFree, canUseGuiltyFree) ||
                other.canUseGuiltyFree == canUseGuiltyFree) &&
            (identical(other.consecutiveDay, consecutiveDay) ||
                other.consecutiveDay == consecutiveDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      routeType,
      plans,
      taskStatus,
      loadingStatus,
      showRecoveryRoutineBanner,
      errorMessage,
      completeMessage,
      canUseGuiltyFree,
      consecutiveDay);

  @override
  String toString() {
    return 'MainState(routeType: $routeType, plans: $plans, taskStatus: $taskStatus, loadingStatus: $loadingStatus, showRecoveryRoutineBanner: $showRecoveryRoutineBanner, errorMessage: $errorMessage, completeMessage: $completeMessage, canUseGuiltyFree: $canUseGuiltyFree, consecutiveDay: $consecutiveDay)';
  }
}

/// @nodoc
abstract mixin class _$MainStateCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$MainStateCopyWith(
          _MainState value, $Res Function(_MainState) _then) =
      __$MainStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RouteType routeType,
      TodayPlanListModel plans,
      TaskStatus taskStatus,
      LoadingStatus loadingStatus,
      bool showRecoveryRoutineBanner,
      String errorMessage,
      String completeMessage,
      bool? canUseGuiltyFree,
      int consecutiveDay});
}

/// @nodoc
class __$MainStateCopyWithImpl<$Res> implements _$MainStateCopyWith<$Res> {
  __$MainStateCopyWithImpl(this._self, this._then);

  final _MainState _self;
  final $Res Function(_MainState) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? routeType = null,
    Object? plans = null,
    Object? taskStatus = null,
    Object? loadingStatus = null,
    Object? showRecoveryRoutineBanner = null,
    Object? errorMessage = null,
    Object? completeMessage = null,
    Object? canUseGuiltyFree = freezed,
    Object? consecutiveDay = null,
  }) {
    return _then(_MainState(
      routeType: null == routeType
          ? _self.routeType
          : routeType // ignore: cast_nullable_to_non_nullable
              as RouteType,
      plans: null == plans
          ? _self.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as TodayPlanListModel,
      taskStatus: null == taskStatus
          ? _self.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      loadingStatus: null == loadingStatus
          ? _self.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      showRecoveryRoutineBanner: null == showRecoveryRoutineBanner
          ? _self.showRecoveryRoutineBanner
          : showRecoveryRoutineBanner // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      completeMessage: null == completeMessage
          ? _self.completeMessage
          : completeMessage // ignore: cast_nullable_to_non_nullable
              as String,
      canUseGuiltyFree: freezed == canUseGuiltyFree
          ? _self.canUseGuiltyFree
          : canUseGuiltyFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      consecutiveDay: null == consecutiveDay
          ? _self.consecutiveDay
          : consecutiveDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

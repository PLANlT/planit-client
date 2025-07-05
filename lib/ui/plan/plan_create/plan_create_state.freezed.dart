// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanCreateState {
  String get title;
  String get motivation;
  String get icon;
  String get dDay;
  String get planStatus;
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of PlanCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanCreateStateCopyWith<PlanCreateState> get copyWith =>
      _$PlanCreateStateCopyWithImpl<PlanCreateState>(
          this as PlanCreateState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlanCreateState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.motivation, motivation) ||
                other.motivation == motivation) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.dDay, dDay) || other.dDay == dDay) &&
            (identical(other.planStatus, planStatus) ||
                other.planStatus == planStatus) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, motivation, icon, dDay,
      planStatus, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanCreateState(title: $title, motivation: $motivation, icon: $icon, dDay: $dDay, planStatus: $planStatus, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PlanCreateStateCopyWith<$Res> {
  factory $PlanCreateStateCopyWith(
          PlanCreateState value, $Res Function(PlanCreateState) _then) =
      _$PlanCreateStateCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String motivation,
      String icon,
      String dDay,
      String planStatus,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class _$PlanCreateStateCopyWithImpl<$Res>
    implements $PlanCreateStateCopyWith<$Res> {
  _$PlanCreateStateCopyWithImpl(this._self, this._then);

  final PlanCreateState _self;
  final $Res Function(PlanCreateState) _then;

  /// Create a copy of PlanCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? motivation = null,
    Object? icon = null,
    Object? dDay = null,
    Object? planStatus = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      motivation: null == motivation
          ? _self.motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      dDay: null == dDay
          ? _self.dDay
          : dDay // ignore: cast_nullable_to_non_nullable
              as String,
      planStatus: null == planStatus
          ? _self.planStatus
          : planStatus // ignore: cast_nullable_to_non_nullable
              as String,
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

class _PlanCreateState implements PlanCreateState {
  const _PlanCreateState(
      {this.title = '',
      this.motivation = '',
      this.icon = '',
      this.dDay = '',
      this.planStatus = '',
      this.loadingStatus = LoadingStatus.none,
      this.errorMessage = ''});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String motivation;
  @override
  @JsonKey()
  final String icon;
  @override
  @JsonKey()
  final String dDay;
  @override
  @JsonKey()
  final String planStatus;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of PlanCreateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanCreateStateCopyWith<_PlanCreateState> get copyWith =>
      __$PlanCreateStateCopyWithImpl<_PlanCreateState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanCreateState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.motivation, motivation) ||
                other.motivation == motivation) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.dDay, dDay) || other.dDay == dDay) &&
            (identical(other.planStatus, planStatus) ||
                other.planStatus == planStatus) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, motivation, icon, dDay,
      planStatus, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanCreateState(title: $title, motivation: $motivation, icon: $icon, dDay: $dDay, planStatus: $planStatus, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PlanCreateStateCopyWith<$Res>
    implements $PlanCreateStateCopyWith<$Res> {
  factory _$PlanCreateStateCopyWith(
          _PlanCreateState value, $Res Function(_PlanCreateState) _then) =
      __$PlanCreateStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String motivation,
      String icon,
      String dDay,
      String planStatus,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class __$PlanCreateStateCopyWithImpl<$Res>
    implements _$PlanCreateStateCopyWith<$Res> {
  __$PlanCreateStateCopyWithImpl(this._self, this._then);

  final _PlanCreateState _self;
  final $Res Function(_PlanCreateState) _then;

  /// Create a copy of PlanCreateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? motivation = null,
    Object? icon = null,
    Object? dDay = null,
    Object? planStatus = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_PlanCreateState(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      motivation: null == motivation
          ? _self.motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      dDay: null == dDay
          ? _self.dDay
          : dDay // ignore: cast_nullable_to_non_nullable
              as String,
      planStatus: null == planStatus
          ? _self.planStatus
          : planStatus // ignore: cast_nullable_to_non_nullable
              as String,
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

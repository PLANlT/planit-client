// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanState {
  List<PlanOverviewModel> get activePlans;
  List<PlanOverviewModel> get pausePlans;
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of PlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanStateCopyWith<PlanState> get copyWith =>
      _$PlanStateCopyWithImpl<PlanState>(this as PlanState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlanState &&
            const DeepCollectionEquality()
                .equals(other.activePlans, activePlans) &&
            const DeepCollectionEquality()
                .equals(other.pausePlans, pausePlans) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activePlans),
      const DeepCollectionEquality().hash(pausePlans),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'PlanState(activePlans: $activePlans, pausePlans: $pausePlans, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PlanStateCopyWith<$Res> {
  factory $PlanStateCopyWith(PlanState value, $Res Function(PlanState) _then) =
      _$PlanStateCopyWithImpl;
  @useResult
  $Res call(
      {List<PlanOverviewModel> activePlans,
      List<PlanOverviewModel> pausePlans,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class _$PlanStateCopyWithImpl<$Res> implements $PlanStateCopyWith<$Res> {
  _$PlanStateCopyWithImpl(this._self, this._then);

  final PlanState _self;
  final $Res Function(PlanState) _then;

  /// Create a copy of PlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePlans = null,
    Object? pausePlans = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_self.copyWith(
      activePlans: null == activePlans
          ? _self.activePlans
          : activePlans // ignore: cast_nullable_to_non_nullable
              as List<PlanOverviewModel>,
      pausePlans: null == pausePlans
          ? _self.pausePlans
          : pausePlans // ignore: cast_nullable_to_non_nullable
              as List<PlanOverviewModel>,
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

class _PlanState implements PlanState {
  const _PlanState(
      {final List<PlanOverviewModel> activePlans = const [],
      final List<PlanOverviewModel> pausePlans = const [],
      this.loadingStatus = LoadingStatus.none,
      this.errorMessage = ''})
      : _activePlans = activePlans,
        _pausePlans = pausePlans;

  final List<PlanOverviewModel> _activePlans;
  @override
  @JsonKey()
  List<PlanOverviewModel> get activePlans {
    if (_activePlans is EqualUnmodifiableListView) return _activePlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePlans);
  }

  final List<PlanOverviewModel> _pausePlans;
  @override
  @JsonKey()
  List<PlanOverviewModel> get pausePlans {
    if (_pausePlans is EqualUnmodifiableListView) return _pausePlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pausePlans);
  }

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of PlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanStateCopyWith<_PlanState> get copyWith =>
      __$PlanStateCopyWithImpl<_PlanState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanState &&
            const DeepCollectionEquality()
                .equals(other._activePlans, _activePlans) &&
            const DeepCollectionEquality()
                .equals(other._pausePlans, _pausePlans) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activePlans),
      const DeepCollectionEquality().hash(_pausePlans),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'PlanState(activePlans: $activePlans, pausePlans: $pausePlans, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PlanStateCopyWith<$Res>
    implements $PlanStateCopyWith<$Res> {
  factory _$PlanStateCopyWith(
          _PlanState value, $Res Function(_PlanState) _then) =
      __$PlanStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PlanOverviewModel> activePlans,
      List<PlanOverviewModel> pausePlans,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class __$PlanStateCopyWithImpl<$Res> implements _$PlanStateCopyWith<$Res> {
  __$PlanStateCopyWithImpl(this._self, this._then);

  final _PlanState _self;
  final $Res Function(_PlanState) _then;

  /// Create a copy of PlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activePlans = null,
    Object? pausePlans = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_PlanState(
      activePlans: null == activePlans
          ? _self._activePlans
          : activePlans // ignore: cast_nullable_to_non_nullable
              as List<PlanOverviewModel>,
      pausePlans: null == pausePlans
          ? _self._pausePlans
          : pausePlans // ignore: cast_nullable_to_non_nullable
              as List<PlanOverviewModel>,
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

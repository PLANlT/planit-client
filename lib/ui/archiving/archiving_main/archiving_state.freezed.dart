// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archiving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArchivingState {
  List<ArchivingPlanModel> get archivingPlans;
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of ArchivingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ArchivingStateCopyWith<ArchivingState> get copyWith =>
      _$ArchivingStateCopyWithImpl<ArchivingState>(
          this as ArchivingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ArchivingState &&
            const DeepCollectionEquality()
                .equals(other.archivingPlans, archivingPlans) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(archivingPlans),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'ArchivingState(archivingPlans: $archivingPlans, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ArchivingStateCopyWith<$Res> {
  factory $ArchivingStateCopyWith(
          ArchivingState value, $Res Function(ArchivingState) _then) =
      _$ArchivingStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ArchivingPlanModel> archivingPlans,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class _$ArchivingStateCopyWithImpl<$Res>
    implements $ArchivingStateCopyWith<$Res> {
  _$ArchivingStateCopyWithImpl(this._self, this._then);

  final ArchivingState _self;
  final $Res Function(ArchivingState) _then;

  /// Create a copy of ArchivingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? archivingPlans = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_self.copyWith(
      archivingPlans: null == archivingPlans
          ? _self.archivingPlans
          : archivingPlans // ignore: cast_nullable_to_non_nullable
              as List<ArchivingPlanModel>,
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

/// Adds pattern-matching-related methods to [ArchivingState].
extension ArchivingStatePatterns on ArchivingState {
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
    TResult Function(_ArchivingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ArchivingState() when $default != null:
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
    TResult Function(_ArchivingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingState():
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
    TResult? Function(_ArchivingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingState() when $default != null:
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
    TResult Function(List<ArchivingPlanModel> archivingPlans,
            LoadingStatus loadingStatus, String errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ArchivingState() when $default != null:
        return $default(
            _that.archivingPlans, _that.loadingStatus, _that.errorMessage);
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
    TResult Function(List<ArchivingPlanModel> archivingPlans,
            LoadingStatus loadingStatus, String errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingState():
        return $default(
            _that.archivingPlans, _that.loadingStatus, _that.errorMessage);
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
    TResult? Function(List<ArchivingPlanModel> archivingPlans,
            LoadingStatus loadingStatus, String errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingState() when $default != null:
        return $default(
            _that.archivingPlans, _that.loadingStatus, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ArchivingState implements ArchivingState {
  const _ArchivingState(
      {final List<ArchivingPlanModel> archivingPlans = const [],
      this.loadingStatus = LoadingStatus.none,
      this.errorMessage = ''})
      : _archivingPlans = archivingPlans;

  final List<ArchivingPlanModel> _archivingPlans;
  @override
  @JsonKey()
  List<ArchivingPlanModel> get archivingPlans {
    if (_archivingPlans is EqualUnmodifiableListView) return _archivingPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archivingPlans);
  }

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of ArchivingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ArchivingStateCopyWith<_ArchivingState> get copyWith =>
      __$ArchivingStateCopyWithImpl<_ArchivingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArchivingState &&
            const DeepCollectionEquality()
                .equals(other._archivingPlans, _archivingPlans) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_archivingPlans),
      loadingStatus,
      errorMessage);

  @override
  String toString() {
    return 'ArchivingState(archivingPlans: $archivingPlans, loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ArchivingStateCopyWith<$Res>
    implements $ArchivingStateCopyWith<$Res> {
  factory _$ArchivingStateCopyWith(
          _ArchivingState value, $Res Function(_ArchivingState) _then) =
      __$ArchivingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ArchivingPlanModel> archivingPlans,
      LoadingStatus loadingStatus,
      String errorMessage});
}

/// @nodoc
class __$ArchivingStateCopyWithImpl<$Res>
    implements _$ArchivingStateCopyWith<$Res> {
  __$ArchivingStateCopyWithImpl(this._self, this._then);

  final _ArchivingState _self;
  final $Res Function(_ArchivingState) _then;

  /// Create a copy of ArchivingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? archivingPlans = null,
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_ArchivingState(
      archivingPlans: null == archivingPlans
          ? _self._archivingPlans
          : archivingPlans // ignore: cast_nullable_to_non_nullable
              as List<ArchivingPlanModel>,
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

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archiving_restart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArchivingRestartState {
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of ArchivingRestartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ArchivingRestartStateCopyWith<ArchivingRestartState> get copyWith =>
      _$ArchivingRestartStateCopyWithImpl<ArchivingRestartState>(
          this as ArchivingRestartState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ArchivingRestartState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'ArchivingRestartState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ArchivingRestartStateCopyWith<$Res> {
  factory $ArchivingRestartStateCopyWith(ArchivingRestartState value,
          $Res Function(ArchivingRestartState) _then) =
      _$ArchivingRestartStateCopyWithImpl;
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class _$ArchivingRestartStateCopyWithImpl<$Res>
    implements $ArchivingRestartStateCopyWith<$Res> {
  _$ArchivingRestartStateCopyWithImpl(this._self, this._then);

  final ArchivingRestartState _self;
  final $Res Function(ArchivingRestartState) _then;

  /// Create a copy of ArchivingRestartState
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

/// Adds pattern-matching-related methods to [ArchivingRestartState].
extension ArchivingRestartStatePatterns on ArchivingRestartState {
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
    TResult Function(_ArchivingRestartState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ArchivingRestartState() when $default != null:
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
    TResult Function(_ArchivingRestartState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingRestartState():
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
    TResult? Function(_ArchivingRestartState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingRestartState() when $default != null:
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
    TResult Function(LoadingStatus loadingStatus, String errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ArchivingRestartState() when $default != null:
        return $default(_that.loadingStatus, _that.errorMessage);
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
    TResult Function(LoadingStatus loadingStatus, String errorMessage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingRestartState():
        return $default(_that.loadingStatus, _that.errorMessage);
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
    TResult? Function(LoadingStatus loadingStatus, String errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchivingRestartState() when $default != null:
        return $default(_that.loadingStatus, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ArchivingRestartState implements ArchivingRestartState {
  const _ArchivingRestartState(
      {this.loadingStatus = LoadingStatus.none, this.errorMessage = ''});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of ArchivingRestartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ArchivingRestartStateCopyWith<_ArchivingRestartState> get copyWith =>
      __$ArchivingRestartStateCopyWithImpl<_ArchivingRestartState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArchivingRestartState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'ArchivingRestartState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ArchivingRestartStateCopyWith<$Res>
    implements $ArchivingRestartStateCopyWith<$Res> {
  factory _$ArchivingRestartStateCopyWith(_ArchivingRestartState value,
          $Res Function(_ArchivingRestartState) _then) =
      __$ArchivingRestartStateCopyWithImpl;
  @override
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class __$ArchivingRestartStateCopyWithImpl<$Res>
    implements _$ArchivingRestartStateCopyWith<$Res> {
  __$ArchivingRestartStateCopyWithImpl(this._self, this._then);

  final _ArchivingRestartState _self;
  final $Res Function(_ArchivingRestartState) _then;

  /// Create a copy of ArchivingRestartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_ArchivingRestartState(
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

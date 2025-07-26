// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_more_bottom_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanMoreBottomSheetState {
  LoadingStatus get loadingStatus;
  String get errorMessage;

  /// Create a copy of PlanMoreBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanMoreBottomSheetStateCopyWith<PlanMoreBottomSheetState> get copyWith =>
      _$PlanMoreBottomSheetStateCopyWithImpl<PlanMoreBottomSheetState>(
          this as PlanMoreBottomSheetState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlanMoreBottomSheetState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanMoreBottomSheetState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PlanMoreBottomSheetStateCopyWith<$Res> {
  factory $PlanMoreBottomSheetStateCopyWith(PlanMoreBottomSheetState value,
          $Res Function(PlanMoreBottomSheetState) _then) =
      _$PlanMoreBottomSheetStateCopyWithImpl;
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class _$PlanMoreBottomSheetStateCopyWithImpl<$Res>
    implements $PlanMoreBottomSheetStateCopyWith<$Res> {
  _$PlanMoreBottomSheetStateCopyWithImpl(this._self, this._then);

  final PlanMoreBottomSheetState _self;
  final $Res Function(PlanMoreBottomSheetState) _then;

  /// Create a copy of PlanMoreBottomSheetState
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

/// Adds pattern-matching-related methods to [PlanMoreBottomSheetState].
extension PlanMoreBottomSheetStatePatterns on PlanMoreBottomSheetState {
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
    TResult Function(_PlanMoreBottomSheetState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlanMoreBottomSheetState() when $default != null:
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
    TResult Function(_PlanMoreBottomSheetState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlanMoreBottomSheetState():
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
    TResult? Function(_PlanMoreBottomSheetState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlanMoreBottomSheetState() when $default != null:
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
      case _PlanMoreBottomSheetState() when $default != null:
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
      case _PlanMoreBottomSheetState():
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
      case _PlanMoreBottomSheetState() when $default != null:
        return $default(_that.loadingStatus, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlanMoreBottomSheetState implements PlanMoreBottomSheetState {
  const _PlanMoreBottomSheetState(
      {this.loadingStatus = LoadingStatus.none, this.errorMessage = ''});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of PlanMoreBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanMoreBottomSheetStateCopyWith<_PlanMoreBottomSheetState> get copyWith =>
      __$PlanMoreBottomSheetStateCopyWithImpl<_PlanMoreBottomSheetState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanMoreBottomSheetState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus, errorMessage);

  @override
  String toString() {
    return 'PlanMoreBottomSheetState(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PlanMoreBottomSheetStateCopyWith<$Res>
    implements $PlanMoreBottomSheetStateCopyWith<$Res> {
  factory _$PlanMoreBottomSheetStateCopyWith(_PlanMoreBottomSheetState value,
          $Res Function(_PlanMoreBottomSheetState) _then) =
      __$PlanMoreBottomSheetStateCopyWithImpl;
  @override
  @useResult
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class __$PlanMoreBottomSheetStateCopyWithImpl<$Res>
    implements _$PlanMoreBottomSheetStateCopyWith<$Res> {
  __$PlanMoreBottomSheetStateCopyWithImpl(this._self, this._then);

  final _PlanMoreBottomSheetState _self;
  final $Res Function(_PlanMoreBottomSheetState) _then;

  /// Create a copy of PlanMoreBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_PlanMoreBottomSheetState(
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

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {
  bool get isSignedIn;
  GuiltyFreeStatus get guiltyFreeStatus;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<AppState> get copyWith =>
      _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.guiltyFreeStatus, guiltyFreeStatus) ||
                other.guiltyFreeStatus == guiltyFreeStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn, guiltyFreeStatus);

  @override
  String toString() {
    return 'AppState(isSignedIn: $isSignedIn, guiltyFreeStatus: $guiltyFreeStatus)';
  }
}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) =
      _$AppStateCopyWithImpl;
  @useResult
  $Res call({bool isSignedIn, GuiltyFreeStatus guiltyFreeStatus});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignedIn = null,
    Object? guiltyFreeStatus = null,
  }) {
    return _then(_self.copyWith(
      isSignedIn: null == isSignedIn
          ? _self.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      guiltyFreeStatus: null == guiltyFreeStatus
          ? _self.guiltyFreeStatus
          : guiltyFreeStatus // ignore: cast_nullable_to_non_nullable
              as GuiltyFreeStatus,
    ));
  }
}

/// @nodoc

class _AppState implements AppState {
  const _AppState(
      {this.isSignedIn = false, this.guiltyFreeStatus = GuiltyFreeStatus.none});

  @override
  @JsonKey()
  final bool isSignedIn;
  @override
  @JsonKey()
  final GuiltyFreeStatus guiltyFreeStatus;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppState &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.guiltyFreeStatus, guiltyFreeStatus) ||
                other.guiltyFreeStatus == guiltyFreeStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn, guiltyFreeStatus);

  @override
  String toString() {
    return 'AppState(isSignedIn: $isSignedIn, guiltyFreeStatus: $guiltyFreeStatus)';
  }
}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) =
      __$AppStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isSignedIn, GuiltyFreeStatus guiltyFreeStatus});
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isSignedIn = null,
    Object? guiltyFreeStatus = null,
  }) {
    return _then(_AppState(
      isSignedIn: null == isSignedIn
          ? _self.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      guiltyFreeStatus: null == guiltyFreeStatus
          ? _self.guiltyFreeStatus
          : guiltyFreeStatus // ignore: cast_nullable_to_non_nullable
              as GuiltyFreeStatus,
    ));
  }
}

// dart format on

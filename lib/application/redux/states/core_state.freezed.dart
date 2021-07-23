// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'core_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoreState _$CoreStateFromJson(Map<String, dynamic> json) {
  return _CoreState.fromJson(json);
}

/// @nodoc
class _$CoreStateTearOff {
  const _$CoreStateTearOff();

  _CoreState call(
      {MiscState? miscState,
      UserFeedState? userFeedState,
      UserState? userState,
      ConnectivityState? connectivityState,
      ClinicalState? clinicalState,
      Navigation? navigationState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _CoreState(
      miscState: miscState,
      userFeedState: userFeedState,
      userState: userState,
      connectivityState: connectivityState,
      clinicalState: clinicalState,
      navigationState: navigationState,
      wait: wait,
    );
  }

  CoreState fromJson(Map<String, Object> json) {
    return CoreState.fromJson(json);
  }
}

/// @nodoc
const $CoreState = _$CoreStateTearOff();

/// @nodoc
mixin _$CoreState {
  MiscState? get miscState => throw _privateConstructorUsedError;
  UserFeedState? get userFeedState => throw _privateConstructorUsedError;
  UserState? get userState => throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  ClinicalState? get clinicalState => throw _privateConstructorUsedError;
  Navigation? get navigationState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoreStateCopyWith<CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<$Res> {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) then) =
      _$CoreStateCopyWithImpl<$Res>;
  $Res call(
      {MiscState? miscState,
      UserFeedState? userFeedState,
      UserState? userState,
      ConnectivityState? connectivityState,
      ClinicalState? clinicalState,
      Navigation? navigationState,
      @JsonKey(ignore: true) Wait? wait});

  $MiscStateCopyWith<$Res>? get miscState;
  $UserFeedStateCopyWith<$Res>? get userFeedState;
  $UserStateCopyWith<$Res>? get userState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  $ClinicalStateCopyWith<$Res>? get clinicalState;
  $NavigationCopyWith<$Res>? get navigationState;
}

/// @nodoc
class _$CoreStateCopyWithImpl<$Res> implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  final CoreState _value;
  // ignore: unused_field
  final $Res Function(CoreState) _then;

  @override
  $Res call({
    Object? miscState = freezed,
    Object? userFeedState = freezed,
    Object? userState = freezed,
    Object? connectivityState = freezed,
    Object? clinicalState = freezed,
    Object? navigationState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      userFeedState: userFeedState == freezed
          ? _value.userFeedState
          : userFeedState // ignore: cast_nullable_to_non_nullable
              as UserFeedState?,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      clinicalState: clinicalState == freezed
          ? _value.clinicalState
          : clinicalState // ignore: cast_nullable_to_non_nullable
              as ClinicalState?,
      navigationState: navigationState == freezed
          ? _value.navigationState
          : navigationState // ignore: cast_nullable_to_non_nullable
              as Navigation?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }

  @override
  $MiscStateCopyWith<$Res>? get miscState {
    if (_value.miscState == null) {
      return null;
    }

    return $MiscStateCopyWith<$Res>(_value.miscState!, (value) {
      return _then(_value.copyWith(miscState: value));
    });
  }

  @override
  $UserFeedStateCopyWith<$Res>? get userFeedState {
    if (_value.userFeedState == null) {
      return null;
    }

    return $UserFeedStateCopyWith<$Res>(_value.userFeedState!, (value) {
      return _then(_value.copyWith(userFeedState: value));
    });
  }

  @override
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value));
    });
  }

  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState {
    if (_value.connectivityState == null) {
      return null;
    }

    return $ConnectivityStateCopyWith<$Res>(_value.connectivityState!, (value) {
      return _then(_value.copyWith(connectivityState: value));
    });
  }

  @override
  $ClinicalStateCopyWith<$Res>? get clinicalState {
    if (_value.clinicalState == null) {
      return null;
    }

    return $ClinicalStateCopyWith<$Res>(_value.clinicalState!, (value) {
      return _then(_value.copyWith(clinicalState: value));
    });
  }

  @override
  $NavigationCopyWith<$Res>? get navigationState {
    if (_value.navigationState == null) {
      return null;
    }

    return $NavigationCopyWith<$Res>(_value.navigationState!, (value) {
      return _then(_value.copyWith(navigationState: value));
    });
  }
}

/// @nodoc
abstract class _$CoreStateCopyWith<$Res> implements $CoreStateCopyWith<$Res> {
  factory _$CoreStateCopyWith(
          _CoreState value, $Res Function(_CoreState) then) =
      __$CoreStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MiscState? miscState,
      UserFeedState? userFeedState,
      UserState? userState,
      ConnectivityState? connectivityState,
      ClinicalState? clinicalState,
      Navigation? navigationState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $MiscStateCopyWith<$Res>? get miscState;
  @override
  $UserFeedStateCopyWith<$Res>? get userFeedState;
  @override
  $UserStateCopyWith<$Res>? get userState;
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  @override
  $ClinicalStateCopyWith<$Res>? get clinicalState;
  @override
  $NavigationCopyWith<$Res>? get navigationState;
}

/// @nodoc
class __$CoreStateCopyWithImpl<$Res> extends _$CoreStateCopyWithImpl<$Res>
    implements _$CoreStateCopyWith<$Res> {
  __$CoreStateCopyWithImpl(_CoreState _value, $Res Function(_CoreState) _then)
      : super(_value, (v) => _then(v as _CoreState));

  @override
  _CoreState get _value => super._value as _CoreState;

  @override
  $Res call({
    Object? miscState = freezed,
    Object? userFeedState = freezed,
    Object? userState = freezed,
    Object? connectivityState = freezed,
    Object? clinicalState = freezed,
    Object? navigationState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_CoreState(
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      userFeedState: userFeedState == freezed
          ? _value.userFeedState
          : userFeedState // ignore: cast_nullable_to_non_nullable
              as UserFeedState?,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      clinicalState: clinicalState == freezed
          ? _value.clinicalState
          : clinicalState // ignore: cast_nullable_to_non_nullable
              as ClinicalState?,
      navigationState: navigationState == freezed
          ? _value.navigationState
          : navigationState // ignore: cast_nullable_to_non_nullable
              as Navigation?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoreState implements _CoreState {
  _$_CoreState(
      {this.miscState,
      this.userFeedState,
      this.userState,
      this.connectivityState,
      this.clinicalState,
      this.navigationState,
      @JsonKey(ignore: true) this.wait});

  factory _$_CoreState.fromJson(Map<String, dynamic> json) =>
      _$_$_CoreStateFromJson(json);

  @override
  final MiscState? miscState;
  @override
  final UserFeedState? userFeedState;
  @override
  final UserState? userState;
  @override
  final ConnectivityState? connectivityState;
  @override
  final ClinicalState? clinicalState;
  @override
  final Navigation? navigationState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'CoreState(miscState: $miscState, userFeedState: $userFeedState, userState: $userState, connectivityState: $connectivityState, clinicalState: $clinicalState, navigationState: $navigationState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoreState &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.userFeedState, userFeedState) ||
                const DeepCollectionEquality()
                    .equals(other.userFeedState, userFeedState)) &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)) &&
            (identical(other.connectivityState, connectivityState) ||
                const DeepCollectionEquality()
                    .equals(other.connectivityState, connectivityState)) &&
            (identical(other.clinicalState, clinicalState) ||
                const DeepCollectionEquality()
                    .equals(other.clinicalState, clinicalState)) &&
            (identical(other.navigationState, navigationState) ||
                const DeepCollectionEquality()
                    .equals(other.navigationState, navigationState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(userFeedState) ^
      const DeepCollectionEquality().hash(userState) ^
      const DeepCollectionEquality().hash(connectivityState) ^
      const DeepCollectionEquality().hash(clinicalState) ^
      const DeepCollectionEquality().hash(navigationState) ^
      const DeepCollectionEquality().hash(wait);

  @JsonKey(ignore: true)
  @override
  _$CoreStateCopyWith<_CoreState> get copyWith =>
      __$CoreStateCopyWithImpl<_CoreState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoreStateToJson(this);
  }
}

abstract class _CoreState implements CoreState {
  factory _CoreState(
      {MiscState? miscState,
      UserFeedState? userFeedState,
      UserState? userState,
      ConnectivityState? connectivityState,
      ClinicalState? clinicalState,
      Navigation? navigationState,
      @JsonKey(ignore: true) Wait? wait}) = _$_CoreState;

  factory _CoreState.fromJson(Map<String, dynamic> json) =
      _$_CoreState.fromJson;

  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  UserFeedState? get userFeedState => throw _privateConstructorUsedError;
  @override
  UserState? get userState => throw _privateConstructorUsedError;
  @override
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  @override
  ClinicalState? get clinicalState => throw _privateConstructorUsedError;
  @override
  Navigation? get navigationState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoreStateCopyWith<_CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

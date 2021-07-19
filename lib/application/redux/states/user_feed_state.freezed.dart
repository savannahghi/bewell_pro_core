// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFeedState _$UserFeedStateFromJson(Map<String, dynamic> json) {
  return _UserFeedState.fromJson(json);
}

/// @nodoc
class _$UserFeedStateTearOff {
  const _$UserFeedStateTearOff();

  _UserFeedState call({String? userFeed}) {
    return _UserFeedState(
      userFeed: userFeed,
    );
  }

  UserFeedState fromJson(Map<String, Object> json) {
    return UserFeedState.fromJson(json);
  }
}

/// @nodoc
const $UserFeedState = _$UserFeedStateTearOff();

/// @nodoc
mixin _$UserFeedState {
  String? get userFeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFeedStateCopyWith<UserFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFeedStateCopyWith<$Res> {
  factory $UserFeedStateCopyWith(
          UserFeedState value, $Res Function(UserFeedState) then) =
      _$UserFeedStateCopyWithImpl<$Res>;
  $Res call({String? userFeed});
}

/// @nodoc
class _$UserFeedStateCopyWithImpl<$Res>
    implements $UserFeedStateCopyWith<$Res> {
  _$UserFeedStateCopyWithImpl(this._value, this._then);

  final UserFeedState _value;
  // ignore: unused_field
  final $Res Function(UserFeedState) _then;

  @override
  $Res call({
    Object? userFeed = freezed,
  }) {
    return _then(_value.copyWith(
      userFeed: userFeed == freezed
          ? _value.userFeed
          : userFeed // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserFeedStateCopyWith<$Res>
    implements $UserFeedStateCopyWith<$Res> {
  factory _$UserFeedStateCopyWith(
          _UserFeedState value, $Res Function(_UserFeedState) then) =
      __$UserFeedStateCopyWithImpl<$Res>;
  @override
  $Res call({String? userFeed});
}

/// @nodoc
class __$UserFeedStateCopyWithImpl<$Res>
    extends _$UserFeedStateCopyWithImpl<$Res>
    implements _$UserFeedStateCopyWith<$Res> {
  __$UserFeedStateCopyWithImpl(
      _UserFeedState _value, $Res Function(_UserFeedState) _then)
      : super(_value, (v) => _then(v as _UserFeedState));

  @override
  _UserFeedState get _value => super._value as _UserFeedState;

  @override
  $Res call({
    Object? userFeed = freezed,
  }) {
    return _then(_UserFeedState(
      userFeed: userFeed == freezed
          ? _value.userFeed
          : userFeed // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFeedState implements _UserFeedState {
  _$_UserFeedState({this.userFeed});

  factory _$_UserFeedState.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFeedStateFromJson(json);

  @override
  final String? userFeed;

  @override
  String toString() {
    return 'UserFeedState(userFeed: $userFeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserFeedState &&
            (identical(other.userFeed, userFeed) ||
                const DeepCollectionEquality()
                    .equals(other.userFeed, userFeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userFeed);

  @JsonKey(ignore: true)
  @override
  _$UserFeedStateCopyWith<_UserFeedState> get copyWith =>
      __$UserFeedStateCopyWithImpl<_UserFeedState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserFeedStateToJson(this);
  }
}

abstract class _UserFeedState implements UserFeedState {
  factory _UserFeedState({String? userFeed}) = _$_UserFeedState;

  factory _UserFeedState.fromJson(Map<String, dynamic> json) =
      _$_UserFeedState.fromJson;

  @override
  String? get userFeed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserFeedStateCopyWith<_UserFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFeedState _$UserFeedStateFromJson(Map<String, dynamic> json) {
  return _UserFeedState.fromJson(json);
}

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
      _$UserFeedStateCopyWithImpl<$Res, UserFeedState>;
  @useResult
  $Res call({String? userFeed});
}

/// @nodoc
class _$UserFeedStateCopyWithImpl<$Res, $Val extends UserFeedState>
    implements $UserFeedStateCopyWith<$Res> {
  _$UserFeedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userFeed = freezed,
  }) {
    return _then(_value.copyWith(
      userFeed: freezed == userFeed
          ? _value.userFeed
          : userFeed // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserFeedStateCopyWith<$Res>
    implements $UserFeedStateCopyWith<$Res> {
  factory _$$_UserFeedStateCopyWith(
          _$_UserFeedState value, $Res Function(_$_UserFeedState) then) =
      __$$_UserFeedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userFeed});
}

/// @nodoc
class __$$_UserFeedStateCopyWithImpl<$Res>
    extends _$UserFeedStateCopyWithImpl<$Res, _$_UserFeedState>
    implements _$$_UserFeedStateCopyWith<$Res> {
  __$$_UserFeedStateCopyWithImpl(
      _$_UserFeedState _value, $Res Function(_$_UserFeedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userFeed = freezed,
  }) {
    return _then(_$_UserFeedState(
      userFeed: freezed == userFeed
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
      _$$_UserFeedStateFromJson(json);

  @override
  final String? userFeed;

  @override
  String toString() {
    return 'UserFeedState(userFeed: $userFeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFeedState &&
            (identical(other.userFeed, userFeed) ||
                other.userFeed == userFeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userFeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserFeedStateCopyWith<_$_UserFeedState> get copyWith =>
      __$$_UserFeedStateCopyWithImpl<_$_UserFeedState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFeedStateToJson(
      this,
    );
  }
}

abstract class _UserFeedState implements UserFeedState {
  factory _UserFeedState({final String? userFeed}) = _$_UserFeedState;

  factory _UserFeedState.fromJson(Map<String, dynamic> json) =
      _$_UserFeedState.fromJson;

  @override
  String? get userFeed;
  @override
  @JsonKey(ignore: true)
  _$$_UserFeedStateCopyWith<_$_UserFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

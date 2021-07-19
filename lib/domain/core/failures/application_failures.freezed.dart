// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApplicationFailuresTearOff {
  const _$ApplicationFailuresTearOff();

  InvalidOtp<T> invalidOtp<T>({required T failedValue}) {
    return InvalidOtp<T>(
      failedValue: failedValue,
    );
  }

  UnexpectedLoginFail<T> unexpectedLoginFail<T>({required T failedValue}) {
    return UnexpectedLoginFail<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ApplicationFailures = _$ApplicationFailuresTearOff();

/// @nodoc
mixin _$ApplicationFailures<T> {
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidOtp,
    required TResult Function(T failedValue) unexpectedLoginFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidOtp,
    TResult Function(T failedValue)? unexpectedLoginFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidOtp<T> value) invalidOtp,
    required TResult Function(UnexpectedLoginFail<T> value) unexpectedLoginFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidOtp<T> value)? invalidOtp,
    TResult Function(UnexpectedLoginFail<T> value)? unexpectedLoginFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationFailuresCopyWith<T, ApplicationFailures<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationFailuresCopyWith<T, $Res> {
  factory $ApplicationFailuresCopyWith(ApplicationFailures<T> value,
          $Res Function(ApplicationFailures<T>) then) =
      _$ApplicationFailuresCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ApplicationFailuresCopyWithImpl<T, $Res>
    implements $ApplicationFailuresCopyWith<T, $Res> {
  _$ApplicationFailuresCopyWithImpl(this._value, this._then);

  final ApplicationFailures<T> _value;
  // ignore: unused_field
  final $Res Function(ApplicationFailures<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $InvalidOtpCopyWith<T, $Res>
    implements $ApplicationFailuresCopyWith<T, $Res> {
  factory $InvalidOtpCopyWith(
          InvalidOtp<T> value, $Res Function(InvalidOtp<T>) then) =
      _$InvalidOtpCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$InvalidOtpCopyWithImpl<T, $Res>
    extends _$ApplicationFailuresCopyWithImpl<T, $Res>
    implements $InvalidOtpCopyWith<T, $Res> {
  _$InvalidOtpCopyWithImpl(
      InvalidOtp<T> _value, $Res Function(InvalidOtp<T>) _then)
      : super(_value, (v) => _then(v as InvalidOtp<T>));

  @override
  InvalidOtp<T> get _value => super._value as InvalidOtp<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidOtp<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidOtp<T> implements InvalidOtp<T> {
  const _$InvalidOtp({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ApplicationFailures<$T>.invalidOtp(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidOtp<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidOtpCopyWith<T, InvalidOtp<T>> get copyWith =>
      _$InvalidOtpCopyWithImpl<T, InvalidOtp<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidOtp,
    required TResult Function(T failedValue) unexpectedLoginFail,
  }) {
    return invalidOtp(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidOtp,
    TResult Function(T failedValue)? unexpectedLoginFail,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidOtp<T> value) invalidOtp,
    required TResult Function(UnexpectedLoginFail<T> value) unexpectedLoginFail,
  }) {
    return invalidOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidOtp<T> value)? invalidOtp,
    TResult Function(UnexpectedLoginFail<T> value)? unexpectedLoginFail,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(this);
    }
    return orElse();
  }
}

abstract class InvalidOtp<T> implements ApplicationFailures<T> {
  const factory InvalidOtp({required T failedValue}) = _$InvalidOtp<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidOtpCopyWith<T, InvalidOtp<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnexpectedLoginFailCopyWith<T, $Res>
    implements $ApplicationFailuresCopyWith<T, $Res> {
  factory $UnexpectedLoginFailCopyWith(UnexpectedLoginFail<T> value,
          $Res Function(UnexpectedLoginFail<T>) then) =
      _$UnexpectedLoginFailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$UnexpectedLoginFailCopyWithImpl<T, $Res>
    extends _$ApplicationFailuresCopyWithImpl<T, $Res>
    implements $UnexpectedLoginFailCopyWith<T, $Res> {
  _$UnexpectedLoginFailCopyWithImpl(UnexpectedLoginFail<T> _value,
      $Res Function(UnexpectedLoginFail<T>) _then)
      : super(_value, (v) => _then(v as UnexpectedLoginFail<T>));

  @override
  UnexpectedLoginFail<T> get _value => super._value as UnexpectedLoginFail<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(UnexpectedLoginFail<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UnexpectedLoginFail<T> implements UnexpectedLoginFail<T> {
  const _$UnexpectedLoginFail({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ApplicationFailures<$T>.unexpectedLoginFail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnexpectedLoginFail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $UnexpectedLoginFailCopyWith<T, UnexpectedLoginFail<T>> get copyWith =>
      _$UnexpectedLoginFailCopyWithImpl<T, UnexpectedLoginFail<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidOtp,
    required TResult Function(T failedValue) unexpectedLoginFail,
  }) {
    return unexpectedLoginFail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidOtp,
    TResult Function(T failedValue)? unexpectedLoginFail,
    required TResult orElse(),
  }) {
    if (unexpectedLoginFail != null) {
      return unexpectedLoginFail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidOtp<T> value) invalidOtp,
    required TResult Function(UnexpectedLoginFail<T> value) unexpectedLoginFail,
  }) {
    return unexpectedLoginFail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidOtp<T> value)? invalidOtp,
    TResult Function(UnexpectedLoginFail<T> value)? unexpectedLoginFail,
    required TResult orElse(),
  }) {
    if (unexpectedLoginFail != null) {
      return unexpectedLoginFail(this);
    }
    return orElse();
  }
}

abstract class UnexpectedLoginFail<T> implements ApplicationFailures<T> {
  const factory UnexpectedLoginFail({required T failedValue}) =
      _$UnexpectedLoginFail<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $UnexpectedLoginFailCopyWith<T, UnexpectedLoginFail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidOtp,
    TResult? Function(T failedValue)? unexpectedLoginFail,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidOtp<T> value)? invalidOtp,
    TResult? Function(UnexpectedLoginFail<T> value)? unexpectedLoginFail,
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
      _$ApplicationFailuresCopyWithImpl<T, $Res, ApplicationFailures<T>>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class _$ApplicationFailuresCopyWithImpl<T, $Res,
        $Val extends ApplicationFailures<T>>
    implements $ApplicationFailuresCopyWith<T, $Res> {
  _$ApplicationFailuresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_value.copyWith(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidOtpCopyWith<T, $Res>
    implements $ApplicationFailuresCopyWith<T, $Res> {
  factory _$$InvalidOtpCopyWith(
          _$InvalidOtp<T> value, $Res Function(_$InvalidOtp<T>) then) =
      __$$InvalidOtpCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidOtpCopyWithImpl<T, $Res>
    extends _$ApplicationFailuresCopyWithImpl<T, $Res, _$InvalidOtp<T>>
    implements _$$InvalidOtpCopyWith<T, $Res> {
  __$$InvalidOtpCopyWithImpl(
      _$InvalidOtp<T> _value, $Res Function(_$InvalidOtp<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$InvalidOtp<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$InvalidOtp<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidOtpCopyWith<T, _$InvalidOtp<T>> get copyWith =>
      __$$InvalidOtpCopyWithImpl<T, _$InvalidOtp<T>>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidOtp,
    TResult? Function(T failedValue)? unexpectedLoginFail,
  }) {
    return invalidOtp?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidOtp<T> value)? invalidOtp,
    TResult? Function(UnexpectedLoginFail<T> value)? unexpectedLoginFail,
  }) {
    return invalidOtp?.call(this);
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
  const factory InvalidOtp({required final T failedValue}) = _$InvalidOtp<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidOtpCopyWith<T, _$InvalidOtp<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedLoginFailCopyWith<T, $Res>
    implements $ApplicationFailuresCopyWith<T, $Res> {
  factory _$$UnexpectedLoginFailCopyWith(_$UnexpectedLoginFail<T> value,
          $Res Function(_$UnexpectedLoginFail<T>) then) =
      __$$UnexpectedLoginFailCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$UnexpectedLoginFailCopyWithImpl<T, $Res>
    extends _$ApplicationFailuresCopyWithImpl<T, $Res, _$UnexpectedLoginFail<T>>
    implements _$$UnexpectedLoginFailCopyWith<T, $Res> {
  __$$UnexpectedLoginFailCopyWithImpl(_$UnexpectedLoginFail<T> _value,
      $Res Function(_$UnexpectedLoginFail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$UnexpectedLoginFail<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedLoginFail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedLoginFailCopyWith<T, _$UnexpectedLoginFail<T>> get copyWith =>
      __$$UnexpectedLoginFailCopyWithImpl<T, _$UnexpectedLoginFail<T>>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidOtp,
    TResult? Function(T failedValue)? unexpectedLoginFail,
  }) {
    return unexpectedLoginFail?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidOtp<T> value)? invalidOtp,
    TResult? Function(UnexpectedLoginFail<T> value)? unexpectedLoginFail,
  }) {
    return unexpectedLoginFail?.call(this);
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
  const factory UnexpectedLoginFail({required final T failedValue}) =
      _$UnexpectedLoginFail<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$UnexpectedLoginFailCopyWith<T, _$UnexpectedLoginFail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

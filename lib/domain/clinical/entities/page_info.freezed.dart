// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

/// @nodoc
class _$PageInfoTearOff {
  const _$PageInfoTearOff();

  _PageInfo call(
      {bool? hasNextPage,
      bool? hasPreviousPage,
      String? startCursor,
      String? endCursor}) {
    return _PageInfo(
      hasNextPage: hasNextPage,
      hasPreviousPage: hasPreviousPage,
      startCursor: startCursor,
      endCursor: endCursor,
    );
  }

  PageInfo fromJson(Map<String, Object> json) {
    return PageInfo.fromJson(json);
  }
}

/// @nodoc
const $PageInfo = _$PageInfoTearOff();

/// @nodoc
mixin _$PageInfo {
  bool? get hasNextPage => throw _privateConstructorUsedError;
  bool? get hasPreviousPage => throw _privateConstructorUsedError;
  String? get startCursor => throw _privateConstructorUsedError;
  String? get endCursor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInfoCopyWith<PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoCopyWith<$Res> {
  factory $PageInfoCopyWith(PageInfo value, $Res Function(PageInfo) then) =
      _$PageInfoCopyWithImpl<$Res>;
  $Res call(
      {bool? hasNextPage,
      bool? hasPreviousPage,
      String? startCursor,
      String? endCursor});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res> implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  final PageInfo _value;
  // ignore: unused_field
  final $Res Function(PageInfo) _then;

  @override
  $Res call({
    Object? hasNextPage = freezed,
    Object? hasPreviousPage = freezed,
    Object? startCursor = freezed,
    Object? endCursor = freezed,
  }) {
    return _then(_value.copyWith(
      hasNextPage: hasNextPage == freezed
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPreviousPage: hasPreviousPage == freezed
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      startCursor: startCursor == freezed
          ? _value.startCursor
          : startCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      endCursor: endCursor == freezed
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PageInfoCopyWith<$Res> implements $PageInfoCopyWith<$Res> {
  factory _$PageInfoCopyWith(_PageInfo value, $Res Function(_PageInfo) then) =
      __$PageInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? hasNextPage,
      bool? hasPreviousPage,
      String? startCursor,
      String? endCursor});
}

/// @nodoc
class __$PageInfoCopyWithImpl<$Res> extends _$PageInfoCopyWithImpl<$Res>
    implements _$PageInfoCopyWith<$Res> {
  __$PageInfoCopyWithImpl(_PageInfo _value, $Res Function(_PageInfo) _then)
      : super(_value, (v) => _then(v as _PageInfo));

  @override
  _PageInfo get _value => super._value as _PageInfo;

  @override
  $Res call({
    Object? hasNextPage = freezed,
    Object? hasPreviousPage = freezed,
    Object? startCursor = freezed,
    Object? endCursor = freezed,
  }) {
    return _then(_PageInfo(
      hasNextPage: hasNextPage == freezed
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPreviousPage: hasPreviousPage == freezed
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      startCursor: startCursor == freezed
          ? _value.startCursor
          : startCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      endCursor: endCursor == freezed
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageInfo implements _PageInfo {
  _$_PageInfo(
      {this.hasNextPage,
      this.hasPreviousPage,
      this.startCursor,
      this.endCursor});

  factory _$_PageInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_PageInfoFromJson(json);

  @override
  final bool? hasNextPage;
  @override
  final bool? hasPreviousPage;
  @override
  final String? startCursor;
  @override
  final String? endCursor;

  @override
  String toString() {
    return 'PageInfo(hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage, startCursor: $startCursor, endCursor: $endCursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PageInfo &&
            (identical(other.hasNextPage, hasNextPage) ||
                const DeepCollectionEquality()
                    .equals(other.hasNextPage, hasNextPage)) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                const DeepCollectionEquality()
                    .equals(other.hasPreviousPage, hasPreviousPage)) &&
            (identical(other.startCursor, startCursor) ||
                const DeepCollectionEquality()
                    .equals(other.startCursor, startCursor)) &&
            (identical(other.endCursor, endCursor) ||
                const DeepCollectionEquality()
                    .equals(other.endCursor, endCursor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasNextPage) ^
      const DeepCollectionEquality().hash(hasPreviousPage) ^
      const DeepCollectionEquality().hash(startCursor) ^
      const DeepCollectionEquality().hash(endCursor);

  @JsonKey(ignore: true)
  @override
  _$PageInfoCopyWith<_PageInfo> get copyWith =>
      __$PageInfoCopyWithImpl<_PageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PageInfoToJson(this);
  }
}

abstract class _PageInfo implements PageInfo {
  factory _PageInfo(
      {bool? hasNextPage,
      bool? hasPreviousPage,
      String? startCursor,
      String? endCursor}) = _$_PageInfo;

  factory _PageInfo.fromJson(Map<String, dynamic> json) = _$_PageInfo.fromJson;

  @override
  bool? get hasNextPage => throw _privateConstructorUsedError;
  @override
  bool? get hasPreviousPage => throw _privateConstructorUsedError;
  @override
  String? get startCursor => throw _privateConstructorUsedError;
  @override
  String? get endCursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PageInfoCopyWith<_PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

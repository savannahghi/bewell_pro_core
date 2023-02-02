// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

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
      _$PageInfoCopyWithImpl<$Res, PageInfo>;
  @useResult
  $Res call(
      {bool? hasNextPage,
      bool? hasPreviousPage,
      String? startCursor,
      String? endCursor});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res, $Val extends PageInfo>
    implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNextPage = freezed,
    Object? hasPreviousPage = freezed,
    Object? startCursor = freezed,
    Object? endCursor = freezed,
  }) {
    return _then(_value.copyWith(
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPreviousPage: freezed == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      startCursor: freezed == startCursor
          ? _value.startCursor
          : startCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      endCursor: freezed == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageInfoCopyWith<$Res> implements $PageInfoCopyWith<$Res> {
  factory _$$_PageInfoCopyWith(
          _$_PageInfo value, $Res Function(_$_PageInfo) then) =
      __$$_PageInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? hasNextPage,
      bool? hasPreviousPage,
      String? startCursor,
      String? endCursor});
}

/// @nodoc
class __$$_PageInfoCopyWithImpl<$Res>
    extends _$PageInfoCopyWithImpl<$Res, _$_PageInfo>
    implements _$$_PageInfoCopyWith<$Res> {
  __$$_PageInfoCopyWithImpl(
      _$_PageInfo _value, $Res Function(_$_PageInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNextPage = freezed,
    Object? hasPreviousPage = freezed,
    Object? startCursor = freezed,
    Object? endCursor = freezed,
  }) {
    return _then(_$_PageInfo(
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPreviousPage: freezed == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      startCursor: freezed == startCursor
          ? _value.startCursor
          : startCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      endCursor: freezed == endCursor
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
      _$$_PageInfoFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_PageInfo &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage) &&
            (identical(other.startCursor, startCursor) ||
                other.startCursor == startCursor) &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, hasNextPage, hasPreviousPage, startCursor, endCursor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageInfoCopyWith<_$_PageInfo> get copyWith =>
      __$$_PageInfoCopyWithImpl<_$_PageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageInfoToJson(
      this,
    );
  }
}

abstract class _PageInfo implements PageInfo {
  factory _PageInfo(
      {final bool? hasNextPage,
      final bool? hasPreviousPage,
      final String? startCursor,
      final String? endCursor}) = _$_PageInfo;

  factory _PageInfo.fromJson(Map<String, dynamic> json) = _$_PageInfo.fromJson;

  @override
  bool? get hasNextPage;
  @override
  bool? get hasPreviousPage;
  @override
  String? get startCursor;
  @override
  String? get endCursor;
  @override
  @JsonKey(ignore: true)
  _$$_PageInfoCopyWith<_$_PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

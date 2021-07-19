// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
class _$AttachmentTearOff {
  const _$AttachmentTearOff();

  _Attachment call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'ContentType') String? contentType,
      @JsonKey(name: 'Language') String? language,
      @JsonKey(name: 'Data') String? data,
      @JsonKey(name: 'Url') String? url,
      @JsonKey(name: 'Size') int? size,
      @JsonKey(name: 'Hash') String? hash,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Creation') String? creation}) {
    return _Attachment(
      id: id,
      contentType: contentType,
      language: language,
      data: data,
      url: url,
      size: size,
      hash: hash,
      title: title,
      creation: creation,
    );
  }

  Attachment fromJson(Map<String, Object> json) {
    return Attachment.fromJson(json);
  }
}

/// @nodoc
const $Attachment = _$AttachmentTearOff();

/// @nodoc
mixin _$Attachment {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// Identifies the type of the data in the attachment and allows a method
  ///  to be chosen to interpret or render the data. Includes mime type
  ///  parameters such as charset where appropriate.
  @JsonKey(name: 'ContentType')
  String? get contentType => throw _privateConstructorUsedError;

  /// The human language of the content.
  ///  The value can be any valid value according to BCP 47.
  @JsonKey(name: 'Language')
  String? get language => throw _privateConstructorUsedError;

  /// The actual data of the attachment - a sequence of bytes, base64 encoded.
  @JsonKey(name: 'Data')
  String? get data => throw _privateConstructorUsedError;

  /// A location where the data can be accessed.
  @JsonKey(name: 'Url')
  String? get url => throw _privateConstructorUsedError;

  /// The number of bytes of data that make up this attachment
  ///  (before base64 encoding, if that is done).
  @JsonKey(name: 'Size')
  int? get size => throw _privateConstructorUsedError;

  /// The calculated hash of the data using SHA-1.
  ///  Represented using base64.
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  /// A label or set of text to display in place of the data.
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;

  /// The date that the attachment was first created.
  @JsonKey(name: 'Creation')
  String? get creation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'ContentType') String? contentType,
      @JsonKey(name: 'Language') String? language,
      @JsonKey(name: 'Data') String? data,
      @JsonKey(name: 'Url') String? url,
      @JsonKey(name: 'Size') int? size,
      @JsonKey(name: 'Hash') String? hash,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Creation') String? creation});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res> implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  final Attachment _value;
  // ignore: unused_field
  final $Res Function(Attachment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? contentType = freezed,
    Object? language = freezed,
    Object? data = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? hash = freezed,
    Object? title = freezed,
    Object? creation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: creation == freezed
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AttachmentCopyWith<$Res> implements $AttachmentCopyWith<$Res> {
  factory _$AttachmentCopyWith(
          _Attachment value, $Res Function(_Attachment) then) =
      __$AttachmentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'ContentType') String? contentType,
      @JsonKey(name: 'Language') String? language,
      @JsonKey(name: 'Data') String? data,
      @JsonKey(name: 'Url') String? url,
      @JsonKey(name: 'Size') int? size,
      @JsonKey(name: 'Hash') String? hash,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Creation') String? creation});
}

/// @nodoc
class __$AttachmentCopyWithImpl<$Res> extends _$AttachmentCopyWithImpl<$Res>
    implements _$AttachmentCopyWith<$Res> {
  __$AttachmentCopyWithImpl(
      _Attachment _value, $Res Function(_Attachment) _then)
      : super(_value, (v) => _then(v as _Attachment));

  @override
  _Attachment get _value => super._value as _Attachment;

  @override
  $Res call({
    Object? id = freezed,
    Object? contentType = freezed,
    Object? language = freezed,
    Object? data = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? hash = freezed,
    Object? title = freezed,
    Object? creation = freezed,
  }) {
    return _then(_Attachment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: creation == freezed
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Attachment implements _Attachment {
  _$_Attachment(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ContentType') this.contentType,
      @JsonKey(name: 'Language') this.language,
      @JsonKey(name: 'Data') this.data,
      @JsonKey(name: 'Url') this.url,
      @JsonKey(name: 'Size') this.size,
      @JsonKey(name: 'Hash') this.hash,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Creation') this.creation});

  factory _$_Attachment.fromJson(Map<String, dynamic> json) =>
      _$_$_AttachmentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// Identifies the type of the data in the attachment and allows a method
  ///  to be chosen to interpret or render the data. Includes mime type
  ///  parameters such as charset where appropriate.
  @JsonKey(name: 'ContentType')
  final String? contentType;
  @override

  /// The human language of the content.
  ///  The value can be any valid value according to BCP 47.
  @JsonKey(name: 'Language')
  final String? language;
  @override

  /// The actual data of the attachment - a sequence of bytes, base64 encoded.
  @JsonKey(name: 'Data')
  final String? data;
  @override

  /// A location where the data can be accessed.
  @JsonKey(name: 'Url')
  final String? url;
  @override

  /// The number of bytes of data that make up this attachment
  ///  (before base64 encoding, if that is done).
  @JsonKey(name: 'Size')
  final int? size;
  @override

  /// The calculated hash of the data using SHA-1.
  ///  Represented using base64.
  @JsonKey(name: 'Hash')
  final String? hash;
  @override

  /// A label or set of text to display in place of the data.
  @JsonKey(name: 'Title')
  final String? title;
  @override

  /// The date that the attachment was first created.
  @JsonKey(name: 'Creation')
  final String? creation;

  @override
  String toString() {
    return 'Attachment(id: $id, contentType: $contentType, language: $language, data: $data, url: $url, size: $size, hash: $hash, title: $title, creation: $creation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Attachment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.creation, creation) ||
                const DeepCollectionEquality()
                    .equals(other.creation, creation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(creation);

  @JsonKey(ignore: true)
  @override
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      __$AttachmentCopyWithImpl<_Attachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AttachmentToJson(this);
  }
}

abstract class _Attachment implements Attachment {
  factory _Attachment(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'ContentType') String? contentType,
      @JsonKey(name: 'Language') String? language,
      @JsonKey(name: 'Data') String? data,
      @JsonKey(name: 'Url') String? url,
      @JsonKey(name: 'Size') int? size,
      @JsonKey(name: 'Hash') String? hash,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Creation') String? creation}) = _$_Attachment;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$_Attachment.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// Identifies the type of the data in the attachment and allows a method
  ///  to be chosen to interpret or render the data. Includes mime type
  ///  parameters such as charset where appropriate.
  @JsonKey(name: 'ContentType')
  String? get contentType => throw _privateConstructorUsedError;
  @override

  /// The human language of the content.
  ///  The value can be any valid value according to BCP 47.
  @JsonKey(name: 'Language')
  String? get language => throw _privateConstructorUsedError;
  @override

  /// The actual data of the attachment - a sequence of bytes, base64 encoded.
  @JsonKey(name: 'Data')
  String? get data => throw _privateConstructorUsedError;
  @override

  /// A location where the data can be accessed.
  @JsonKey(name: 'Url')
  String? get url => throw _privateConstructorUsedError;
  @override

  /// The number of bytes of data that make up this attachment
  ///  (before base64 encoding, if that is done).
  @JsonKey(name: 'Size')
  int? get size => throw _privateConstructorUsedError;
  @override

  /// The calculated hash of the data using SHA-1.
  ///  Represented using base64.
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;
  @override

  /// A label or set of text to display in place of the data.
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @override

  /// The date that the attachment was first created.
  @JsonKey(name: 'Creation')
  String? get creation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

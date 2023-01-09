// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

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
      _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
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
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AttachmentCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$_AttachmentCopyWith(
          _$_Attachment value, $Res Function(_$_Attachment) then) =
      __$$_AttachmentCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_AttachmentCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$_Attachment>
    implements _$$_AttachmentCopyWith<$Res> {
  __$$_AttachmentCopyWithImpl(
      _$_Attachment _value, $Res Function(_$_Attachment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_Attachment(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
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
      _$$_AttachmentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// Identifies the type of the data in the attachment and allows a method
  ///  to be chosen to interpret or render the data. Includes mime type
  ///  parameters such as charset where appropriate.
  @override
  @JsonKey(name: 'ContentType')
  final String? contentType;

  /// The human language of the content.
  ///  The value can be any valid value according to BCP 47.
  @override
  @JsonKey(name: 'Language')
  final String? language;

  /// The actual data of the attachment - a sequence of bytes, base64 encoded.
  @override
  @JsonKey(name: 'Data')
  final String? data;

  /// A location where the data can be accessed.
  @override
  @JsonKey(name: 'Url')
  final String? url;

  /// The number of bytes of data that make up this attachment
  ///  (before base64 encoding, if that is done).
  @override
  @JsonKey(name: 'Size')
  final int? size;

  /// The calculated hash of the data using SHA-1.
  ///  Represented using base64.
  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  /// A label or set of text to display in place of the data.
  @override
  @JsonKey(name: 'Title')
  final String? title;

  /// The date that the attachment was first created.
  @override
  @JsonKey(name: 'Creation')
  final String? creation;

  @override
  String toString() {
    return 'Attachment(id: $id, contentType: $contentType, language: $language, data: $data, url: $url, size: $size, hash: $hash, title: $title, creation: $creation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attachment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.creation, creation) ||
                other.creation == creation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, contentType, language, data,
      url, size, hash, title, creation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttachmentCopyWith<_$_Attachment> get copyWith =>
      __$$_AttachmentCopyWithImpl<_$_Attachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttachmentToJson(
      this,
    );
  }
}

abstract class _Attachment implements Attachment {
  factory _Attachment(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'ContentType') final String? contentType,
      @JsonKey(name: 'Language') final String? language,
      @JsonKey(name: 'Data') final String? data,
      @JsonKey(name: 'Url') final String? url,
      @JsonKey(name: 'Size') final int? size,
      @JsonKey(name: 'Hash') final String? hash,
      @JsonKey(name: 'Title') final String? title,
      @JsonKey(name: 'Creation') final String? creation}) = _$_Attachment;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$_Attachment.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// Identifies the type of the data in the attachment and allows a method
  ///  to be chosen to interpret or render the data. Includes mime type
  ///  parameters such as charset where appropriate.
  @JsonKey(name: 'ContentType')
  String? get contentType;
  @override

  /// The human language of the content.
  ///  The value can be any valid value according to BCP 47.
  @JsonKey(name: 'Language')
  String? get language;
  @override

  /// The actual data of the attachment - a sequence of bytes, base64 encoded.
  @JsonKey(name: 'Data')
  String? get data;
  @override

  /// A location where the data can be accessed.
  @JsonKey(name: 'Url')
  String? get url;
  @override

  /// The number of bytes of data that make up this attachment
  ///  (before base64 encoding, if that is done).
  @JsonKey(name: 'Size')
  int? get size;
  @override

  /// The calculated hash of the data using SHA-1.
  ///  Represented using base64.
  @JsonKey(name: 'Hash')
  String? get hash;
  @override

  /// A label or set of text to display in place of the data.
  @JsonKey(name: 'Title')
  String? get title;
  @override

  /// The date that the attachment was first created.
  @JsonKey(name: 'Creation')
  String? get creation;
  @override
  @JsonKey(ignore: true)
  _$$_AttachmentCopyWith<_$_Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

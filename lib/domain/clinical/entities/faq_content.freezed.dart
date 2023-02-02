// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faq_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQContentRelay _$FAQContentRelayFromJson(Map<String, dynamic> json) {
  return _FAQContentRelay.fromJson(json);
}

/// @nodoc
mixin _$FAQContentRelay {
  @JsonKey(name: 'getFaqsContent')
  List<FAQContent?>? get faqs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQContentRelayCopyWith<FAQContentRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQContentRelayCopyWith<$Res> {
  factory $FAQContentRelayCopyWith(
          FAQContentRelay value, $Res Function(FAQContentRelay) then) =
      _$FAQContentRelayCopyWithImpl<$Res, FAQContentRelay>;
  @useResult
  $Res call({@JsonKey(name: 'getFaqsContent') List<FAQContent?>? faqs});
}

/// @nodoc
class _$FAQContentRelayCopyWithImpl<$Res, $Val extends FAQContentRelay>
    implements $FAQContentRelayCopyWith<$Res> {
  _$FAQContentRelayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqs = freezed,
  }) {
    return _then(_value.copyWith(
      faqs: freezed == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQContentRelayCopyWith<$Res>
    implements $FAQContentRelayCopyWith<$Res> {
  factory _$$_FAQContentRelayCopyWith(
          _$_FAQContentRelay value, $Res Function(_$_FAQContentRelay) then) =
      __$$_FAQContentRelayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'getFaqsContent') List<FAQContent?>? faqs});
}

/// @nodoc
class __$$_FAQContentRelayCopyWithImpl<$Res>
    extends _$FAQContentRelayCopyWithImpl<$Res, _$_FAQContentRelay>
    implements _$$_FAQContentRelayCopyWith<$Res> {
  __$$_FAQContentRelayCopyWithImpl(
      _$_FAQContentRelay _value, $Res Function(_$_FAQContentRelay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqs = freezed,
  }) {
    return _then(_$_FAQContentRelay(
      faqs: freezed == faqs
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQContentRelay implements _FAQContentRelay {
  _$_FAQContentRelay(
      {@JsonKey(name: 'getFaqsContent') final List<FAQContent?>? faqs})
      : _faqs = faqs;

  factory _$_FAQContentRelay.fromJson(Map<String, dynamic> json) =>
      _$$_FAQContentRelayFromJson(json);

  final List<FAQContent?>? _faqs;
  @override
  @JsonKey(name: 'getFaqsContent')
  List<FAQContent?>? get faqs {
    final value = _faqs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FAQContentRelay(faqs: $faqs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQContentRelay &&
            const DeepCollectionEquality().equals(other._faqs, _faqs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_faqs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQContentRelayCopyWith<_$_FAQContentRelay> get copyWith =>
      __$$_FAQContentRelayCopyWithImpl<_$_FAQContentRelay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FAQContentRelayToJson(
      this,
    );
  }
}

abstract class _FAQContentRelay implements FAQContentRelay {
  factory _FAQContentRelay(
          {@JsonKey(name: 'getFaqsContent') final List<FAQContent?>? faqs}) =
      _$_FAQContentRelay;

  factory _FAQContentRelay.fromJson(Map<String, dynamic> json) =
      _$_FAQContentRelay.fromJson;

  @override
  @JsonKey(name: 'getFaqsContent')
  List<FAQContent?>? get faqs;
  @override
  @JsonKey(ignore: true)
  _$$_FAQContentRelayCopyWith<_$_FAQContentRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

FAQContent _$FAQContentFromJson(Map<String, dynamic> json) {
  return _FAQContent.fromJson(json);
}

/// @nodoc
mixin _$FAQContent {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'excerpt')
  String? get excerpt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featureImage')
  String? get featureImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'html')
  String? get html => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedAt')
  String? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'readingTime')
  int? get readingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<FAQTag?>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQContentCopyWith<FAQContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQContentCopyWith<$Res> {
  factory $FAQContentCopyWith(
          FAQContent value, $Res Function(FAQContent) then) =
      _$FAQContentCopyWithImpl<$Res, FAQContent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'excerpt') String? excerpt,
      @JsonKey(name: 'featureImage') String? featureImage,
      @JsonKey(name: 'html') String? html,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'readingTime') int? readingTime,
      @JsonKey(name: 'tags') List<FAQTag?>? tags});
}

/// @nodoc
class _$FAQContentCopyWithImpl<$Res, $Val extends FAQContent>
    implements $FAQContentCopyWith<$Res> {
  _$FAQContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? excerpt = freezed,
    Object? featureImage = freezed,
    Object? html = freezed,
    Object? publishedAt = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? readingTime = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      featureImage: freezed == featureImage
          ? _value.featureImage
          : featureImage // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      readingTime: freezed == readingTime
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<FAQTag?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQContentCopyWith<$Res>
    implements $FAQContentCopyWith<$Res> {
  factory _$$_FAQContentCopyWith(
          _$_FAQContent value, $Res Function(_$_FAQContent) then) =
      __$$_FAQContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'excerpt') String? excerpt,
      @JsonKey(name: 'featureImage') String? featureImage,
      @JsonKey(name: 'html') String? html,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'readingTime') int? readingTime,
      @JsonKey(name: 'tags') List<FAQTag?>? tags});
}

/// @nodoc
class __$$_FAQContentCopyWithImpl<$Res>
    extends _$FAQContentCopyWithImpl<$Res, _$_FAQContent>
    implements _$$_FAQContentCopyWith<$Res> {
  __$$_FAQContentCopyWithImpl(
      _$_FAQContent _value, $Res Function(_$_FAQContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? excerpt = freezed,
    Object? featureImage = freezed,
    Object? html = freezed,
    Object? publishedAt = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? readingTime = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_FAQContent(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      featureImage: freezed == featureImage
          ? _value.featureImage
          : featureImage // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      readingTime: freezed == readingTime
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<FAQTag?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQContent implements _FAQContent {
  _$_FAQContent(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'excerpt') this.excerpt,
      @JsonKey(name: 'featureImage') this.featureImage,
      @JsonKey(name: 'html') this.html,
      @JsonKey(name: 'publishedAt') this.publishedAt,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'readingTime') this.readingTime,
      @JsonKey(name: 'tags') final List<FAQTag?>? tags})
      : _tags = tags;

  factory _$_FAQContent.fromJson(Map<String, dynamic> json) =>
      _$$_FAQContentFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'excerpt')
  final String? excerpt;
  @override
  @JsonKey(name: 'featureImage')
  final String? featureImage;
  @override
  @JsonKey(name: 'html')
  final String? html;
  @override
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'readingTime')
  final int? readingTime;
  final List<FAQTag?>? _tags;
  @override
  @JsonKey(name: 'tags')
  List<FAQTag?>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FAQContent(id: $id, createdAt: $createdAt, excerpt: $excerpt, featureImage: $featureImage, html: $html, publishedAt: $publishedAt, slug: $slug, title: $title, readingTime: $readingTime, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQContent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.featureImage, featureImage) ||
                other.featureImage == featureImage) &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.readingTime, readingTime) ||
                other.readingTime == readingTime) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      excerpt,
      featureImage,
      html,
      publishedAt,
      slug,
      title,
      readingTime,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQContentCopyWith<_$_FAQContent> get copyWith =>
      __$$_FAQContentCopyWithImpl<_$_FAQContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FAQContentToJson(
      this,
    );
  }
}

abstract class _FAQContent implements FAQContent {
  factory _FAQContent(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'createdAt') final String? createdAt,
      @JsonKey(name: 'excerpt') final String? excerpt,
      @JsonKey(name: 'featureImage') final String? featureImage,
      @JsonKey(name: 'html') final String? html,
      @JsonKey(name: 'publishedAt') final String? publishedAt,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'readingTime') final int? readingTime,
      @JsonKey(name: 'tags') final List<FAQTag?>? tags}) = _$_FAQContent;

  factory _FAQContent.fromJson(Map<String, dynamic> json) =
      _$_FAQContent.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'excerpt')
  String? get excerpt;
  @override
  @JsonKey(name: 'featureImage')
  String? get featureImage;
  @override
  @JsonKey(name: 'html')
  String? get html;
  @override
  @JsonKey(name: 'publishedAt')
  String? get publishedAt;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'readingTime')
  int? get readingTime;
  @override
  @JsonKey(name: 'tags')
  List<FAQTag?>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_FAQContentCopyWith<_$_FAQContent> get copyWith =>
      throw _privateConstructorUsedError;
}

FAQTag _$FAQTagFromJson(Map<String, dynamic> json) {
  return _FAQTag.fromJson(json);
}

/// @nodoc
mixin _$FAQTag {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQTagCopyWith<FAQTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQTagCopyWith<$Res> {
  factory $FAQTagCopyWith(FAQTag value, $Res Function(FAQTag) then) =
      _$FAQTagCopyWithImpl<$Res, FAQTag>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug});
}

/// @nodoc
class _$FAQTagCopyWithImpl<$Res, $Val extends FAQTag>
    implements $FAQTagCopyWith<$Res> {
  _$FAQTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQTagCopyWith<$Res> implements $FAQTagCopyWith<$Res> {
  factory _$$_FAQTagCopyWith(_$_FAQTag value, $Res Function(_$_FAQTag) then) =
      __$$_FAQTagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug});
}

/// @nodoc
class __$$_FAQTagCopyWithImpl<$Res>
    extends _$FAQTagCopyWithImpl<$Res, _$_FAQTag>
    implements _$$_FAQTagCopyWith<$Res> {
  __$$_FAQTagCopyWithImpl(_$_FAQTag _value, $Res Function(_$_FAQTag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_$_FAQTag(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQTag implements _FAQTag {
  _$_FAQTag(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug});

  factory _$_FAQTag.fromJson(Map<String, dynamic> json) =>
      _$$_FAQTagFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'slug')
  final String? slug;

  @override
  String toString() {
    return 'FAQTag(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQTag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQTagCopyWith<_$_FAQTag> get copyWith =>
      __$$_FAQTagCopyWithImpl<_$_FAQTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FAQTagToJson(
      this,
    );
  }
}

abstract class _FAQTag implements FAQTag {
  factory _FAQTag(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'slug') final String? slug}) = _$_FAQTag;

  factory _FAQTag.fromJson(Map<String, dynamic> json) = _$_FAQTag.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$_FAQTagCopyWith<_$_FAQTag> get copyWith =>
      throw _privateConstructorUsedError;
}

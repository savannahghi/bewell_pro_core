// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'concepts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConceptName _$ConceptNameFromJson(Map<String, dynamic> json) {
  return _ConceptName.fromJson(json);
}

/// @nodoc
mixin _$ConceptName {
  @JsonKey(name: 'external_id')
  String? get loading => throw _privateConstructorUsedError;
  @JsonKey(name: 'locale')
  String? get locale => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_type')
  String? get nameType => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConceptNameCopyWith<ConceptName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptNameCopyWith<$Res> {
  factory $ConceptNameCopyWith(
          ConceptName value, $Res Function(ConceptName) then) =
      _$ConceptNameCopyWithImpl<$Res, ConceptName>;
  @useResult
  $Res call(
      {@JsonKey(name: 'external_id') String? loading,
      @JsonKey(name: 'locale') String? locale,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'name_type') String? nameType,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uuid') String? uuid});
}

/// @nodoc
class _$ConceptNameCopyWithImpl<$Res, $Val extends ConceptName>
    implements $ConceptNameCopyWith<$Res> {
  _$ConceptNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? locale = freezed,
    Object? name = freezed,
    Object? nameType = freezed,
    Object? type = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_value.copyWith(
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameType: freezed == nameType
          ? _value.nameType
          : nameType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConceptNameCopyWith<$Res>
    implements $ConceptNameCopyWith<$Res> {
  factory _$$_ConceptNameCopyWith(
          _$_ConceptName value, $Res Function(_$_ConceptName) then) =
      __$$_ConceptNameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'external_id') String? loading,
      @JsonKey(name: 'locale') String? locale,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'name_type') String? nameType,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uuid') String? uuid});
}

/// @nodoc
class __$$_ConceptNameCopyWithImpl<$Res>
    extends _$ConceptNameCopyWithImpl<$Res, _$_ConceptName>
    implements _$$_ConceptNameCopyWith<$Res> {
  __$$_ConceptNameCopyWithImpl(
      _$_ConceptName _value, $Res Function(_$_ConceptName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? locale = freezed,
    Object? name = freezed,
    Object? nameType = freezed,
    Object? type = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_$_ConceptName(
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameType: freezed == nameType
          ? _value.nameType
          : nameType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConceptName implements _ConceptName {
  _$_ConceptName(
      {@JsonKey(name: 'external_id') this.loading,
      @JsonKey(name: 'locale') this.locale,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'name_type') this.nameType,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'uuid') this.uuid});

  factory _$_ConceptName.fromJson(Map<String, dynamic> json) =>
      _$$_ConceptNameFromJson(json);

  @override
  @JsonKey(name: 'external_id')
  final String? loading;
  @override
  @JsonKey(name: 'locale')
  final String? locale;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'name_type')
  final String? nameType;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;

  @override
  String toString() {
    return 'ConceptName(loading: $loading, locale: $locale, name: $name, nameType: $nameType, type: $type, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConceptName &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameType, nameType) ||
                other.nameType == nameType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, locale, name, nameType, type, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConceptNameCopyWith<_$_ConceptName> get copyWith =>
      __$$_ConceptNameCopyWithImpl<_$_ConceptName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConceptNameToJson(
      this,
    );
  }
}

abstract class _ConceptName implements ConceptName {
  factory _ConceptName(
      {@JsonKey(name: 'external_id') final String? loading,
      @JsonKey(name: 'locale') final String? locale,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'name_type') final String? nameType,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'uuid') final String? uuid}) = _$_ConceptName;

  factory _ConceptName.fromJson(Map<String, dynamic> json) =
      _$_ConceptName.fromJson;

  @override
  @JsonKey(name: 'external_id')
  String? get loading;
  @override
  @JsonKey(name: 'locale')
  String? get locale;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'name_type')
  String? get nameType;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_ConceptNameCopyWith<_$_ConceptName> get copyWith =>
      throw _privateConstructorUsedError;
}

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return _Description.fromJson(json);
}

/// @nodoc
mixin _$Description {
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description_type')
  String? get descriptionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DescriptionCopyWith<Description> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionCopyWith<$Res> {
  factory $DescriptionCopyWith(
          Description value, $Res Function(Description) then) =
      _$DescriptionCopyWithImpl<$Res, Description>;
  @useResult
  $Res call(
      {@JsonKey(name: 'description') String? description,
      @JsonKey(name: 'description_type') String? descriptionType,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uuid') String? uuid});
}

/// @nodoc
class _$DescriptionCopyWithImpl<$Res, $Val extends Description>
    implements $DescriptionCopyWith<$Res> {
  _$DescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? descriptionType = freezed,
    Object? type = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionType: freezed == descriptionType
          ? _value.descriptionType
          : descriptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DescriptionCopyWith<$Res>
    implements $DescriptionCopyWith<$Res> {
  factory _$$_DescriptionCopyWith(
          _$_Description value, $Res Function(_$_Description) then) =
      __$$_DescriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'description') String? description,
      @JsonKey(name: 'description_type') String? descriptionType,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uuid') String? uuid});
}

/// @nodoc
class __$$_DescriptionCopyWithImpl<$Res>
    extends _$DescriptionCopyWithImpl<$Res, _$_Description>
    implements _$$_DescriptionCopyWith<$Res> {
  __$$_DescriptionCopyWithImpl(
      _$_Description _value, $Res Function(_$_Description) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? descriptionType = freezed,
    Object? type = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_$_Description(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionType: freezed == descriptionType
          ? _value.descriptionType
          : descriptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Description implements _Description {
  _$_Description(
      {@JsonKey(name: 'description') this.description,
      @JsonKey(name: 'description_type') this.descriptionType,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'uuid') this.uuid});

  factory _$_Description.fromJson(Map<String, dynamic> json) =>
      _$$_DescriptionFromJson(json);

  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'description_type')
  final String? descriptionType;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;

  @override
  String toString() {
    return 'Description(description: $description, descriptionType: $descriptionType, type: $type, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Description &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionType, descriptionType) ||
                other.descriptionType == descriptionType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, descriptionType, type, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DescriptionCopyWith<_$_Description> get copyWith =>
      __$$_DescriptionCopyWithImpl<_$_Description>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DescriptionToJson(
      this,
    );
  }
}

abstract class _Description implements Description {
  factory _Description(
      {@JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'description_type') final String? descriptionType,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'uuid') final String? uuid}) = _$_Description;

  factory _Description.fromJson(Map<String, dynamic> json) =
      _$_Description.fromJson;

  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'description_type')
  String? get descriptionType;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_DescriptionCopyWith<_$_Description> get copyWith =>
      throw _privateConstructorUsedError;
}

Concept _$ConceptFromJson(Map<String, dynamic> json) {
  return _Concept.fromJson(json);
}

/// @nodoc
mixin _$Concept {
  @JsonKey(name: 'concept_class')
  String? get conceptClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_on')
  String? get createdOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'datatype')
  String? get dataType => throw _privateConstructorUsedError;
  @JsonKey(name: 'descriptions')
  List<Description?>? get descriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_locale')
  String? get displayLocale => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_id')
  String? get externalID => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_latest_version')
  bool? get isLatestVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'locale')
  String? get locale => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'retired')
  bool? get retired => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_url')
  String? get sourceURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_on')
  String? get updatedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  String? get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'names')
  List<ConceptName?>? get names => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConceptCopyWith<Concept> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptCopyWith<$Res> {
  factory $ConceptCopyWith(Concept value, $Res Function(Concept) then) =
      _$ConceptCopyWithImpl<$Res, Concept>;
  @useResult
  $Res call(
      {@JsonKey(name: 'concept_class') String? conceptClass,
      @JsonKey(name: 'created_on') String? createdOn,
      @JsonKey(name: 'datatype') String? dataType,
      @JsonKey(name: 'descriptions') List<Description?>? descriptions,
      @JsonKey(name: 'display_locale') String? displayLocale,
      @JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'external_id') String? externalID,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'is_latest_version') bool? isLatestVersion,
      @JsonKey(name: 'locale') String? locale,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'retired') bool? retired,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'source') String? source,
      @JsonKey(name: 'source_url') String? sourceURL,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'updated_on') String? updatedOn,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'version') String? version,
      @JsonKey(name: 'names') List<ConceptName?>? names});
}

/// @nodoc
class _$ConceptCopyWithImpl<$Res, $Val extends Concept>
    implements $ConceptCopyWith<$Res> {
  _$ConceptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conceptClass = freezed,
    Object? createdOn = freezed,
    Object? dataType = freezed,
    Object? descriptions = freezed,
    Object? displayLocale = freezed,
    Object? displayName = freezed,
    Object? externalID = freezed,
    Object? id = freezed,
    Object? isLatestVersion = freezed,
    Object? locale = freezed,
    Object? owner = freezed,
    Object? retired = freezed,
    Object? uuid = freezed,
    Object? source = freezed,
    Object? sourceURL = freezed,
    Object? type = freezed,
    Object? updatedOn = freezed,
    Object? url = freezed,
    Object? version = freezed,
    Object? names = freezed,
  }) {
    return _then(_value.copyWith(
      conceptClass: freezed == conceptClass
          ? _value.conceptClass
          : conceptClass // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String?,
      dataType: freezed == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<Description?>?,
      displayLocale: freezed == displayLocale
          ? _value.displayLocale
          : displayLocale // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isLatestVersion: freezed == isLatestVersion
          ? _value.isLatestVersion
          : isLatestVersion // ignore: cast_nullable_to_non_nullable
              as bool?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      retired: freezed == retired
          ? _value.retired
          : retired // ignore: cast_nullable_to_non_nullable
              as bool?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceURL: freezed == sourceURL
          ? _value.sourceURL
          : sourceURL // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      names: freezed == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<ConceptName?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConceptCopyWith<$Res> implements $ConceptCopyWith<$Res> {
  factory _$$_ConceptCopyWith(
          _$_Concept value, $Res Function(_$_Concept) then) =
      __$$_ConceptCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'concept_class') String? conceptClass,
      @JsonKey(name: 'created_on') String? createdOn,
      @JsonKey(name: 'datatype') String? dataType,
      @JsonKey(name: 'descriptions') List<Description?>? descriptions,
      @JsonKey(name: 'display_locale') String? displayLocale,
      @JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'external_id') String? externalID,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'is_latest_version') bool? isLatestVersion,
      @JsonKey(name: 'locale') String? locale,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'retired') bool? retired,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'source') String? source,
      @JsonKey(name: 'source_url') String? sourceURL,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'updated_on') String? updatedOn,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'version') String? version,
      @JsonKey(name: 'names') List<ConceptName?>? names});
}

/// @nodoc
class __$$_ConceptCopyWithImpl<$Res>
    extends _$ConceptCopyWithImpl<$Res, _$_Concept>
    implements _$$_ConceptCopyWith<$Res> {
  __$$_ConceptCopyWithImpl(_$_Concept _value, $Res Function(_$_Concept) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conceptClass = freezed,
    Object? createdOn = freezed,
    Object? dataType = freezed,
    Object? descriptions = freezed,
    Object? displayLocale = freezed,
    Object? displayName = freezed,
    Object? externalID = freezed,
    Object? id = freezed,
    Object? isLatestVersion = freezed,
    Object? locale = freezed,
    Object? owner = freezed,
    Object? retired = freezed,
    Object? uuid = freezed,
    Object? source = freezed,
    Object? sourceURL = freezed,
    Object? type = freezed,
    Object? updatedOn = freezed,
    Object? url = freezed,
    Object? version = freezed,
    Object? names = freezed,
  }) {
    return _then(_$_Concept(
      conceptClass: freezed == conceptClass
          ? _value.conceptClass
          : conceptClass // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String?,
      dataType: freezed == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<Description?>?,
      displayLocale: freezed == displayLocale
          ? _value.displayLocale
          : displayLocale // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isLatestVersion: freezed == isLatestVersion
          ? _value.isLatestVersion
          : isLatestVersion // ignore: cast_nullable_to_non_nullable
              as bool?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      retired: freezed == retired
          ? _value.retired
          : retired // ignore: cast_nullable_to_non_nullable
              as bool?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceURL: freezed == sourceURL
          ? _value.sourceURL
          : sourceURL // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      names: freezed == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<ConceptName?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Concept implements _Concept {
  _$_Concept(
      {@JsonKey(name: 'concept_class') this.conceptClass,
      @JsonKey(name: 'created_on') this.createdOn,
      @JsonKey(name: 'datatype') this.dataType,
      @JsonKey(name: 'descriptions') final List<Description?>? descriptions,
      @JsonKey(name: 'display_locale') this.displayLocale,
      @JsonKey(name: 'display_name') this.displayName,
      @JsonKey(name: 'external_id') this.externalID,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'is_latest_version') this.isLatestVersion,
      @JsonKey(name: 'locale') this.locale,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'retired') this.retired,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'source') this.source,
      @JsonKey(name: 'source_url') this.sourceURL,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'updated_on') this.updatedOn,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'version') this.version,
      @JsonKey(name: 'names') final List<ConceptName?>? names})
      : _descriptions = descriptions,
        _names = names;

  factory _$_Concept.fromJson(Map<String, dynamic> json) =>
      _$$_ConceptFromJson(json);

  @override
  @JsonKey(name: 'concept_class')
  final String? conceptClass;
  @override
  @JsonKey(name: 'created_on')
  final String? createdOn;
  @override
  @JsonKey(name: 'datatype')
  final String? dataType;
  final List<Description?>? _descriptions;
  @override
  @JsonKey(name: 'descriptions')
  List<Description?>? get descriptions {
    final value = _descriptions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'display_locale')
  final String? displayLocale;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @JsonKey(name: 'external_id')
  final String? externalID;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'is_latest_version')
  final bool? isLatestVersion;
  @override
  @JsonKey(name: 'locale')
  final String? locale;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'retired')
  final bool? retired;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'source')
  final String? source;
  @override
  @JsonKey(name: 'source_url')
  final String? sourceURL;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'updated_on')
  final String? updatedOn;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'version')
  final String? version;
  final List<ConceptName?>? _names;
  @override
  @JsonKey(name: 'names')
  List<ConceptName?>? get names {
    final value = _names;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Concept(conceptClass: $conceptClass, createdOn: $createdOn, dataType: $dataType, descriptions: $descriptions, displayLocale: $displayLocale, displayName: $displayName, externalID: $externalID, id: $id, isLatestVersion: $isLatestVersion, locale: $locale, owner: $owner, retired: $retired, uuid: $uuid, source: $source, sourceURL: $sourceURL, type: $type, updatedOn: $updatedOn, url: $url, version: $version, names: $names)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Concept &&
            (identical(other.conceptClass, conceptClass) ||
                other.conceptClass == conceptClass) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            (identical(other.displayLocale, displayLocale) ||
                other.displayLocale == displayLocale) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.externalID, externalID) ||
                other.externalID == externalID) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isLatestVersion, isLatestVersion) ||
                other.isLatestVersion == isLatestVersion) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.retired, retired) || other.retired == retired) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceURL, sourceURL) ||
                other.sourceURL == sourceURL) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._names, _names));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        conceptClass,
        createdOn,
        dataType,
        const DeepCollectionEquality().hash(_descriptions),
        displayLocale,
        displayName,
        externalID,
        id,
        isLatestVersion,
        locale,
        owner,
        retired,
        uuid,
        source,
        sourceURL,
        type,
        updatedOn,
        url,
        version,
        const DeepCollectionEquality().hash(_names)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConceptCopyWith<_$_Concept> get copyWith =>
      __$$_ConceptCopyWithImpl<_$_Concept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConceptToJson(
      this,
    );
  }
}

abstract class _Concept implements Concept {
  factory _Concept(
      {@JsonKey(name: 'concept_class') final String? conceptClass,
      @JsonKey(name: 'created_on') final String? createdOn,
      @JsonKey(name: 'datatype') final String? dataType,
      @JsonKey(name: 'descriptions') final List<Description?>? descriptions,
      @JsonKey(name: 'display_locale') final String? displayLocale,
      @JsonKey(name: 'display_name') final String? displayName,
      @JsonKey(name: 'external_id') final String? externalID,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'is_latest_version') final bool? isLatestVersion,
      @JsonKey(name: 'locale') final String? locale,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'retired') final bool? retired,
      @JsonKey(name: 'uuid') final String? uuid,
      @JsonKey(name: 'source') final String? source,
      @JsonKey(name: 'source_url') final String? sourceURL,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'updated_on') final String? updatedOn,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'version') final String? version,
      @JsonKey(name: 'names') final List<ConceptName?>? names}) = _$_Concept;

  factory _Concept.fromJson(Map<String, dynamic> json) = _$_Concept.fromJson;

  @override
  @JsonKey(name: 'concept_class')
  String? get conceptClass;
  @override
  @JsonKey(name: 'created_on')
  String? get createdOn;
  @override
  @JsonKey(name: 'datatype')
  String? get dataType;
  @override
  @JsonKey(name: 'descriptions')
  List<Description?>? get descriptions;
  @override
  @JsonKey(name: 'display_locale')
  String? get displayLocale;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(name: 'external_id')
  String? get externalID;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'is_latest_version')
  bool? get isLatestVersion;
  @override
  @JsonKey(name: 'locale')
  String? get locale;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'retired')
  bool? get retired;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'source')
  String? get source;
  @override
  @JsonKey(name: 'source_url')
  String? get sourceURL;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'updated_on')
  String? get updatedOn;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'version')
  String? get version;
  @override
  @JsonKey(name: 'names')
  List<ConceptName?>? get names;
  @override
  @JsonKey(ignore: true)
  _$$_ConceptCopyWith<_$_Concept> get copyWith =>
      throw _privateConstructorUsedError;
}

ConceptList _$ConceptListFromJson(Map<String, dynamic> json) {
  return _ConceptList.fromJson(json);
}

/// @nodoc
mixin _$ConceptList {
  @JsonKey(name: 'listConcepts')
  List<Concept?>? get listConcepts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConceptListCopyWith<ConceptList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptListCopyWith<$Res> {
  factory $ConceptListCopyWith(
          ConceptList value, $Res Function(ConceptList) then) =
      _$ConceptListCopyWithImpl<$Res, ConceptList>;
  @useResult
  $Res call({@JsonKey(name: 'listConcepts') List<Concept?>? listConcepts});
}

/// @nodoc
class _$ConceptListCopyWithImpl<$Res, $Val extends ConceptList>
    implements $ConceptListCopyWith<$Res> {
  _$ConceptListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listConcepts = freezed,
  }) {
    return _then(_value.copyWith(
      listConcepts: freezed == listConcepts
          ? _value.listConcepts
          : listConcepts // ignore: cast_nullable_to_non_nullable
              as List<Concept?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConceptListCopyWith<$Res>
    implements $ConceptListCopyWith<$Res> {
  factory _$$_ConceptListCopyWith(
          _$_ConceptList value, $Res Function(_$_ConceptList) then) =
      __$$_ConceptListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'listConcepts') List<Concept?>? listConcepts});
}

/// @nodoc
class __$$_ConceptListCopyWithImpl<$Res>
    extends _$ConceptListCopyWithImpl<$Res, _$_ConceptList>
    implements _$$_ConceptListCopyWith<$Res> {
  __$$_ConceptListCopyWithImpl(
      _$_ConceptList _value, $Res Function(_$_ConceptList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listConcepts = freezed,
  }) {
    return _then(_$_ConceptList(
      listConcepts: freezed == listConcepts
          ? _value._listConcepts
          : listConcepts // ignore: cast_nullable_to_non_nullable
              as List<Concept?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConceptList implements _ConceptList {
  _$_ConceptList(
      {@JsonKey(name: 'listConcepts') final List<Concept?>? listConcepts})
      : _listConcepts = listConcepts;

  factory _$_ConceptList.fromJson(Map<String, dynamic> json) =>
      _$$_ConceptListFromJson(json);

  final List<Concept?>? _listConcepts;
  @override
  @JsonKey(name: 'listConcepts')
  List<Concept?>? get listConcepts {
    final value = _listConcepts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConceptList(listConcepts: $listConcepts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConceptList &&
            const DeepCollectionEquality()
                .equals(other._listConcepts, _listConcepts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listConcepts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConceptListCopyWith<_$_ConceptList> get copyWith =>
      __$$_ConceptListCopyWithImpl<_$_ConceptList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConceptListToJson(
      this,
    );
  }
}

abstract class _ConceptList implements ConceptList {
  factory _ConceptList(
          {@JsonKey(name: 'listConcepts') final List<Concept?>? listConcepts}) =
      _$_ConceptList;

  factory _ConceptList.fromJson(Map<String, dynamic> json) =
      _$_ConceptList.fromJson;

  @override
  @JsonKey(name: 'listConcepts')
  List<Concept?>? get listConcepts;
  @override
  @JsonKey(ignore: true)
  _$$_ConceptListCopyWith<_$_ConceptList> get copyWith =>
      throw _privateConstructorUsedError;
}

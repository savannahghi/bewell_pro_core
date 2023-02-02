// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'communication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Communication _$CommunicationFromJson(Map<String, dynamic> json) {
  return _Communication.fromJson(json);
}

/// @nodoc
mixin _$Communication {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The ISO-639-1 alpha 2 code in lower case for the language, optionally
  ///  followed by a hyphen and the ISO-3166-1 alpha 2 code for the region
  ///  in upper case; e.g. "en" for English, or "en-US"
  ///  for American English versus "en-EN" for England English.
  @JsonKey(name: 'language')
  CodeableConcept? get language => throw _privateConstructorUsedError;

  /// Indicates whether or not the patient prefers this language
  ///  (over other languages he masters up a certain level).
  @JsonKey(name: 'preferred')
  bool? get preferred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunicationCopyWith<Communication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationCopyWith<$Res> {
  factory $CommunicationCopyWith(
          Communication value, $Res Function(Communication) then) =
      _$CommunicationCopyWithImpl<$Res, Communication>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'language') CodeableConcept? language,
      @JsonKey(name: 'preferred') bool? preferred});

  $CodeableConceptCopyWith<$Res>? get language;
}

/// @nodoc
class _$CommunicationCopyWithImpl<$Res, $Val extends Communication>
    implements $CommunicationCopyWith<$Res> {
  _$CommunicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? preferred = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      preferred: freezed == preferred
          ? _value.preferred
          : preferred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.language!, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommunicationCopyWith<$Res>
    implements $CommunicationCopyWith<$Res> {
  factory _$$_CommunicationCopyWith(
          _$_Communication value, $Res Function(_$_Communication) then) =
      __$$_CommunicationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'language') CodeableConcept? language,
      @JsonKey(name: 'preferred') bool? preferred});

  @override
  $CodeableConceptCopyWith<$Res>? get language;
}

/// @nodoc
class __$$_CommunicationCopyWithImpl<$Res>
    extends _$CommunicationCopyWithImpl<$Res, _$_Communication>
    implements _$$_CommunicationCopyWith<$Res> {
  __$$_CommunicationCopyWithImpl(
      _$_Communication _value, $Res Function(_$_Communication) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? preferred = freezed,
  }) {
    return _then(_$_Communication(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      preferred: freezed == preferred
          ? _value.preferred
          : preferred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Communication implements _Communication {
  _$_Communication(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'language') this.language,
      @JsonKey(name: 'preferred') this.preferred});

  factory _$_Communication.fromJson(Map<String, dynamic> json) =>
      _$$_CommunicationFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The ISO-639-1 alpha 2 code in lower case for the language, optionally
  ///  followed by a hyphen and the ISO-3166-1 alpha 2 code for the region
  ///  in upper case; e.g. "en" for English, or "en-US"
  ///  for American English versus "en-EN" for England English.
  @override
  @JsonKey(name: 'language')
  final CodeableConcept? language;

  /// Indicates whether or not the patient prefers this language
  ///  (over other languages he masters up a certain level).
  @override
  @JsonKey(name: 'preferred')
  final bool? preferred;

  @override
  String toString() {
    return 'Communication(id: $id, language: $language, preferred: $preferred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Communication &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.preferred, preferred) ||
                other.preferred == preferred));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, language, preferred);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommunicationCopyWith<_$_Communication> get copyWith =>
      __$$_CommunicationCopyWithImpl<_$_Communication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunicationToJson(
      this,
    );
  }
}

abstract class _Communication implements Communication {
  factory _Communication(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'language') final CodeableConcept? language,
      @JsonKey(name: 'preferred') final bool? preferred}) = _$_Communication;

  factory _Communication.fromJson(Map<String, dynamic> json) =
      _$_Communication.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The ISO-639-1 alpha 2 code in lower case for the language, optionally
  ///  followed by a hyphen and the ISO-3166-1 alpha 2 code for the region
  ///  in upper case; e.g. "en" for English, or "en-US"
  ///  for American English versus "en-EN" for England English.
  @JsonKey(name: 'language')
  CodeableConcept? get language;
  @override

  /// Indicates whether or not the patient prefers this language
  ///  (over other languages he masters up a certain level).
  @JsonKey(name: 'preferred')
  bool? get preferred;
  @override
  @JsonKey(ignore: true)
  _$$_CommunicationCopyWith<_$_Communication> get copyWith =>
      throw _privateConstructorUsedError;
}

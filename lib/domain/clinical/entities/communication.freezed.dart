// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'communication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Communication _$CommunicationFromJson(Map<String, dynamic> json) {
  return _Communication.fromJson(json);
}

/// @nodoc
class _$CommunicationTearOff {
  const _$CommunicationTearOff();

  _Communication call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'language') CodeableConcept? language,
      @JsonKey(name: 'preferred') bool? preferred}) {
    return _Communication(
      id: id,
      language: language,
      preferred: preferred,
    );
  }

  Communication fromJson(Map<String, Object> json) {
    return Communication.fromJson(json);
  }
}

/// @nodoc
const $Communication = _$CommunicationTearOff();

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
      _$CommunicationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'language') CodeableConcept? language,
      @JsonKey(name: 'preferred') bool? preferred});

  $CodeableConceptCopyWith<$Res>? get language;
}

/// @nodoc
class _$CommunicationCopyWithImpl<$Res>
    implements $CommunicationCopyWith<$Res> {
  _$CommunicationCopyWithImpl(this._value, this._then);

  final Communication _value;
  // ignore: unused_field
  final $Res Function(Communication) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? preferred = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      preferred: preferred == freezed
          ? _value.preferred
          : preferred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.language!, (value) {
      return _then(_value.copyWith(language: value));
    });
  }
}

/// @nodoc
abstract class _$CommunicationCopyWith<$Res>
    implements $CommunicationCopyWith<$Res> {
  factory _$CommunicationCopyWith(
          _Communication value, $Res Function(_Communication) then) =
      __$CommunicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'language') CodeableConcept? language,
      @JsonKey(name: 'preferred') bool? preferred});

  @override
  $CodeableConceptCopyWith<$Res>? get language;
}

/// @nodoc
class __$CommunicationCopyWithImpl<$Res>
    extends _$CommunicationCopyWithImpl<$Res>
    implements _$CommunicationCopyWith<$Res> {
  __$CommunicationCopyWithImpl(
      _Communication _value, $Res Function(_Communication) _then)
      : super(_value, (v) => _then(v as _Communication));

  @override
  _Communication get _value => super._value as _Communication;

  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? preferred = freezed,
  }) {
    return _then(_Communication(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      preferred: preferred == freezed
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
      _$_$_CommunicationFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The ISO-639-1 alpha 2 code in lower case for the language, optionally
  ///  followed by a hyphen and the ISO-3166-1 alpha 2 code for the region
  ///  in upper case; e.g. "en" for English, or "en-US"
  ///  for American English versus "en-EN" for England English.
  @JsonKey(name: 'language')
  final CodeableConcept? language;
  @override

  /// Indicates whether or not the patient prefers this language
  ///  (over other languages he masters up a certain level).
  @JsonKey(name: 'preferred')
  final bool? preferred;

  @override
  String toString() {
    return 'Communication(id: $id, language: $language, preferred: $preferred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Communication &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.preferred, preferred) ||
                const DeepCollectionEquality()
                    .equals(other.preferred, preferred)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(preferred);

  @JsonKey(ignore: true)
  @override
  _$CommunicationCopyWith<_Communication> get copyWith =>
      __$CommunicationCopyWithImpl<_Communication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommunicationToJson(this);
  }
}

abstract class _Communication implements Communication {
  factory _Communication(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'language') CodeableConcept? language,
      @JsonKey(name: 'preferred') bool? preferred}) = _$_Communication;

  factory _Communication.fromJson(Map<String, dynamic> json) =
      _$_Communication.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The ISO-639-1 alpha 2 code in lower case for the language, optionally
  ///  followed by a hyphen and the ISO-3166-1 alpha 2 code for the region
  ///  in upper case; e.g. "en" for English, or "en-US"
  ///  for American English versus "en-EN" for England English.
  @JsonKey(name: 'language')
  CodeableConcept? get language => throw _privateConstructorUsedError;
  @override

  /// Indicates whether or not the patient prefers this language
  ///  (over other languages he masters up a certain level).
  @JsonKey(name: 'preferred')
  bool? get preferred => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommunicationCopyWith<_Communication> get copyWith =>
      throw _privateConstructorUsedError;
}

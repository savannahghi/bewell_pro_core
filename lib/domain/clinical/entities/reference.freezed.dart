// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return _Reference.fromJson(json);
}

/// @nodoc
mixin _$Reference {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// A reference to a location at which the other resource is found.
  ///
  ///  The reference may be a relative reference, in which case it is
  ///  relative to the service base URL, or an absolute URL that resolves
  ///  to the location where the resource is found. The reference may be
  ///  version specific or not. If the reference is not to a FHIR RESTful
  ///  server, then it should be assumed to be version specific. Internal
  ///  fragment references (start with '#') refer to contained resources.
  @JsonKey(name: 'Reference')
  String? get reference => throw _privateConstructorUsedError;

  /// The expected type of the target of the reference. If both Reference.type
  ///  and Reference.reference are populated and Reference.reference is a
  ///  FHIR URL, both SHALL be consistent.
  ///
  /// The type is the Canonical URL of Resource Definition that is the type
  ///  this reference refers to. References are URLs that are relative to
  ///  http://hl7.org/fhir/StructureDefinition/ e.g. "Patient" is a
  ///  reference to http://hl7.org/fhir/StructureDefinition/Patient.
  ///  Absolute URLs are only allowed for logical models
  ///  (and can only be used in references in logical models, not resources).
  @JsonKey(name: 'Type')
  String? get type => throw _privateConstructorUsedError;

  /// An identifier for the target resource.
  ///  This is used when there is no way to reference the other resource directly,
  ///  either because the entity it represents is not available through a FHIR server,
  ///  or because there is no way for the author of the resource to convert a
  ///  known identifier to an actual location. There is no requirement that a
  ///  Reference.identifier point to something that is actually exposed as a FHIR
  ///  instance, but it SHALL point to a business concept that would be expected
  ///  to be exposed as a FHIR instance, and that instance would need to be of
  ///  a FHIR resource type allowed by the reference.
  @JsonKey(name: 'Identifier')
  Identifier? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Display')
  String? get display => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferenceCopyWith<Reference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferenceCopyWith<$Res> {
  factory $ReferenceCopyWith(Reference value, $Res Function(Reference) then) =
      _$ReferenceCopyWithImpl<$Res, Reference>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Reference') String? reference,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'Identifier') Identifier? identifier,
      @JsonKey(name: 'Display') String? display});

  $IdentifierCopyWith<$Res>? get identifier;
}

/// @nodoc
class _$ReferenceCopyWithImpl<$Res, $Val extends Reference>
    implements $ReferenceCopyWith<$Res> {
  _$ReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reference = freezed,
    Object? type = freezed,
    Object? identifier = freezed,
    Object? display = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentifierCopyWith<$Res>? get identifier {
    if (_value.identifier == null) {
      return null;
    }

    return $IdentifierCopyWith<$Res>(_value.identifier!, (value) {
      return _then(_value.copyWith(identifier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReferenceCopyWith<$Res> implements $ReferenceCopyWith<$Res> {
  factory _$$_ReferenceCopyWith(
          _$_Reference value, $Res Function(_$_Reference) then) =
      __$$_ReferenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Reference') String? reference,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'Identifier') Identifier? identifier,
      @JsonKey(name: 'Display') String? display});

  @override
  $IdentifierCopyWith<$Res>? get identifier;
}

/// @nodoc
class __$$_ReferenceCopyWithImpl<$Res>
    extends _$ReferenceCopyWithImpl<$Res, _$_Reference>
    implements _$$_ReferenceCopyWith<$Res> {
  __$$_ReferenceCopyWithImpl(
      _$_Reference _value, $Res Function(_$_Reference) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reference = freezed,
    Object? type = freezed,
    Object? identifier = freezed,
    Object? display = freezed,
  }) {
    return _then(_$_Reference(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reference implements _Reference {
  _$_Reference(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Reference') this.reference,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'Identifier') this.identifier,
      @JsonKey(name: 'Display') this.display});

  factory _$_Reference.fromJson(Map<String, dynamic> json) =>
      _$$_ReferenceFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// A reference to a location at which the other resource is found.
  ///
  ///  The reference may be a relative reference, in which case it is
  ///  relative to the service base URL, or an absolute URL that resolves
  ///  to the location where the resource is found. The reference may be
  ///  version specific or not. If the reference is not to a FHIR RESTful
  ///  server, then it should be assumed to be version specific. Internal
  ///  fragment references (start with '#') refer to contained resources.
  @override
  @JsonKey(name: 'Reference')
  final String? reference;

  /// The expected type of the target of the reference. If both Reference.type
  ///  and Reference.reference are populated and Reference.reference is a
  ///  FHIR URL, both SHALL be consistent.
  ///
  /// The type is the Canonical URL of Resource Definition that is the type
  ///  this reference refers to. References are URLs that are relative to
  ///  http://hl7.org/fhir/StructureDefinition/ e.g. "Patient" is a
  ///  reference to http://hl7.org/fhir/StructureDefinition/Patient.
  ///  Absolute URLs are only allowed for logical models
  ///  (and can only be used in references in logical models, not resources).
  @override
  @JsonKey(name: 'Type')
  final String? type;

  /// An identifier for the target resource.
  ///  This is used when there is no way to reference the other resource directly,
  ///  either because the entity it represents is not available through a FHIR server,
  ///  or because there is no way for the author of the resource to convert a
  ///  known identifier to an actual location. There is no requirement that a
  ///  Reference.identifier point to something that is actually exposed as a FHIR
  ///  instance, but it SHALL point to a business concept that would be expected
  ///  to be exposed as a FHIR instance, and that instance would need to be of
  ///  a FHIR resource type allowed by the reference.
  @override
  @JsonKey(name: 'Identifier')
  final Identifier? identifier;
  @override
  @JsonKey(name: 'Display')
  final String? display;

  @override
  String toString() {
    return 'Reference(id: $id, reference: $reference, type: $type, identifier: $identifier, display: $display)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reference &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.display, display) || other.display == display));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, reference, type, identifier, display);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReferenceCopyWith<_$_Reference> get copyWith =>
      __$$_ReferenceCopyWithImpl<_$_Reference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferenceToJson(
      this,
    );
  }
}

abstract class _Reference implements Reference {
  factory _Reference(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Reference') final String? reference,
      @JsonKey(name: 'Type') final String? type,
      @JsonKey(name: 'Identifier') final Identifier? identifier,
      @JsonKey(name: 'Display') final String? display}) = _$_Reference;

  factory _Reference.fromJson(Map<String, dynamic> json) =
      _$_Reference.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// A reference to a location at which the other resource is found.
  ///
  ///  The reference may be a relative reference, in which case it is
  ///  relative to the service base URL, or an absolute URL that resolves
  ///  to the location where the resource is found. The reference may be
  ///  version specific or not. If the reference is not to a FHIR RESTful
  ///  server, then it should be assumed to be version specific. Internal
  ///  fragment references (start with '#') refer to contained resources.
  @JsonKey(name: 'Reference')
  String? get reference;
  @override

  /// The expected type of the target of the reference. If both Reference.type
  ///  and Reference.reference are populated and Reference.reference is a
  ///  FHIR URL, both SHALL be consistent.
  ///
  /// The type is the Canonical URL of Resource Definition that is the type
  ///  this reference refers to. References are URLs that are relative to
  ///  http://hl7.org/fhir/StructureDefinition/ e.g. "Patient" is a
  ///  reference to http://hl7.org/fhir/StructureDefinition/Patient.
  ///  Absolute URLs are only allowed for logical models
  ///  (and can only be used in references in logical models, not resources).
  @JsonKey(name: 'Type')
  String? get type;
  @override

  /// An identifier for the target resource.
  ///  This is used when there is no way to reference the other resource directly,
  ///  either because the entity it represents is not available through a FHIR server,
  ///  or because there is no way for the author of the resource to convert a
  ///  known identifier to an actual location. There is no requirement that a
  ///  Reference.identifier point to something that is actually exposed as a FHIR
  ///  instance, but it SHALL point to a business concept that would be expected
  ///  to be exposed as a FHIR instance, and that instance would need to be of
  ///  a FHIR resource type allowed by the reference.
  @JsonKey(name: 'Identifier')
  Identifier? get identifier;
  @override
  @JsonKey(name: 'Display')
  String? get display;
  @override
  @JsonKey(ignore: true)
  _$$_ReferenceCopyWith<_$_Reference> get copyWith =>
      throw _privateConstructorUsedError;
}

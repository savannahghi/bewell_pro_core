// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'identification_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IdentificationDetailsTearOff {
  const _$IdentificationDetailsTearOff();

  _IdentificationDetails call(
      {required DocumentType documentType,
      required String documentNumber,
      List<PatientRegistrationImageData>? images}) {
    return _IdentificationDetails(
      documentType: documentType,
      documentNumber: documentNumber,
      images: images,
    );
  }
}

/// @nodoc
const $IdentificationDetails = _$IdentificationDetailsTearOff();

/// @nodoc
mixin _$IdentificationDetails {
  DocumentType get documentType => throw _privateConstructorUsedError;
  String get documentNumber => throw _privateConstructorUsedError;
  List<PatientRegistrationImageData>? get images =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IdentificationDetailsCopyWith<IdentificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentificationDetailsCopyWith<$Res> {
  factory $IdentificationDetailsCopyWith(IdentificationDetails value,
          $Res Function(IdentificationDetails) then) =
      _$IdentificationDetailsCopyWithImpl<$Res>;
  $Res call(
      {DocumentType documentType,
      String documentNumber,
      List<PatientRegistrationImageData>? images});
}

/// @nodoc
class _$IdentificationDetailsCopyWithImpl<$Res>
    implements $IdentificationDetailsCopyWith<$Res> {
  _$IdentificationDetailsCopyWithImpl(this._value, this._then);

  final IdentificationDetails _value;
  // ignore: unused_field
  final $Res Function(IdentificationDetails) _then;

  @override
  $Res call({
    Object? documentType = freezed,
    Object? documentNumber = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      documentType: documentType == freezed
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      documentNumber: documentNumber == freezed
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PatientRegistrationImageData>?,
    ));
  }
}

/// @nodoc
abstract class _$IdentificationDetailsCopyWith<$Res>
    implements $IdentificationDetailsCopyWith<$Res> {
  factory _$IdentificationDetailsCopyWith(_IdentificationDetails value,
          $Res Function(_IdentificationDetails) then) =
      __$IdentificationDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {DocumentType documentType,
      String documentNumber,
      List<PatientRegistrationImageData>? images});
}

/// @nodoc
class __$IdentificationDetailsCopyWithImpl<$Res>
    extends _$IdentificationDetailsCopyWithImpl<$Res>
    implements _$IdentificationDetailsCopyWith<$Res> {
  __$IdentificationDetailsCopyWithImpl(_IdentificationDetails _value,
      $Res Function(_IdentificationDetails) _then)
      : super(_value, (v) => _then(v as _IdentificationDetails));

  @override
  _IdentificationDetails get _value => super._value as _IdentificationDetails;

  @override
  $Res call({
    Object? documentType = freezed,
    Object? documentNumber = freezed,
    Object? images = freezed,
  }) {
    return _then(_IdentificationDetails(
      documentType: documentType == freezed
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      documentNumber: documentNumber == freezed
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PatientRegistrationImageData>?,
    ));
  }
}

/// @nodoc

class _$_IdentificationDetails implements _IdentificationDetails {
  const _$_IdentificationDetails(
      {required this.documentType, required this.documentNumber, this.images});

  @override
  final DocumentType documentType;
  @override
  final String documentNumber;
  @override
  final List<PatientRegistrationImageData>? images;

  @override
  String toString() {
    return 'IdentificationDetails(documentType: $documentType, documentNumber: $documentNumber, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IdentificationDetails &&
            (identical(other.documentType, documentType) ||
                const DeepCollectionEquality()
                    .equals(other.documentType, documentType)) &&
            (identical(other.documentNumber, documentNumber) ||
                const DeepCollectionEquality()
                    .equals(other.documentNumber, documentNumber)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(documentType) ^
      const DeepCollectionEquality().hash(documentNumber) ^
      const DeepCollectionEquality().hash(images);

  @JsonKey(ignore: true)
  @override
  _$IdentificationDetailsCopyWith<_IdentificationDetails> get copyWith =>
      __$IdentificationDetailsCopyWithImpl<_IdentificationDetails>(
          this, _$identity);
}

abstract class _IdentificationDetails implements IdentificationDetails {
  const factory _IdentificationDetails(
      {required DocumentType documentType,
      required String documentNumber,
      List<PatientRegistrationImageData>? images}) = _$_IdentificationDetails;

  @override
  DocumentType get documentType => throw _privateConstructorUsedError;
  @override
  String get documentNumber => throw _privateConstructorUsedError;
  @override
  List<PatientRegistrationImageData>? get images =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IdentificationDetailsCopyWith<_IdentificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'identification_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$IdentificationDetailsCopyWithImpl<$Res, IdentificationDetails>;
  @useResult
  $Res call(
      {DocumentType documentType,
      String documentNumber,
      List<PatientRegistrationImageData>? images});
}

/// @nodoc
class _$IdentificationDetailsCopyWithImpl<$Res,
        $Val extends IdentificationDetails>
    implements $IdentificationDetailsCopyWith<$Res> {
  _$IdentificationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? documentNumber = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      documentNumber: null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PatientRegistrationImageData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdentificationDetailsCopyWith<$Res>
    implements $IdentificationDetailsCopyWith<$Res> {
  factory _$$_IdentificationDetailsCopyWith(_$_IdentificationDetails value,
          $Res Function(_$_IdentificationDetails) then) =
      __$$_IdentificationDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DocumentType documentType,
      String documentNumber,
      List<PatientRegistrationImageData>? images});
}

/// @nodoc
class __$$_IdentificationDetailsCopyWithImpl<$Res>
    extends _$IdentificationDetailsCopyWithImpl<$Res, _$_IdentificationDetails>
    implements _$$_IdentificationDetailsCopyWith<$Res> {
  __$$_IdentificationDetailsCopyWithImpl(_$_IdentificationDetails _value,
      $Res Function(_$_IdentificationDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? documentNumber = null,
    Object? images = freezed,
  }) {
    return _then(_$_IdentificationDetails(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      documentNumber: null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PatientRegistrationImageData>?,
    ));
  }
}

/// @nodoc

class _$_IdentificationDetails implements _IdentificationDetails {
  const _$_IdentificationDetails(
      {required this.documentType,
      required this.documentNumber,
      final List<PatientRegistrationImageData>? images})
      : _images = images;

  @override
  final DocumentType documentType;
  @override
  final String documentNumber;
  final List<PatientRegistrationImageData>? _images;
  @override
  List<PatientRegistrationImageData>? get images {
    final value = _images;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IdentificationDetails(documentType: $documentType, documentNumber: $documentNumber, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdentificationDetails &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentNumber, documentNumber) ||
                other.documentNumber == documentNumber) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentType, documentNumber,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdentificationDetailsCopyWith<_$_IdentificationDetails> get copyWith =>
      __$$_IdentificationDetailsCopyWithImpl<_$_IdentificationDetails>(
          this, _$identity);
}

abstract class _IdentificationDetails implements IdentificationDetails {
  const factory _IdentificationDetails(
          {required final DocumentType documentType,
          required final String documentNumber,
          final List<PatientRegistrationImageData>? images}) =
      _$_IdentificationDetails;

  @override
  DocumentType get documentType;
  @override
  String get documentNumber;
  @override
  List<PatientRegistrationImageData>? get images;
  @override
  @JsonKey(ignore: true)
  _$$_IdentificationDetailsCopyWith<_$_IdentificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

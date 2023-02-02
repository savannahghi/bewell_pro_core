// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'codeable_concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CodeableConcept _$CodeableConceptFromJson(Map<String, dynamic> json) {
  return _CodeableConcept.fromJson(json);
}

/// @nodoc
mixin _$CodeableConcept {
  /// Unique id for the element within a resource (for internal references).
  ///  This may be any string value that does not contain spaces.
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// A reference to a code defined by a terminology system.
  @JsonKey(name: 'Coding')
  List<Coding?>? get coding => throw _privateConstructorUsedError;

  /// A human language representation of the concept as seen/selected/uttered
  ///  by the user who entered the data and/or which represents the intended
  ///  meaning of the user.
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeableConceptCopyWith<CodeableConcept> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeableConceptCopyWith<$Res> {
  factory $CodeableConceptCopyWith(
          CodeableConcept value, $Res Function(CodeableConcept) then) =
      _$CodeableConceptCopyWithImpl<$Res, CodeableConcept>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Coding') List<Coding?>? coding,
      @JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$CodeableConceptCopyWithImpl<$Res, $Val extends CodeableConcept>
    implements $CodeableConceptCopyWith<$Res> {
  _$CodeableConceptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? coding = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      coding: freezed == coding
          ? _value.coding
          : coding // ignore: cast_nullable_to_non_nullable
              as List<Coding?>?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CodeableConceptCopyWith<$Res>
    implements $CodeableConceptCopyWith<$Res> {
  factory _$$_CodeableConceptCopyWith(
          _$_CodeableConcept value, $Res Function(_$_CodeableConcept) then) =
      __$$_CodeableConceptCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Coding') List<Coding?>? coding,
      @JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$$_CodeableConceptCopyWithImpl<$Res>
    extends _$CodeableConceptCopyWithImpl<$Res, _$_CodeableConcept>
    implements _$$_CodeableConceptCopyWith<$Res> {
  __$$_CodeableConceptCopyWithImpl(
      _$_CodeableConcept _value, $Res Function(_$_CodeableConcept) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? coding = freezed,
    Object? text = freezed,
  }) {
    return _then(_$_CodeableConcept(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      coding: freezed == coding
          ? _value._coding
          : coding // ignore: cast_nullable_to_non_nullable
              as List<Coding?>?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CodeableConcept implements _CodeableConcept {
  _$_CodeableConcept(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Coding') final List<Coding?>? coding,
      @JsonKey(name: 'Text') this.text})
      : _coding = coding;

  factory _$_CodeableConcept.fromJson(Map<String, dynamic> json) =>
      _$$_CodeableConceptFromJson(json);

  /// Unique id for the element within a resource (for internal references).
  ///  This may be any string value that does not contain spaces.
  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// A reference to a code defined by a terminology system.
  final List<Coding?>? _coding;

  /// A reference to a code defined by a terminology system.
  @override
  @JsonKey(name: 'Coding')
  List<Coding?>? get coding {
    final value = _coding;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A human language representation of the concept as seen/selected/uttered
  ///  by the user who entered the data and/or which represents the intended
  ///  meaning of the user.
  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'CodeableConcept(id: $id, coding: $coding, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeableConcept &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._coding, _coding) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_coding), text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodeableConceptCopyWith<_$_CodeableConcept> get copyWith =>
      __$$_CodeableConceptCopyWithImpl<_$_CodeableConcept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CodeableConceptToJson(
      this,
    );
  }
}

abstract class _CodeableConcept implements CodeableConcept {
  factory _CodeableConcept(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Coding') final List<Coding?>? coding,
      @JsonKey(name: 'Text') final String? text}) = _$_CodeableConcept;

  factory _CodeableConcept.fromJson(Map<String, dynamic> json) =
      _$_CodeableConcept.fromJson;

  @override

  /// Unique id for the element within a resource (for internal references).
  ///  This may be any string value that does not contain spaces.
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// A reference to a code defined by a terminology system.
  @JsonKey(name: 'Coding')
  List<Coding?>? get coding;
  @override

  /// A human language representation of the concept as seen/selected/uttered
  ///  by the user who entered the data and/or which represents the intended
  ///  meaning of the user.
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_CodeableConceptCopyWith<_$_CodeableConcept> get copyWith =>
      throw _privateConstructorUsedError;
}

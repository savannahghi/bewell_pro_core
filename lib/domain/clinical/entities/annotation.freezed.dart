// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Annotation _$AnnotationFromJson(Map<String, dynamic> json) {
  return _Annotation.fromJson(json);
}

/// @nodoc
class _$AnnotationTearOff {
  const _$AnnotationTearOff();

  _Annotation call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'AuthorReference') Reference? authorReference,
      @JsonKey(name: 'AuthorString') String? authorString,
      @JsonKey(name: 'Time') DateTime? time,
      @JsonKey(name: 'Text') String? text}) {
    return _Annotation(
      id: id,
      authorReference: authorReference,
      authorString: authorString,
      time: time,
      text: text,
    );
  }

  Annotation fromJson(Map<String, Object> json) {
    return Annotation.fromJson(json);
  }
}

/// @nodoc
const $Annotation = _$AnnotationTearOff();

/// @nodoc
mixin _$Annotation {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The individual responsible for making the annotation.
  @JsonKey(name: 'AuthorReference')
  Reference? get authorReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'AuthorString')
  String? get authorString => throw _privateConstructorUsedError;
  @JsonKey(name: 'Time')
  DateTime? get time => throw _privateConstructorUsedError;

  /// The text of the annotation in markdown format.
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnotationCopyWith<Annotation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnotationCopyWith<$Res> {
  factory $AnnotationCopyWith(
          Annotation value, $Res Function(Annotation) then) =
      _$AnnotationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'AuthorReference') Reference? authorReference,
      @JsonKey(name: 'AuthorString') String? authorString,
      @JsonKey(name: 'Time') DateTime? time,
      @JsonKey(name: 'Text') String? text});

  $ReferenceCopyWith<$Res>? get authorReference;
}

/// @nodoc
class _$AnnotationCopyWithImpl<$Res> implements $AnnotationCopyWith<$Res> {
  _$AnnotationCopyWithImpl(this._value, this._then);

  final Annotation _value;
  // ignore: unused_field
  final $Res Function(Annotation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorReference = freezed,
    Object? authorString = freezed,
    Object? time = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorReference: authorReference == freezed
          ? _value.authorReference
          : authorReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      authorString: authorString == freezed
          ? _value.authorString
          : authorString // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ReferenceCopyWith<$Res>? get authorReference {
    if (_value.authorReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.authorReference!, (value) {
      return _then(_value.copyWith(authorReference: value));
    });
  }
}

/// @nodoc
abstract class _$AnnotationCopyWith<$Res> implements $AnnotationCopyWith<$Res> {
  factory _$AnnotationCopyWith(
          _Annotation value, $Res Function(_Annotation) then) =
      __$AnnotationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'AuthorReference') Reference? authorReference,
      @JsonKey(name: 'AuthorString') String? authorString,
      @JsonKey(name: 'Time') DateTime? time,
      @JsonKey(name: 'Text') String? text});

  @override
  $ReferenceCopyWith<$Res>? get authorReference;
}

/// @nodoc
class __$AnnotationCopyWithImpl<$Res> extends _$AnnotationCopyWithImpl<$Res>
    implements _$AnnotationCopyWith<$Res> {
  __$AnnotationCopyWithImpl(
      _Annotation _value, $Res Function(_Annotation) _then)
      : super(_value, (v) => _then(v as _Annotation));

  @override
  _Annotation get _value => super._value as _Annotation;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorReference = freezed,
    Object? authorString = freezed,
    Object? time = freezed,
    Object? text = freezed,
  }) {
    return _then(_Annotation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorReference: authorReference == freezed
          ? _value.authorReference
          : authorReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      authorString: authorString == freezed
          ? _value.authorString
          : authorString // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Annotation implements _Annotation {
  _$_Annotation(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'AuthorReference') this.authorReference,
      @JsonKey(name: 'AuthorString') this.authorString,
      @JsonKey(name: 'Time') this.time,
      @JsonKey(name: 'Text') this.text});

  factory _$_Annotation.fromJson(Map<String, dynamic> json) =>
      _$_$_AnnotationFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The individual responsible for making the annotation.
  @JsonKey(name: 'AuthorReference')
  final Reference? authorReference;
  @override
  @JsonKey(name: 'AuthorString')
  final String? authorString;
  @override
  @JsonKey(name: 'Time')
  final DateTime? time;
  @override

  /// The text of the annotation in markdown format.
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'Annotation(id: $id, authorReference: $authorReference, authorString: $authorString, time: $time, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Annotation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.authorReference, authorReference) ||
                const DeepCollectionEquality()
                    .equals(other.authorReference, authorReference)) &&
            (identical(other.authorString, authorString) ||
                const DeepCollectionEquality()
                    .equals(other.authorString, authorString)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(authorReference) ^
      const DeepCollectionEquality().hash(authorString) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$AnnotationCopyWith<_Annotation> get copyWith =>
      __$AnnotationCopyWithImpl<_Annotation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AnnotationToJson(this);
  }
}

abstract class _Annotation implements Annotation {
  factory _Annotation(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'AuthorReference') Reference? authorReference,
      @JsonKey(name: 'AuthorString') String? authorString,
      @JsonKey(name: 'Time') DateTime? time,
      @JsonKey(name: 'Text') String? text}) = _$_Annotation;

  factory _Annotation.fromJson(Map<String, dynamic> json) =
      _$_Annotation.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The individual responsible for making the annotation.
  @JsonKey(name: 'AuthorReference')
  Reference? get authorReference => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AuthorString')
  String? get authorString => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Time')
  DateTime? get time => throw _privateConstructorUsedError;
  @override

  /// The text of the annotation in markdown format.
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnnotationCopyWith<_Annotation> get copyWith =>
      throw _privateConstructorUsedError;
}

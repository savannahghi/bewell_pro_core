// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Annotation _$AnnotationFromJson(Map<String, dynamic> json) {
  return _Annotation.fromJson(json);
}

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
      _$AnnotationCopyWithImpl<$Res, Annotation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'AuthorReference') Reference? authorReference,
      @JsonKey(name: 'AuthorString') String? authorString,
      @JsonKey(name: 'Time') DateTime? time,
      @JsonKey(name: 'Text') String? text});

  $ReferenceCopyWith<$Res>? get authorReference;
}

/// @nodoc
class _$AnnotationCopyWithImpl<$Res, $Val extends Annotation>
    implements $AnnotationCopyWith<$Res> {
  _$AnnotationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? authorReference = freezed,
    Object? authorString = freezed,
    Object? time = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorReference: freezed == authorReference
          ? _value.authorReference
          : authorReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      authorString: freezed == authorString
          ? _value.authorString
          : authorString // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get authorReference {
    if (_value.authorReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.authorReference!, (value) {
      return _then(_value.copyWith(authorReference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnnotationCopyWith<$Res>
    implements $AnnotationCopyWith<$Res> {
  factory _$$_AnnotationCopyWith(
          _$_Annotation value, $Res Function(_$_Annotation) then) =
      __$$_AnnotationCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_AnnotationCopyWithImpl<$Res>
    extends _$AnnotationCopyWithImpl<$Res, _$_Annotation>
    implements _$$_AnnotationCopyWith<$Res> {
  __$$_AnnotationCopyWithImpl(
      _$_Annotation _value, $Res Function(_$_Annotation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? authorReference = freezed,
    Object? authorString = freezed,
    Object? time = freezed,
    Object? text = freezed,
  }) {
    return _then(_$_Annotation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      authorReference: freezed == authorReference
          ? _value.authorReference
          : authorReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      authorString: freezed == authorString
          ? _value.authorString
          : authorString // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      text: freezed == text
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
      _$$_AnnotationFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The individual responsible for making the annotation.
  @override
  @JsonKey(name: 'AuthorReference')
  final Reference? authorReference;
  @override
  @JsonKey(name: 'AuthorString')
  final String? authorString;
  @override
  @JsonKey(name: 'Time')
  final DateTime? time;

  /// The text of the annotation in markdown format.
  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'Annotation(id: $id, authorReference: $authorReference, authorString: $authorString, time: $time, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Annotation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorReference, authorReference) ||
                other.authorReference == authorReference) &&
            (identical(other.authorString, authorString) ||
                other.authorString == authorString) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, authorReference, authorString, time, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnotationCopyWith<_$_Annotation> get copyWith =>
      __$$_AnnotationCopyWithImpl<_$_Annotation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnotationToJson(
      this,
    );
  }
}

abstract class _Annotation implements Annotation {
  factory _Annotation(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'AuthorReference') final Reference? authorReference,
      @JsonKey(name: 'AuthorString') final String? authorString,
      @JsonKey(name: 'Time') final DateTime? time,
      @JsonKey(name: 'Text') final String? text}) = _$_Annotation;

  factory _Annotation.fromJson(Map<String, dynamic> json) =
      _$_Annotation.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The individual responsible for making the annotation.
  @JsonKey(name: 'AuthorReference')
  Reference? get authorReference;
  @override
  @JsonKey(name: 'AuthorString')
  String? get authorString;
  @override
  @JsonKey(name: 'Time')
  DateTime? get time;
  @override

  /// The text of the annotation in markdown format.
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_AnnotationCopyWith<_$_Annotation> get copyWith =>
      throw _privateConstructorUsedError;
}

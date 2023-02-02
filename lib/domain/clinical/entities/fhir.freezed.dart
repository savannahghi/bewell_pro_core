// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fhir.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attester _$AttesterFromJson(Map<String, dynamic> json) {
  return _Attester.fromJson(json);
}

/// @nodoc
mixin _$Attester {
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mode')
  CompositionAttesterModeEnum? get mode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttesterCopyWith<Attester> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttesterCopyWith<$Res> {
  factory $AttesterCopyWith(Attester value, $Res Function(Attester) then) =
      _$AttesterCopyWithImpl<$Res, Attester>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode});

  $CodeableConceptCopyWith<$Res>? get id;
}

/// @nodoc
class _$AttesterCopyWithImpl<$Res, $Val extends Attester>
    implements $AttesterCopyWith<$Res> {
  _$AttesterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as CompositionAttesterModeEnum?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttesterCopyWith<$Res> implements $AttesterCopyWith<$Res> {
  factory _$$_AttesterCopyWith(
          _$_Attester value, $Res Function(_$_Attester) then) =
      __$$_AttesterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode});

  @override
  $CodeableConceptCopyWith<$Res>? get id;
}

/// @nodoc
class __$$_AttesterCopyWithImpl<$Res>
    extends _$AttesterCopyWithImpl<$Res, _$_Attester>
    implements _$$_AttesterCopyWith<$Res> {
  __$$_AttesterCopyWithImpl(
      _$_Attester _value, $Res Function(_$_Attester) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mode = freezed,
  }) {
    return _then(_$_Attester(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as CompositionAttesterModeEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Attester implements _Attester {
  _$_Attester({@JsonKey(name: 'ID') this.id, @JsonKey(name: 'Mode') this.mode});

  factory _$_Attester.fromJson(Map<String, dynamic> json) =>
      _$$_AttesterFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final CodeableConcept? id;
  @override
  @JsonKey(name: 'Mode')
  final CompositionAttesterModeEnum? mode;

  @override
  String toString() {
    return 'Attester(id: $id, mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attester &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttesterCopyWith<_$_Attester> get copyWith =>
      __$$_AttesterCopyWithImpl<_$_Attester>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttesterToJson(
      this,
    );
  }
}

abstract class _Attester implements Attester {
  factory _Attester(
          {@JsonKey(name: 'ID') final CodeableConcept? id,
          @JsonKey(name: 'Mode') final CompositionAttesterModeEnum? mode}) =
      _$_Attester;

  factory _Attester.fromJson(Map<String, dynamic> json) = _$_Attester.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id;
  @override
  @JsonKey(name: 'Mode')
  CompositionAttesterModeEnum? get mode;
  @override
  @JsonKey(ignore: true)
  _$$_AttesterCopyWith<_$_Attester> get copyWith =>
      throw _privateConstructorUsedError;
}

RelatesTo _$RelatesToFromJson(Map<String, dynamic> json) {
  return _RelatesTo.fromJson(json);
}

/// @nodoc
mixin _$RelatesTo {
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'TargetIdentifier')
  Identifier? get targetIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'TargetReference')
  Reference? get targetReference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelatesToCopyWith<RelatesTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatesToCopyWith<$Res> {
  factory $RelatesToCopyWith(RelatesTo value, $Res Function(RelatesTo) then) =
      _$RelatesToCopyWithImpl<$Res, RelatesTo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'TargetIdentifier') Identifier? targetIdentifier,
      @JsonKey(name: 'TargetReference') Reference? targetReference});

  $CodeableConceptCopyWith<$Res>? get id;
  $IdentifierCopyWith<$Res>? get targetIdentifier;
  $ReferenceCopyWith<$Res>? get targetReference;
}

/// @nodoc
class _$RelatesToCopyWithImpl<$Res, $Val extends RelatesTo>
    implements $RelatesToCopyWith<$Res> {
  _$RelatesToCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? targetReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: freezed == targetIdentifier
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      targetReference: freezed == targetReference
          ? _value.targetReference
          : targetReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentifierCopyWith<$Res>? get targetIdentifier {
    if (_value.targetIdentifier == null) {
      return null;
    }

    return $IdentifierCopyWith<$Res>(_value.targetIdentifier!, (value) {
      return _then(_value.copyWith(targetIdentifier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get targetReference {
    if (_value.targetReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.targetReference!, (value) {
      return _then(_value.copyWith(targetReference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RelatesToCopyWith<$Res> implements $RelatesToCopyWith<$Res> {
  factory _$$_RelatesToCopyWith(
          _$_RelatesTo value, $Res Function(_$_RelatesTo) then) =
      __$$_RelatesToCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'TargetIdentifier') Identifier? targetIdentifier,
      @JsonKey(name: 'TargetReference') Reference? targetReference});

  @override
  $CodeableConceptCopyWith<$Res>? get id;
  @override
  $IdentifierCopyWith<$Res>? get targetIdentifier;
  @override
  $ReferenceCopyWith<$Res>? get targetReference;
}

/// @nodoc
class __$$_RelatesToCopyWithImpl<$Res>
    extends _$RelatesToCopyWithImpl<$Res, _$_RelatesTo>
    implements _$$_RelatesToCopyWith<$Res> {
  __$$_RelatesToCopyWithImpl(
      _$_RelatesTo _value, $Res Function(_$_RelatesTo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? targetReference = freezed,
  }) {
    return _then(_$_RelatesTo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: freezed == targetIdentifier
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      targetReference: freezed == targetReference
          ? _value.targetReference
          : targetReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RelatesTo implements _RelatesTo {
  _$_RelatesTo(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'TargetIdentifier') this.targetIdentifier,
      @JsonKey(name: 'TargetReference') this.targetReference});

  factory _$_RelatesTo.fromJson(Map<String, dynamic> json) =>
      _$$_RelatesToFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final CodeableConcept? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'TargetIdentifier')
  final Identifier? targetIdentifier;
  @override
  @JsonKey(name: 'TargetReference')
  final Reference? targetReference;

  @override
  String toString() {
    return 'RelatesTo(id: $id, code: $code, targetIdentifier: $targetIdentifier, targetReference: $targetReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelatesTo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.targetIdentifier, targetIdentifier) ||
                other.targetIdentifier == targetIdentifier) &&
            (identical(other.targetReference, targetReference) ||
                other.targetReference == targetReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, targetIdentifier, targetReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RelatesToCopyWith<_$_RelatesTo> get copyWith =>
      __$$_RelatesToCopyWithImpl<_$_RelatesTo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelatesToToJson(
      this,
    );
  }
}

abstract class _RelatesTo implements RelatesTo {
  factory _RelatesTo(
          {@JsonKey(name: 'ID') final CodeableConcept? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'TargetIdentifier') final Identifier? targetIdentifier,
          @JsonKey(name: 'TargetReference') final Reference? targetReference}) =
      _$_RelatesTo;

  factory _RelatesTo.fromJson(Map<String, dynamic> json) =
      _$_RelatesTo.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'TargetIdentifier')
  Identifier? get targetIdentifier;
  @override
  @JsonKey(name: 'TargetReference')
  Reference? get targetReference;
  @override
  @JsonKey(ignore: true)
  _$$_RelatesToCopyWith<_$_RelatesTo> get copyWith =>
      throw _privateConstructorUsedError;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Period')
  Period? get targetIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Period') Period? targetIdentifier,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  $CodeableConceptCopyWith<$Res>? get id;
  $PeriodCopyWith<$Res>? get targetIdentifier;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: freezed == targetIdentifier
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Period?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get targetIdentifier {
    if (_value.targetIdentifier == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.targetIdentifier!, (value) {
      return _then(_value.copyWith(targetIdentifier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Period') Period? targetIdentifier,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  @override
  $CodeableConceptCopyWith<$Res>? get id;
  @override
  $PeriodCopyWith<$Res>? get targetIdentifier;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_Event(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: freezed == targetIdentifier
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Period?,
      detail: freezed == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Period') this.targetIdentifier,
      @JsonKey(name: 'Detail') final List<Reference?>? detail})
      : _detail = detail;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final CodeableConcept? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Period')
  final Period? targetIdentifier;
  final List<Reference?>? _detail;
  @override
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail {
    final value = _detail;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Event(id: $id, code: $code, targetIdentifier: $targetIdentifier, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.targetIdentifier, targetIdentifier) ||
                other.targetIdentifier == targetIdentifier) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, targetIdentifier,
      const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {@JsonKey(name: 'ID') final CodeableConcept? id,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'Period') final Period? targetIdentifier,
      @JsonKey(name: 'Detail') final List<Reference?>? detail}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Period')
  Period? get targetIdentifier;
  @override
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}

Section _$SectionFromJson(Map<String, dynamic> json) {
  return _Section.fromJson(json);
}

/// @nodoc
mixin _$Section {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Author')
  List<Reference?>? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'Focus')
  Reference? get focus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mode')
  String? get mode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderedBy')
  CodeableConcept? get orderedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Entry')
  List<Reference?>? get entry => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmptyReason')
  Reference? get emptyReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Section')
  List<Section?>? get section => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SectionCopyWith<Section> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionCopyWith<$Res> {
  factory $SectionCopyWith(Section value, $Res Function(Section) then) =
      _$SectionCopyWithImpl<$Res, Section>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Author') List<Reference?>? author,
      @JsonKey(name: 'Focus') Reference? focus,
      @JsonKey(name: 'Text') Narrative? text,
      @JsonKey(name: 'Mode') String? mode,
      @JsonKey(name: 'OrderedBy') CodeableConcept? orderedBy,
      @JsonKey(name: 'Entry') List<Reference?>? entry,
      @JsonKey(name: 'EmptyReason') Reference? emptyReason,
      @JsonKey(name: 'Section') List<Section?>? section});

  $ReferenceCopyWith<$Res>? get focus;
  $NarrativeCopyWith<$Res>? get text;
  $CodeableConceptCopyWith<$Res>? get orderedBy;
  $ReferenceCopyWith<$Res>? get emptyReason;
}

/// @nodoc
class _$SectionCopyWithImpl<$Res, $Val extends Section>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? code = freezed,
    Object? author = freezed,
    Object? focus = freezed,
    Object? text = freezed,
    Object? mode = freezed,
    Object? orderedBy = freezed,
    Object? entry = freezed,
    Object? emptyReason = freezed,
    Object? section = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      focus: freezed == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as Reference?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedBy: freezed == orderedBy
          ? _value.orderedBy
          : orderedBy // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      emptyReason: freezed == emptyReason
          ? _value.emptyReason
          : emptyReason // ignore: cast_nullable_to_non_nullable
              as Reference?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as List<Section?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get focus {
    if (_value.focus == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.focus!, (value) {
      return _then(_value.copyWith(focus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NarrativeCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $NarrativeCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get orderedBy {
    if (_value.orderedBy == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.orderedBy!, (value) {
      return _then(_value.copyWith(orderedBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get emptyReason {
    if (_value.emptyReason == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.emptyReason!, (value) {
      return _then(_value.copyWith(emptyReason: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SectionCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$$_SectionCopyWith(
          _$_Section value, $Res Function(_$_Section) then) =
      __$$_SectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Author') List<Reference?>? author,
      @JsonKey(name: 'Focus') Reference? focus,
      @JsonKey(name: 'Text') Narrative? text,
      @JsonKey(name: 'Mode') String? mode,
      @JsonKey(name: 'OrderedBy') CodeableConcept? orderedBy,
      @JsonKey(name: 'Entry') List<Reference?>? entry,
      @JsonKey(name: 'EmptyReason') Reference? emptyReason,
      @JsonKey(name: 'Section') List<Section?>? section});

  @override
  $ReferenceCopyWith<$Res>? get focus;
  @override
  $NarrativeCopyWith<$Res>? get text;
  @override
  $CodeableConceptCopyWith<$Res>? get orderedBy;
  @override
  $ReferenceCopyWith<$Res>? get emptyReason;
}

/// @nodoc
class __$$_SectionCopyWithImpl<$Res>
    extends _$SectionCopyWithImpl<$Res, _$_Section>
    implements _$$_SectionCopyWith<$Res> {
  __$$_SectionCopyWithImpl(_$_Section _value, $Res Function(_$_Section) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? code = freezed,
    Object? author = freezed,
    Object? focus = freezed,
    Object? text = freezed,
    Object? mode = freezed,
    Object? orderedBy = freezed,
    Object? entry = freezed,
    Object? emptyReason = freezed,
    Object? section = freezed,
  }) {
    return _then(_$_Section(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      focus: freezed == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as Reference?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedBy: freezed == orderedBy
          ? _value.orderedBy
          : orderedBy // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      entry: freezed == entry
          ? _value._entry
          : entry // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      emptyReason: freezed == emptyReason
          ? _value.emptyReason
          : emptyReason // ignore: cast_nullable_to_non_nullable
              as Reference?,
      section: freezed == section
          ? _value._section
          : section // ignore: cast_nullable_to_non_nullable
              as List<Section?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Section implements _Section {
  _$_Section(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Author') final List<Reference?>? author,
      @JsonKey(name: 'Focus') this.focus,
      @JsonKey(name: 'Text') this.text,
      @JsonKey(name: 'Mode') this.mode,
      @JsonKey(name: 'OrderedBy') this.orderedBy,
      @JsonKey(name: 'Entry') final List<Reference?>? entry,
      @JsonKey(name: 'EmptyReason') this.emptyReason,
      @JsonKey(name: 'Section') final List<Section?>? section})
      : _author = author,
        _entry = entry,
        _section = section;

  factory _$_Section.fromJson(Map<String, dynamic> json) =>
      _$$_SectionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  final List<Reference?>? _author;
  @override
  @JsonKey(name: 'Author')
  List<Reference?>? get author {
    final value = _author;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Focus')
  final Reference? focus;
  @override
  @JsonKey(name: 'Text')
  final Narrative? text;
  @override
  @JsonKey(name: 'Mode')
  final String? mode;
  @override
  @JsonKey(name: 'OrderedBy')
  final CodeableConcept? orderedBy;
  final List<Reference?>? _entry;
  @override
  @JsonKey(name: 'Entry')
  List<Reference?>? get entry {
    final value = _entry;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'EmptyReason')
  final Reference? emptyReason;
  final List<Section?>? _section;
  @override
  @JsonKey(name: 'Section')
  List<Section?>? get section {
    final value = _section;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Section(id: $id, title: $title, code: $code, author: $author, focus: $focus, text: $text, mode: $mode, orderedBy: $orderedBy, entry: $entry, emptyReason: $emptyReason, section: $section)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Section &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.orderedBy, orderedBy) ||
                other.orderedBy == orderedBy) &&
            const DeepCollectionEquality().equals(other._entry, _entry) &&
            (identical(other.emptyReason, emptyReason) ||
                other.emptyReason == emptyReason) &&
            const DeepCollectionEquality().equals(other._section, _section));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      code,
      const DeepCollectionEquality().hash(_author),
      focus,
      text,
      mode,
      orderedBy,
      const DeepCollectionEquality().hash(_entry),
      emptyReason,
      const DeepCollectionEquality().hash(_section));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SectionCopyWith<_$_Section> get copyWith =>
      __$$_SectionCopyWithImpl<_$_Section>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SectionToJson(
      this,
    );
  }
}

abstract class _Section implements Section {
  factory _Section(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Title') final String? title,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'Author') final List<Reference?>? author,
      @JsonKey(name: 'Focus') final Reference? focus,
      @JsonKey(name: 'Text') final Narrative? text,
      @JsonKey(name: 'Mode') final String? mode,
      @JsonKey(name: 'OrderedBy') final CodeableConcept? orderedBy,
      @JsonKey(name: 'Entry') final List<Reference?>? entry,
      @JsonKey(name: 'EmptyReason') final Reference? emptyReason,
      @JsonKey(name: 'Section') final List<Section?>? section}) = _$_Section;

  factory _Section.fromJson(Map<String, dynamic> json) = _$_Section.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Author')
  List<Reference?>? get author;
  @override
  @JsonKey(name: 'Focus')
  Reference? get focus;
  @override
  @JsonKey(name: 'Text')
  Narrative? get text;
  @override
  @JsonKey(name: 'Mode')
  String? get mode;
  @override
  @JsonKey(name: 'OrderedBy')
  CodeableConcept? get orderedBy;
  @override
  @JsonKey(name: 'Entry')
  List<Reference?>? get entry;
  @override
  @JsonKey(name: 'EmptyReason')
  Reference? get emptyReason;
  @override
  @JsonKey(name: 'Section')
  List<Section?>? get section;
  @override
  @JsonKey(ignore: true)
  _$$_SectionCopyWith<_$_Section> get copyWith =>
      throw _privateConstructorUsedError;
}

Age _$AgeFromJson(Map<String, dynamic> json) {
  return _Age.fromJson(json);
}

/// @nodoc
mixin _$Age {
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value')
  double? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comparator')
  ComparatorEnum? get comparator => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgeCopyWith<Age> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeCopyWith<$Res> {
  factory $AgeCopyWith(Age value, $Res Function(Age) then) =
      _$AgeCopyWithImpl<$Res, Age>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code});

  $CodeableConceptCopyWith<$Res>? get id;
}

/// @nodoc
class _$AgeCopyWithImpl<$Res, $Val extends Age> implements $AgeCopyWith<$Res> {
  _$AgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? comparator = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: freezed == comparator
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AgeCopyWith<$Res> implements $AgeCopyWith<$Res> {
  factory _$$_AgeCopyWith(_$_Age value, $Res Function(_$_Age) then) =
      __$$_AgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code});

  @override
  $CodeableConceptCopyWith<$Res>? get id;
}

/// @nodoc
class __$$_AgeCopyWithImpl<$Res> extends _$AgeCopyWithImpl<$Res, _$_Age>
    implements _$$_AgeCopyWith<$Res> {
  __$$_AgeCopyWithImpl(_$_Age _value, $Res Function(_$_Age) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? comparator = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Age(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: freezed == comparator
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Age implements _Age {
  _$_Age(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Value') this.value,
      @JsonKey(name: 'Comparator') this.comparator,
      @JsonKey(name: 'Unit') this.unit,
      @JsonKey(name: 'System') this.system,
      @JsonKey(name: 'Code') this.code});

  factory _$_Age.fromJson(Map<String, dynamic> json) => _$$_AgeFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final CodeableConcept? id;
  @override
  @JsonKey(name: 'Value')
  final double? value;
  @override
  @JsonKey(name: 'Comparator')
  final ComparatorEnum? comparator;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;
  @override
  @JsonKey(name: 'System')
  final String? system;
  @override
  @JsonKey(name: 'Code')
  final String? code;

  @override
  String toString() {
    return 'Age(id: $id, value: $value, comparator: $comparator, unit: $unit, system: $system, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Age &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.comparator, comparator) ||
                other.comparator == comparator) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, value, comparator, unit, system, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AgeCopyWith<_$_Age> get copyWith =>
      __$$_AgeCopyWithImpl<_$_Age>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgeToJson(
      this,
    );
  }
}

abstract class _Age implements Age {
  factory _Age(
      {@JsonKey(name: 'ID') final CodeableConcept? id,
      @JsonKey(name: 'Value') final double? value,
      @JsonKey(name: 'Comparator') final ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') final String? unit,
      @JsonKey(name: 'System') final String? system,
      @JsonKey(name: 'Code') final String? code}) = _$_Age;

  factory _Age.fromJson(Map<String, dynamic> json) = _$_Age.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id;
  @override
  @JsonKey(name: 'Value')
  double? get value;
  @override
  @JsonKey(name: 'Comparator')
  ComparatorEnum? get comparator;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(name: 'System')
  String? get system;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AgeCopyWith<_$_Age> get copyWith => throw _privateConstructorUsedError;
}

Quantity _$QuantityFromJson(Map<String, dynamic> json) {
  return _Quantity.fromJson(json);
}

/// @nodoc
mixin _$Quantity {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value')
  double? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comparator')
  ComparatorEnum? get comparator => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuantityCopyWith<Quantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuantityCopyWith<$Res> {
  factory $QuantityCopyWith(Quantity value, $Res Function(Quantity) then) =
      _$QuantityCopyWithImpl<$Res, Quantity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class _$QuantityCopyWithImpl<$Res, $Val extends Quantity>
    implements $QuantityCopyWith<$Res> {
  _$QuantityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? comparator = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: freezed == comparator
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuantityCopyWith<$Res> implements $QuantityCopyWith<$Res> {
  factory _$$_QuantityCopyWith(
          _$_Quantity value, $Res Function(_$_Quantity) then) =
      __$$_QuantityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class __$$_QuantityCopyWithImpl<$Res>
    extends _$QuantityCopyWithImpl<$Res, _$_Quantity>
    implements _$$_QuantityCopyWith<$Res> {
  __$$_QuantityCopyWithImpl(
      _$_Quantity _value, $Res Function(_$_Quantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? comparator = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Quantity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: freezed == comparator
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quantity implements _Quantity {
  _$_Quantity(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Value') this.value,
      @JsonKey(name: 'Comparator') this.comparator,
      @JsonKey(name: 'Unit') this.unit,
      @JsonKey(name: 'System') this.system,
      @JsonKey(name: 'Code') this.code});

  factory _$_Quantity.fromJson(Map<String, dynamic> json) =>
      _$$_QuantityFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Value')
  final double? value;
  @override
  @JsonKey(name: 'Comparator')
  final ComparatorEnum? comparator;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;
  @override
  @JsonKey(name: 'System')
  final String? system;
  @override
  @JsonKey(name: 'Code')
  final String? code;

  @override
  String toString() {
    return 'Quantity(id: $id, value: $value, comparator: $comparator, unit: $unit, system: $system, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quantity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.comparator, comparator) ||
                other.comparator == comparator) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, value, comparator, unit, system, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuantityCopyWith<_$_Quantity> get copyWith =>
      __$$_QuantityCopyWithImpl<_$_Quantity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuantityToJson(
      this,
    );
  }
}

abstract class _Quantity implements Quantity {
  factory _Quantity(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Value') final double? value,
      @JsonKey(name: 'Comparator') final ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') final String? unit,
      @JsonKey(name: 'System') final String? system,
      @JsonKey(name: 'Code') final String? code}) = _$_Quantity;

  factory _Quantity.fromJson(Map<String, dynamic> json) = _$_Quantity.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Value')
  double? get value;
  @override
  @JsonKey(name: 'Comparator')
  ComparatorEnum? get comparator;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(name: 'System')
  String? get system;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_QuantityCopyWith<_$_Quantity> get copyWith =>
      throw _privateConstructorUsedError;
}

Stage _$StageFromJson(Map<String, dynamic> json) {
  return _Stage.fromJson(json);
}

/// @nodoc
mixin _$Stage {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Summary')
  CodeableConcept? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Assessment')
  List<Reference?>? get assessment => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  Reference? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StageCopyWith<Stage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageCopyWith<$Res> {
  factory $StageCopyWith(Stage value, $Res Function(Stage) then) =
      _$StageCopyWithImpl<$Res, Stage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Summary') CodeableConcept? summary,
      @JsonKey(name: 'Assessment') List<Reference?>? assessment,
      @JsonKey(name: 'Type') Reference? type});

  $CodeableConceptCopyWith<$Res>? get summary;
  $ReferenceCopyWith<$Res>? get type;
}

/// @nodoc
class _$StageCopyWithImpl<$Res, $Val extends Stage>
    implements $StageCopyWith<$Res> {
  _$StageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? summary = freezed,
    Object? assessment = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      assessment: freezed == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StageCopyWith<$Res> implements $StageCopyWith<$Res> {
  factory _$$_StageCopyWith(_$_Stage value, $Res Function(_$_Stage) then) =
      __$$_StageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Summary') CodeableConcept? summary,
      @JsonKey(name: 'Assessment') List<Reference?>? assessment,
      @JsonKey(name: 'Type') Reference? type});

  @override
  $CodeableConceptCopyWith<$Res>? get summary;
  @override
  $ReferenceCopyWith<$Res>? get type;
}

/// @nodoc
class __$$_StageCopyWithImpl<$Res> extends _$StageCopyWithImpl<$Res, _$_Stage>
    implements _$$_StageCopyWith<$Res> {
  __$$_StageCopyWithImpl(_$_Stage _value, $Res Function(_$_Stage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? summary = freezed,
    Object? assessment = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Stage(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      assessment: freezed == assessment
          ? _value._assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stage implements _Stage {
  _$_Stage(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Summary') this.summary,
      @JsonKey(name: 'Assessment') final List<Reference?>? assessment,
      @JsonKey(name: 'Type') this.type})
      : _assessment = assessment;

  factory _$_Stage.fromJson(Map<String, dynamic> json) =>
      _$$_StageFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Summary')
  final CodeableConcept? summary;
  final List<Reference?>? _assessment;
  @override
  @JsonKey(name: 'Assessment')
  List<Reference?>? get assessment {
    final value = _assessment;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Type')
  final Reference? type;

  @override
  String toString() {
    return 'Stage(id: $id, summary: $summary, assessment: $assessment, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._assessment, _assessment) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, summary,
      const DeepCollectionEquality().hash(_assessment), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StageCopyWith<_$_Stage> get copyWith =>
      __$$_StageCopyWithImpl<_$_Stage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StageToJson(
      this,
    );
  }
}

abstract class _Stage implements Stage {
  factory _Stage(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Summary') final CodeableConcept? summary,
      @JsonKey(name: 'Assessment') final List<Reference?>? assessment,
      @JsonKey(name: 'Type') final Reference? type}) = _$_Stage;

  factory _Stage.fromJson(Map<String, dynamic> json) = _$_Stage.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Summary')
  CodeableConcept? get summary;
  @override
  @JsonKey(name: 'Assessment')
  List<Reference?>? get assessment;
  @override
  @JsonKey(name: 'Type')
  Reference? get type;
  @override
  @JsonKey(ignore: true)
  _$$_StageCopyWith<_$_Stage> get copyWith =>
      throw _privateConstructorUsedError;
}

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return _Evidence.fromJson(json);
}

/// @nodoc
mixin _$Evidence {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvidenceCopyWith<Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidenceCopyWith<$Res> {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) then) =
      _$EvidenceCopyWithImpl<$Res, Evidence>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  $CodeableConceptCopyWith<$Res>? get code;
}

/// @nodoc
class _$EvidenceCopyWithImpl<$Res, $Val extends Evidence>
    implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EvidenceCopyWith<$Res> implements $EvidenceCopyWith<$Res> {
  factory _$$_EvidenceCopyWith(
          _$_Evidence value, $Res Function(_$_Evidence) then) =
      __$$_EvidenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  @override
  $CodeableConceptCopyWith<$Res>? get code;
}

/// @nodoc
class __$$_EvidenceCopyWithImpl<$Res>
    extends _$EvidenceCopyWithImpl<$Res, _$_Evidence>
    implements _$$_EvidenceCopyWith<$Res> {
  __$$_EvidenceCopyWithImpl(
      _$_Evidence _value, $Res Function(_$_Evidence) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_Evidence(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      detail: freezed == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Evidence implements _Evidence {
  _$_Evidence(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Detail') final List<Reference?>? detail})
      : _detail = detail;

  factory _$_Evidence.fromJson(Map<String, dynamic> json) =>
      _$$_EvidenceFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Code')
  final CodeableConcept? code;
  final List<Reference?>? _detail;
  @override
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail {
    final value = _detail;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Evidence(id: $id, code: $code, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Evidence &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EvidenceCopyWith<_$_Evidence> get copyWith =>
      __$$_EvidenceCopyWithImpl<_$_Evidence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvidenceToJson(
      this,
    );
  }
}

abstract class _Evidence implements Evidence {
  factory _Evidence(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Code') final CodeableConcept? code,
      @JsonKey(name: 'Detail') final List<Reference?>? detail}) = _$_Evidence;

  factory _Evidence.fromJson(Map<String, dynamic> json) = _$_Evidence.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Code')
  CodeableConcept? get code;
  @override
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_EvidenceCopyWith<_$_Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

Composition _$CompositionFromJson(Map<String, dynamic> json) {
  return _Composition.fromJson(json);
}

/// @nodoc
mixin _$Composition {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Identifier')
  Identifier? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  CompositionStatusEnum? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  CodeableConcept? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @JsonKey(name: 'Date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'Author')
  List<Reference?>? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confidentiality')
  String? get confidentiality => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attester')
  List<Attester?>? get attester => throw _privateConstructorUsedError;
  @JsonKey(name: 'Custodian')
  Reference? get custodian => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatesTo')
  List<RelatesTo?>? get relatesTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Event')
  List<Event?>? get event => throw _privateConstructorUsedError;
  @JsonKey(name: 'Section')
  List<Section?>? get section => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompositionCopyWith<Composition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositionCopyWith<$Res> {
  factory $CompositionCopyWith(
          Composition value, $Res Function(Composition) then) =
      _$CompositionCopyWithImpl<$Res, Composition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') Identifier? identifier,
      @JsonKey(name: 'Status') CompositionStatusEnum? status,
      @JsonKey(name: 'Type') CodeableConcept? type,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'Date') String? date,
      @JsonKey(name: 'Author') List<Reference?>? author,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Confidentiality') String? confidentiality,
      @JsonKey(name: 'Attester') List<Attester?>? attester,
      @JsonKey(name: 'Custodian') Reference? custodian,
      @JsonKey(name: 'RelatesTo') List<RelatesTo?>? relatesTo,
      @JsonKey(name: 'Event') List<Event?>? event,
      @JsonKey(name: 'Section') List<Section?>? section});

  $IdentifierCopyWith<$Res>? get identifier;
  $CodeableConceptCopyWith<$Res>? get type;
  $ReferenceCopyWith<$Res>? get subject;
  $ReferenceCopyWith<$Res>? get encounter;
  $ReferenceCopyWith<$Res>? get custodian;
}

/// @nodoc
class _$CompositionCopyWithImpl<$Res, $Val extends Composition>
    implements $CompositionCopyWith<$Res> {
  _$CompositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? date = freezed,
    Object? author = freezed,
    Object? title = freezed,
    Object? confidentiality = freezed,
    Object? attester = freezed,
    Object? custodian = freezed,
    Object? relatesTo = freezed,
    Object? event = freezed,
    Object? section = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CompositionStatusEnum?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      confidentiality: freezed == confidentiality
          ? _value.confidentiality
          : confidentiality // ignore: cast_nullable_to_non_nullable
              as String?,
      attester: freezed == attester
          ? _value.attester
          : attester // ignore: cast_nullable_to_non_nullable
              as List<Attester?>?,
      custodian: freezed == custodian
          ? _value.custodian
          : custodian // ignore: cast_nullable_to_non_nullable
              as Reference?,
      relatesTo: freezed == relatesTo
          ? _value.relatesTo
          : relatesTo // ignore: cast_nullable_to_non_nullable
              as List<RelatesTo?>?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as List<Event?>?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as List<Section?>?,
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

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get encounter {
    if (_value.encounter == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.encounter!, (value) {
      return _then(_value.copyWith(encounter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get custodian {
    if (_value.custodian == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.custodian!, (value) {
      return _then(_value.copyWith(custodian: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CompositionCopyWith<$Res>
    implements $CompositionCopyWith<$Res> {
  factory _$$_CompositionCopyWith(
          _$_Composition value, $Res Function(_$_Composition) then) =
      __$$_CompositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') Identifier? identifier,
      @JsonKey(name: 'Status') CompositionStatusEnum? status,
      @JsonKey(name: 'Type') CodeableConcept? type,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'Date') String? date,
      @JsonKey(name: 'Author') List<Reference?>? author,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Confidentiality') String? confidentiality,
      @JsonKey(name: 'Attester') List<Attester?>? attester,
      @JsonKey(name: 'Custodian') Reference? custodian,
      @JsonKey(name: 'RelatesTo') List<RelatesTo?>? relatesTo,
      @JsonKey(name: 'Event') List<Event?>? event,
      @JsonKey(name: 'Section') List<Section?>? section});

  @override
  $IdentifierCopyWith<$Res>? get identifier;
  @override
  $CodeableConceptCopyWith<$Res>? get type;
  @override
  $ReferenceCopyWith<$Res>? get subject;
  @override
  $ReferenceCopyWith<$Res>? get encounter;
  @override
  $ReferenceCopyWith<$Res>? get custodian;
}

/// @nodoc
class __$$_CompositionCopyWithImpl<$Res>
    extends _$CompositionCopyWithImpl<$Res, _$_Composition>
    implements _$$_CompositionCopyWith<$Res> {
  __$$_CompositionCopyWithImpl(
      _$_Composition _value, $Res Function(_$_Composition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? date = freezed,
    Object? author = freezed,
    Object? title = freezed,
    Object? confidentiality = freezed,
    Object? attester = freezed,
    Object? custodian = freezed,
    Object? relatesTo = freezed,
    Object? event = freezed,
    Object? section = freezed,
  }) {
    return _then(_$_Composition(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CompositionStatusEnum?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      confidentiality: freezed == confidentiality
          ? _value.confidentiality
          : confidentiality // ignore: cast_nullable_to_non_nullable
              as String?,
      attester: freezed == attester
          ? _value._attester
          : attester // ignore: cast_nullable_to_non_nullable
              as List<Attester?>?,
      custodian: freezed == custodian
          ? _value.custodian
          : custodian // ignore: cast_nullable_to_non_nullable
              as Reference?,
      relatesTo: freezed == relatesTo
          ? _value._relatesTo
          : relatesTo // ignore: cast_nullable_to_non_nullable
              as List<RelatesTo?>?,
      event: freezed == event
          ? _value._event
          : event // ignore: cast_nullable_to_non_nullable
              as List<Event?>?,
      section: freezed == section
          ? _value._section
          : section // ignore: cast_nullable_to_non_nullable
              as List<Section?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Composition implements _Composition {
  _$_Composition(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Identifier') this.identifier,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'Category') final List<CodeableConcept?>? category,
      @JsonKey(name: 'Subject') this.subject,
      @JsonKey(name: 'Encounter') this.encounter,
      @JsonKey(name: 'Date') this.date,
      @JsonKey(name: 'Author') final List<Reference?>? author,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Confidentiality') this.confidentiality,
      @JsonKey(name: 'Attester') final List<Attester?>? attester,
      @JsonKey(name: 'Custodian') this.custodian,
      @JsonKey(name: 'RelatesTo') final List<RelatesTo?>? relatesTo,
      @JsonKey(name: 'Event') final List<Event?>? event,
      @JsonKey(name: 'Section') final List<Section?>? section})
      : _category = category,
        _author = author,
        _attester = attester,
        _relatesTo = relatesTo,
        _event = event,
        _section = section;

  factory _$_Composition.fromJson(Map<String, dynamic> json) =>
      _$$_CompositionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Identifier')
  final Identifier? identifier;
  @override
  @JsonKey(name: 'Status')
  final CompositionStatusEnum? status;
  @override
  @JsonKey(name: 'Type')
  final CodeableConcept? type;
  final List<CodeableConcept?>? _category;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category {
    final value = _category;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Subject')
  final Reference? subject;
  @override
  @JsonKey(name: 'Encounter')
  final Reference? encounter;
  @override
  @JsonKey(name: 'Date')
  final String? date;
  final List<Reference?>? _author;
  @override
  @JsonKey(name: 'Author')
  List<Reference?>? get author {
    final value = _author;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Confidentiality')
  final String? confidentiality;
  final List<Attester?>? _attester;
  @override
  @JsonKey(name: 'Attester')
  List<Attester?>? get attester {
    final value = _attester;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Custodian')
  final Reference? custodian;
  final List<RelatesTo?>? _relatesTo;
  @override
  @JsonKey(name: 'RelatesTo')
  List<RelatesTo?>? get relatesTo {
    final value = _relatesTo;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Event?>? _event;
  @override
  @JsonKey(name: 'Event')
  List<Event?>? get event {
    final value = _event;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Section?>? _section;
  @override
  @JsonKey(name: 'Section')
  List<Section?>? get section {
    final value = _section;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Composition(id: $id, identifier: $identifier, status: $status, type: $type, category: $category, subject: $subject, encounter: $encounter, date: $date, author: $author, title: $title, confidentiality: $confidentiality, attester: $attester, custodian: $custodian, relatesTo: $relatesTo, event: $event, section: $section)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Composition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.confidentiality, confidentiality) ||
                other.confidentiality == confidentiality) &&
            const DeepCollectionEquality().equals(other._attester, _attester) &&
            (identical(other.custodian, custodian) ||
                other.custodian == custodian) &&
            const DeepCollectionEquality()
                .equals(other._relatesTo, _relatesTo) &&
            const DeepCollectionEquality().equals(other._event, _event) &&
            const DeepCollectionEquality().equals(other._section, _section));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      identifier,
      status,
      type,
      const DeepCollectionEquality().hash(_category),
      subject,
      encounter,
      date,
      const DeepCollectionEquality().hash(_author),
      title,
      confidentiality,
      const DeepCollectionEquality().hash(_attester),
      custodian,
      const DeepCollectionEquality().hash(_relatesTo),
      const DeepCollectionEquality().hash(_event),
      const DeepCollectionEquality().hash(_section));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompositionCopyWith<_$_Composition> get copyWith =>
      __$$_CompositionCopyWithImpl<_$_Composition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompositionToJson(
      this,
    );
  }
}

abstract class _Composition implements Composition {
  factory _Composition(
          {@JsonKey(name: 'ID') final String? id,
          @JsonKey(name: 'Identifier') final Identifier? identifier,
          @JsonKey(name: 'Status') final CompositionStatusEnum? status,
          @JsonKey(name: 'Type') final CodeableConcept? type,
          @JsonKey(name: 'Category') final List<CodeableConcept?>? category,
          @JsonKey(name: 'Subject') final Reference? subject,
          @JsonKey(name: 'Encounter') final Reference? encounter,
          @JsonKey(name: 'Date') final String? date,
          @JsonKey(name: 'Author') final List<Reference?>? author,
          @JsonKey(name: 'Title') final String? title,
          @JsonKey(name: 'Confidentiality') final String? confidentiality,
          @JsonKey(name: 'Attester') final List<Attester?>? attester,
          @JsonKey(name: 'Custodian') final Reference? custodian,
          @JsonKey(name: 'RelatesTo') final List<RelatesTo?>? relatesTo,
          @JsonKey(name: 'Event') final List<Event?>? event,
          @JsonKey(name: 'Section') final List<Section?>? section}) =
      _$_Composition;

  factory _Composition.fromJson(Map<String, dynamic> json) =
      _$_Composition.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Identifier')
  Identifier? get identifier;
  @override
  @JsonKey(name: 'Status')
  CompositionStatusEnum? get status;
  @override
  @JsonKey(name: 'Type')
  CodeableConcept? get type;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category;
  @override
  @JsonKey(name: 'Subject')
  Reference? get subject;
  @override
  @JsonKey(name: 'Encounter')
  Reference? get encounter;
  @override
  @JsonKey(name: 'Date')
  String? get date;
  @override
  @JsonKey(name: 'Author')
  List<Reference?>? get author;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  @JsonKey(name: 'Confidentiality')
  String? get confidentiality;
  @override
  @JsonKey(name: 'Attester')
  List<Attester?>? get attester;
  @override
  @JsonKey(name: 'Custodian')
  Reference? get custodian;
  @override
  @JsonKey(name: 'RelatesTo')
  List<RelatesTo?>? get relatesTo;
  @override
  @JsonKey(name: 'Event')
  List<Event?>? get event;
  @override
  @JsonKey(name: 'Section')
  List<Section?>? get section;
  @override
  @JsonKey(ignore: true)
  _$$_CompositionCopyWith<_$_Composition> get copyWith =>
      throw _privateConstructorUsedError;
}

TimingRepeat _$TimingRepeatFromJson(Map<String, dynamic> json) {
  return _TimingRepeat.fromJson(json);
}

/// @nodoc
mixin _$TimingRepeat {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'BoundsDuration')
  Duration? get boundsDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'BoundsRange')
  Range? get boundsRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'BoundsPeriod')
  Period? get boundsPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'Count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountMax')
  int? get countMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'Duration')
  double? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'DurationMax')
  double? get durationMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'DurationUnit')
  TimingRepeatPeriodUnit? get durationUnit =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Frequency')
  int? get frequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'FrequencyMax')
  int? get frequencyMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'Period')
  double? get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'PeriodMax')
  double? get periodMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'PeriodUnit')
  TimingRepeatPeriodUnit? get periodUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayOfWeek')
  DayOfWeek? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'When')
  TimingRepeatPeriodUnit? get when => throw _privateConstructorUsedError;
  @JsonKey(name: 'Offset')
  int? get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimingRepeatCopyWith<TimingRepeat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimingRepeatCopyWith<$Res> {
  factory $TimingRepeatCopyWith(
          TimingRepeat value, $Res Function(TimingRepeat) then) =
      _$TimingRepeatCopyWithImpl<$Res, TimingRepeat>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'BoundsDuration') Duration? boundsDuration,
      @JsonKey(name: 'BoundsRange') Range? boundsRange,
      @JsonKey(name: 'BoundsPeriod') Period? boundsPeriod,
      @JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'CountMax') int? countMax,
      @JsonKey(name: 'Duration') double? duration,
      @JsonKey(name: 'DurationMax') double? durationMax,
      @JsonKey(name: 'DurationUnit') TimingRepeatPeriodUnit? durationUnit,
      @JsonKey(name: 'Frequency') int? frequency,
      @JsonKey(name: 'FrequencyMax') int? frequencyMax,
      @JsonKey(name: 'Period') double? period,
      @JsonKey(name: 'PeriodMax') double? periodMax,
      @JsonKey(name: 'PeriodUnit') TimingRepeatPeriodUnit? periodUnit,
      @JsonKey(name: 'DayOfWeek') DayOfWeek? dayOfWeek,
      @JsonKey(name: 'When') TimingRepeatPeriodUnit? when,
      @JsonKey(name: 'Offset') int? offset});

  $RangeCopyWith<$Res>? get boundsRange;
  $PeriodCopyWith<$Res>? get boundsPeriod;
}

/// @nodoc
class _$TimingRepeatCopyWithImpl<$Res, $Val extends TimingRepeat>
    implements $TimingRepeatCopyWith<$Res> {
  _$TimingRepeatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? boundsDuration = freezed,
    Object? boundsRange = freezed,
    Object? boundsPeriod = freezed,
    Object? count = freezed,
    Object? countMax = freezed,
    Object? duration = freezed,
    Object? durationMax = freezed,
    Object? durationUnit = freezed,
    Object? frequency = freezed,
    Object? frequencyMax = freezed,
    Object? period = freezed,
    Object? periodMax = freezed,
    Object? periodUnit = freezed,
    Object? dayOfWeek = freezed,
    Object? when = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boundsDuration: freezed == boundsDuration
          ? _value.boundsDuration
          : boundsDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      boundsRange: freezed == boundsRange
          ? _value.boundsRange
          : boundsRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      boundsPeriod: freezed == boundsPeriod
          ? _value.boundsPeriod
          : boundsPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      countMax: freezed == countMax
          ? _value.countMax
          : countMax // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      durationMax: freezed == durationMax
          ? _value.durationMax
          : durationMax // ignore: cast_nullable_to_non_nullable
              as double?,
      durationUnit: freezed == durationUnit
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      frequencyMax: freezed == frequencyMax
          ? _value.frequencyMax
          : frequencyMax // ignore: cast_nullable_to_non_nullable
              as int?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as double?,
      periodMax: freezed == periodMax
          ? _value.periodMax
          : periodMax // ignore: cast_nullable_to_non_nullable
              as double?,
      periodUnit: freezed == periodUnit
          ? _value.periodUnit
          : periodUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as DayOfWeek?,
      when: freezed == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res>? get boundsRange {
    if (_value.boundsRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.boundsRange!, (value) {
      return _then(_value.copyWith(boundsRange: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get boundsPeriod {
    if (_value.boundsPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.boundsPeriod!, (value) {
      return _then(_value.copyWith(boundsPeriod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TimingRepeatCopyWith<$Res>
    implements $TimingRepeatCopyWith<$Res> {
  factory _$$_TimingRepeatCopyWith(
          _$_TimingRepeat value, $Res Function(_$_TimingRepeat) then) =
      __$$_TimingRepeatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'BoundsDuration') Duration? boundsDuration,
      @JsonKey(name: 'BoundsRange') Range? boundsRange,
      @JsonKey(name: 'BoundsPeriod') Period? boundsPeriod,
      @JsonKey(name: 'Count') int? count,
      @JsonKey(name: 'CountMax') int? countMax,
      @JsonKey(name: 'Duration') double? duration,
      @JsonKey(name: 'DurationMax') double? durationMax,
      @JsonKey(name: 'DurationUnit') TimingRepeatPeriodUnit? durationUnit,
      @JsonKey(name: 'Frequency') int? frequency,
      @JsonKey(name: 'FrequencyMax') int? frequencyMax,
      @JsonKey(name: 'Period') double? period,
      @JsonKey(name: 'PeriodMax') double? periodMax,
      @JsonKey(name: 'PeriodUnit') TimingRepeatPeriodUnit? periodUnit,
      @JsonKey(name: 'DayOfWeek') DayOfWeek? dayOfWeek,
      @JsonKey(name: 'When') TimingRepeatPeriodUnit? when,
      @JsonKey(name: 'Offset') int? offset});

  @override
  $RangeCopyWith<$Res>? get boundsRange;
  @override
  $PeriodCopyWith<$Res>? get boundsPeriod;
}

/// @nodoc
class __$$_TimingRepeatCopyWithImpl<$Res>
    extends _$TimingRepeatCopyWithImpl<$Res, _$_TimingRepeat>
    implements _$$_TimingRepeatCopyWith<$Res> {
  __$$_TimingRepeatCopyWithImpl(
      _$_TimingRepeat _value, $Res Function(_$_TimingRepeat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? boundsDuration = freezed,
    Object? boundsRange = freezed,
    Object? boundsPeriod = freezed,
    Object? count = freezed,
    Object? countMax = freezed,
    Object? duration = freezed,
    Object? durationMax = freezed,
    Object? durationUnit = freezed,
    Object? frequency = freezed,
    Object? frequencyMax = freezed,
    Object? period = freezed,
    Object? periodMax = freezed,
    Object? periodUnit = freezed,
    Object? dayOfWeek = freezed,
    Object? when = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$_TimingRepeat(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boundsDuration: freezed == boundsDuration
          ? _value.boundsDuration
          : boundsDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      boundsRange: freezed == boundsRange
          ? _value.boundsRange
          : boundsRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      boundsPeriod: freezed == boundsPeriod
          ? _value.boundsPeriod
          : boundsPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      countMax: freezed == countMax
          ? _value.countMax
          : countMax // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      durationMax: freezed == durationMax
          ? _value.durationMax
          : durationMax // ignore: cast_nullable_to_non_nullable
              as double?,
      durationUnit: freezed == durationUnit
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      frequencyMax: freezed == frequencyMax
          ? _value.frequencyMax
          : frequencyMax // ignore: cast_nullable_to_non_nullable
              as int?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as double?,
      periodMax: freezed == periodMax
          ? _value.periodMax
          : periodMax // ignore: cast_nullable_to_non_nullable
              as double?,
      periodUnit: freezed == periodUnit
          ? _value.periodUnit
          : periodUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as DayOfWeek?,
      when: freezed == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimingRepeat implements _TimingRepeat {
  _$_TimingRepeat(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'BoundsDuration') this.boundsDuration,
      @JsonKey(name: 'BoundsRange') this.boundsRange,
      @JsonKey(name: 'BoundsPeriod') this.boundsPeriod,
      @JsonKey(name: 'Count') this.count,
      @JsonKey(name: 'CountMax') this.countMax,
      @JsonKey(name: 'Duration') this.duration,
      @JsonKey(name: 'DurationMax') this.durationMax,
      @JsonKey(name: 'DurationUnit') this.durationUnit,
      @JsonKey(name: 'Frequency') this.frequency,
      @JsonKey(name: 'FrequencyMax') this.frequencyMax,
      @JsonKey(name: 'Period') this.period,
      @JsonKey(name: 'PeriodMax') this.periodMax,
      @JsonKey(name: 'PeriodUnit') this.periodUnit,
      @JsonKey(name: 'DayOfWeek') this.dayOfWeek,
      @JsonKey(name: 'When') this.when,
      @JsonKey(name: 'Offset') this.offset});

  factory _$_TimingRepeat.fromJson(Map<String, dynamic> json) =>
      _$$_TimingRepeatFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'BoundsDuration')
  final Duration? boundsDuration;
  @override
  @JsonKey(name: 'BoundsRange')
  final Range? boundsRange;
  @override
  @JsonKey(name: 'BoundsPeriod')
  final Period? boundsPeriod;
  @override
  @JsonKey(name: 'Count')
  final int? count;
  @override
  @JsonKey(name: 'CountMax')
  final int? countMax;
  @override
  @JsonKey(name: 'Duration')
  final double? duration;
  @override
  @JsonKey(name: 'DurationMax')
  final double? durationMax;
  @override
  @JsonKey(name: 'DurationUnit')
  final TimingRepeatPeriodUnit? durationUnit;
  @override
  @JsonKey(name: 'Frequency')
  final int? frequency;
  @override
  @JsonKey(name: 'FrequencyMax')
  final int? frequencyMax;
  @override
  @JsonKey(name: 'Period')
  final double? period;
  @override
  @JsonKey(name: 'PeriodMax')
  final double? periodMax;
  @override
  @JsonKey(name: 'PeriodUnit')
  final TimingRepeatPeriodUnit? periodUnit;
  @override
  @JsonKey(name: 'DayOfWeek')
  final DayOfWeek? dayOfWeek;
  @override
  @JsonKey(name: 'When')
  final TimingRepeatPeriodUnit? when;
  @override
  @JsonKey(name: 'Offset')
  final int? offset;

  @override
  String toString() {
    return 'TimingRepeat(id: $id, boundsDuration: $boundsDuration, boundsRange: $boundsRange, boundsPeriod: $boundsPeriod, count: $count, countMax: $countMax, duration: $duration, durationMax: $durationMax, durationUnit: $durationUnit, frequency: $frequency, frequencyMax: $frequencyMax, period: $period, periodMax: $periodMax, periodUnit: $periodUnit, dayOfWeek: $dayOfWeek, when: $when, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimingRepeat &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.boundsDuration, boundsDuration) ||
                other.boundsDuration == boundsDuration) &&
            (identical(other.boundsRange, boundsRange) ||
                other.boundsRange == boundsRange) &&
            (identical(other.boundsPeriod, boundsPeriod) ||
                other.boundsPeriod == boundsPeriod) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.countMax, countMax) ||
                other.countMax == countMax) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.durationMax, durationMax) ||
                other.durationMax == durationMax) &&
            (identical(other.durationUnit, durationUnit) ||
                other.durationUnit == durationUnit) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.frequencyMax, frequencyMax) ||
                other.frequencyMax == frequencyMax) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.periodMax, periodMax) ||
                other.periodMax == periodMax) &&
            (identical(other.periodUnit, periodUnit) ||
                other.periodUnit == periodUnit) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      boundsDuration,
      boundsRange,
      boundsPeriod,
      count,
      countMax,
      duration,
      durationMax,
      durationUnit,
      frequency,
      frequencyMax,
      period,
      periodMax,
      periodUnit,
      dayOfWeek,
      when,
      offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimingRepeatCopyWith<_$_TimingRepeat> get copyWith =>
      __$$_TimingRepeatCopyWithImpl<_$_TimingRepeat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimingRepeatToJson(
      this,
    );
  }
}

abstract class _TimingRepeat implements TimingRepeat {
  factory _TimingRepeat(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'BoundsDuration') final Duration? boundsDuration,
      @JsonKey(name: 'BoundsRange') final Range? boundsRange,
      @JsonKey(name: 'BoundsPeriod') final Period? boundsPeriod,
      @JsonKey(name: 'Count') final int? count,
      @JsonKey(name: 'CountMax') final int? countMax,
      @JsonKey(name: 'Duration') final double? duration,
      @JsonKey(name: 'DurationMax') final double? durationMax,
      @JsonKey(name: 'DurationUnit') final TimingRepeatPeriodUnit? durationUnit,
      @JsonKey(name: 'Frequency') final int? frequency,
      @JsonKey(name: 'FrequencyMax') final int? frequencyMax,
      @JsonKey(name: 'Period') final double? period,
      @JsonKey(name: 'PeriodMax') final double? periodMax,
      @JsonKey(name: 'PeriodUnit') final TimingRepeatPeriodUnit? periodUnit,
      @JsonKey(name: 'DayOfWeek') final DayOfWeek? dayOfWeek,
      @JsonKey(name: 'When') final TimingRepeatPeriodUnit? when,
      @JsonKey(name: 'Offset') final int? offset}) = _$_TimingRepeat;

  factory _TimingRepeat.fromJson(Map<String, dynamic> json) =
      _$_TimingRepeat.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'BoundsDuration')
  Duration? get boundsDuration;
  @override
  @JsonKey(name: 'BoundsRange')
  Range? get boundsRange;
  @override
  @JsonKey(name: 'BoundsPeriod')
  Period? get boundsPeriod;
  @override
  @JsonKey(name: 'Count')
  int? get count;
  @override
  @JsonKey(name: 'CountMax')
  int? get countMax;
  @override
  @JsonKey(name: 'Duration')
  double? get duration;
  @override
  @JsonKey(name: 'DurationMax')
  double? get durationMax;
  @override
  @JsonKey(name: 'DurationUnit')
  TimingRepeatPeriodUnit? get durationUnit;
  @override
  @JsonKey(name: 'Frequency')
  int? get frequency;
  @override
  @JsonKey(name: 'FrequencyMax')
  int? get frequencyMax;
  @override
  @JsonKey(name: 'Period')
  double? get period;
  @override
  @JsonKey(name: 'PeriodMax')
  double? get periodMax;
  @override
  @JsonKey(name: 'PeriodUnit')
  TimingRepeatPeriodUnit? get periodUnit;
  @override
  @JsonKey(name: 'DayOfWeek')
  DayOfWeek? get dayOfWeek;
  @override
  @JsonKey(name: 'When')
  TimingRepeatPeriodUnit? get when;
  @override
  @JsonKey(name: 'Offset')
  int? get offset;
  @override
  @JsonKey(ignore: true)
  _$$_TimingRepeatCopyWith<_$_TimingRepeat> get copyWith =>
      throw _privateConstructorUsedError;
}

Timing _$TimingFromJson(Map<String, dynamic> json) {
  return _Timing.fromJson(json);
}

/// @nodoc
mixin _$Timing {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Event')
  Duration? get event => throw _privateConstructorUsedError;
  @JsonKey(name: 'Repeat')
  TimingRepeat? get repeat => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  TimingCodes? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimingCopyWith<Timing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimingCopyWith<$Res> {
  factory $TimingCopyWith(Timing value, $Res Function(Timing) then) =
      _$TimingCopyWithImpl<$Res, Timing>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Event') Duration? event,
      @JsonKey(name: 'Repeat') TimingRepeat? repeat,
      @JsonKey(name: 'Code') TimingCodes? code});

  $TimingRepeatCopyWith<$Res>? get repeat;
}

/// @nodoc
class _$TimingCopyWithImpl<$Res, $Val extends Timing>
    implements $TimingCopyWith<$Res> {
  _$TimingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? repeat = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Duration?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as TimingRepeat?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as TimingCodes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimingRepeatCopyWith<$Res>? get repeat {
    if (_value.repeat == null) {
      return null;
    }

    return $TimingRepeatCopyWith<$Res>(_value.repeat!, (value) {
      return _then(_value.copyWith(repeat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TimingCopyWith<$Res> implements $TimingCopyWith<$Res> {
  factory _$$_TimingCopyWith(_$_Timing value, $Res Function(_$_Timing) then) =
      __$$_TimingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Event') Duration? event,
      @JsonKey(name: 'Repeat') TimingRepeat? repeat,
      @JsonKey(name: 'Code') TimingCodes? code});

  @override
  $TimingRepeatCopyWith<$Res>? get repeat;
}

/// @nodoc
class __$$_TimingCopyWithImpl<$Res>
    extends _$TimingCopyWithImpl<$Res, _$_Timing>
    implements _$$_TimingCopyWith<$Res> {
  __$$_TimingCopyWithImpl(_$_Timing _value, $Res Function(_$_Timing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? repeat = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Timing(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Duration?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as TimingRepeat?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as TimingCodes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Timing implements _Timing {
  _$_Timing(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Event') this.event,
      @JsonKey(name: 'Repeat') this.repeat,
      @JsonKey(name: 'Code') this.code});

  factory _$_Timing.fromJson(Map<String, dynamic> json) =>
      _$$_TimingFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Event')
  final Duration? event;
  @override
  @JsonKey(name: 'Repeat')
  final TimingRepeat? repeat;
  @override
  @JsonKey(name: 'Code')
  final TimingCodes? code;

  @override
  String toString() {
    return 'Timing(id: $id, event: $event, repeat: $repeat, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, event, repeat, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimingCopyWith<_$_Timing> get copyWith =>
      __$$_TimingCopyWithImpl<_$_Timing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimingToJson(
      this,
    );
  }
}

abstract class _Timing implements Timing {
  factory _Timing(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Event') final Duration? event,
      @JsonKey(name: 'Repeat') final TimingRepeat? repeat,
      @JsonKey(name: 'Code') final TimingCodes? code}) = _$_Timing;

  factory _Timing.fromJson(Map<String, dynamic> json) = _$_Timing.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Event')
  Duration? get event;
  @override
  @JsonKey(name: 'Repeat')
  TimingRepeat? get repeat;
  @override
  @JsonKey(name: 'Code')
  TimingCodes? get code;
  @override
  @JsonKey(ignore: true)
  _$$_TimingCopyWith<_$_Timing> get copyWith =>
      throw _privateConstructorUsedError;
}

RateRatio _$RateRatioFromJson(Map<String, dynamic> json) {
  return _RateRatio.fromJson(json);
}

/// @nodoc
mixin _$RateRatio {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Numerator')
  Quantity? get numerator => throw _privateConstructorUsedError;
  @JsonKey(name: 'Denominator')
  Quantity? get denominator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateRatioCopyWith<RateRatio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateRatioCopyWith<$Res> {
  factory $RateRatioCopyWith(RateRatio value, $Res Function(RateRatio) then) =
      _$RateRatioCopyWithImpl<$Res, RateRatio>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Numerator') Quantity? numerator,
      @JsonKey(name: 'Denominator') Quantity? denominator});

  $QuantityCopyWith<$Res>? get numerator;
  $QuantityCopyWith<$Res>? get denominator;
}

/// @nodoc
class _$RateRatioCopyWithImpl<$Res, $Val extends RateRatio>
    implements $RateRatioCopyWith<$Res> {
  _$RateRatioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numerator = freezed,
    Object? denominator = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      denominator: freezed == denominator
          ? _value.denominator
          : denominator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get numerator {
    if (_value.numerator == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.numerator!, (value) {
      return _then(_value.copyWith(numerator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get denominator {
    if (_value.denominator == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.denominator!, (value) {
      return _then(_value.copyWith(denominator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RateRatioCopyWith<$Res> implements $RateRatioCopyWith<$Res> {
  factory _$$_RateRatioCopyWith(
          _$_RateRatio value, $Res Function(_$_RateRatio) then) =
      __$$_RateRatioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Numerator') Quantity? numerator,
      @JsonKey(name: 'Denominator') Quantity? denominator});

  @override
  $QuantityCopyWith<$Res>? get numerator;
  @override
  $QuantityCopyWith<$Res>? get denominator;
}

/// @nodoc
class __$$_RateRatioCopyWithImpl<$Res>
    extends _$RateRatioCopyWithImpl<$Res, _$_RateRatio>
    implements _$$_RateRatioCopyWith<$Res> {
  __$$_RateRatioCopyWithImpl(
      _$_RateRatio _value, $Res Function(_$_RateRatio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numerator = freezed,
    Object? denominator = freezed,
  }) {
    return _then(_$_RateRatio(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      denominator: freezed == denominator
          ? _value.denominator
          : denominator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RateRatio implements _RateRatio {
  _$_RateRatio(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Numerator') this.numerator,
      @JsonKey(name: 'Denominator') this.denominator});

  factory _$_RateRatio.fromJson(Map<String, dynamic> json) =>
      _$$_RateRatioFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Numerator')
  final Quantity? numerator;
  @override
  @JsonKey(name: 'Denominator')
  final Quantity? denominator;

  @override
  String toString() {
    return 'RateRatio(id: $id, numerator: $numerator, denominator: $denominator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RateRatio &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numerator, numerator) ||
                other.numerator == numerator) &&
            (identical(other.denominator, denominator) ||
                other.denominator == denominator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, numerator, denominator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RateRatioCopyWith<_$_RateRatio> get copyWith =>
      __$$_RateRatioCopyWithImpl<_$_RateRatio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateRatioToJson(
      this,
    );
  }
}

abstract class _RateRatio implements RateRatio {
  factory _RateRatio(
          {@JsonKey(name: 'ID') final String? id,
          @JsonKey(name: 'Numerator') final Quantity? numerator,
          @JsonKey(name: 'Denominator') final Quantity? denominator}) =
      _$_RateRatio;

  factory _RateRatio.fromJson(Map<String, dynamic> json) =
      _$_RateRatio.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Numerator')
  Quantity? get numerator;
  @override
  @JsonKey(name: 'Denominator')
  Quantity? get denominator;
  @override
  @JsonKey(ignore: true)
  _$$_RateRatioCopyWith<_$_RateRatio> get copyWith =>
      throw _privateConstructorUsedError;
}

DosageDoseAndRate _$DosageDoseAndRateFromJson(Map<String, dynamic> json) {
  return _DosageDoseAndRate.fromJson(json);
}

/// @nodoc
mixin _$DosageDoseAndRate {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  CodeableConcept? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'DoseRange')
  Range? get doseRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'DoseQuantity')
  Quantity? get doseQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'RateRatio')
  RateRatio? get rateRatio => throw _privateConstructorUsedError;
  @JsonKey(name: 'RateRange')
  Range? get rateRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'RateQuantity')
  Quantity? get rateQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DosageDoseAndRateCopyWith<DosageDoseAndRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DosageDoseAndRateCopyWith<$Res> {
  factory $DosageDoseAndRateCopyWith(
          DosageDoseAndRate value, $Res Function(DosageDoseAndRate) then) =
      _$DosageDoseAndRateCopyWithImpl<$Res, DosageDoseAndRate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Type') CodeableConcept? type,
      @JsonKey(name: 'DoseRange') Range? doseRange,
      @JsonKey(name: 'DoseQuantity') Quantity? doseQuantity,
      @JsonKey(name: 'RateRatio') RateRatio? rateRatio,
      @JsonKey(name: 'RateRange') Range? rateRange,
      @JsonKey(name: 'RateQuantity') Quantity? rateQuantity});

  $CodeableConceptCopyWith<$Res>? get type;
  $RangeCopyWith<$Res>? get doseRange;
  $QuantityCopyWith<$Res>? get doseQuantity;
  $RateRatioCopyWith<$Res>? get rateRatio;
  $RangeCopyWith<$Res>? get rateRange;
  $QuantityCopyWith<$Res>? get rateQuantity;
}

/// @nodoc
class _$DosageDoseAndRateCopyWithImpl<$Res, $Val extends DosageDoseAndRate>
    implements $DosageDoseAndRateCopyWith<$Res> {
  _$DosageDoseAndRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? doseRange = freezed,
    Object? doseQuantity = freezed,
    Object? rateRatio = freezed,
    Object? rateRange = freezed,
    Object? rateQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      doseRange: freezed == doseRange
          ? _value.doseRange
          : doseRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      doseQuantity: freezed == doseQuantity
          ? _value.doseQuantity
          : doseQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      rateRatio: freezed == rateRatio
          ? _value.rateRatio
          : rateRatio // ignore: cast_nullable_to_non_nullable
              as RateRatio?,
      rateRange: freezed == rateRange
          ? _value.rateRange
          : rateRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      rateQuantity: freezed == rateQuantity
          ? _value.rateQuantity
          : rateQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res>? get doseRange {
    if (_value.doseRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.doseRange!, (value) {
      return _then(_value.copyWith(doseRange: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get doseQuantity {
    if (_value.doseQuantity == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.doseQuantity!, (value) {
      return _then(_value.copyWith(doseQuantity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateRatioCopyWith<$Res>? get rateRatio {
    if (_value.rateRatio == null) {
      return null;
    }

    return $RateRatioCopyWith<$Res>(_value.rateRatio!, (value) {
      return _then(_value.copyWith(rateRatio: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res>? get rateRange {
    if (_value.rateRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.rateRange!, (value) {
      return _then(_value.copyWith(rateRange: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get rateQuantity {
    if (_value.rateQuantity == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.rateQuantity!, (value) {
      return _then(_value.copyWith(rateQuantity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DosageDoseAndRateCopyWith<$Res>
    implements $DosageDoseAndRateCopyWith<$Res> {
  factory _$$_DosageDoseAndRateCopyWith(_$_DosageDoseAndRate value,
          $Res Function(_$_DosageDoseAndRate) then) =
      __$$_DosageDoseAndRateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Type') CodeableConcept? type,
      @JsonKey(name: 'DoseRange') Range? doseRange,
      @JsonKey(name: 'DoseQuantity') Quantity? doseQuantity,
      @JsonKey(name: 'RateRatio') RateRatio? rateRatio,
      @JsonKey(name: 'RateRange') Range? rateRange,
      @JsonKey(name: 'RateQuantity') Quantity? rateQuantity});

  @override
  $CodeableConceptCopyWith<$Res>? get type;
  @override
  $RangeCopyWith<$Res>? get doseRange;
  @override
  $QuantityCopyWith<$Res>? get doseQuantity;
  @override
  $RateRatioCopyWith<$Res>? get rateRatio;
  @override
  $RangeCopyWith<$Res>? get rateRange;
  @override
  $QuantityCopyWith<$Res>? get rateQuantity;
}

/// @nodoc
class __$$_DosageDoseAndRateCopyWithImpl<$Res>
    extends _$DosageDoseAndRateCopyWithImpl<$Res, _$_DosageDoseAndRate>
    implements _$$_DosageDoseAndRateCopyWith<$Res> {
  __$$_DosageDoseAndRateCopyWithImpl(
      _$_DosageDoseAndRate _value, $Res Function(_$_DosageDoseAndRate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? doseRange = freezed,
    Object? doseQuantity = freezed,
    Object? rateRatio = freezed,
    Object? rateRange = freezed,
    Object? rateQuantity = freezed,
  }) {
    return _then(_$_DosageDoseAndRate(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      doseRange: freezed == doseRange
          ? _value.doseRange
          : doseRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      doseQuantity: freezed == doseQuantity
          ? _value.doseQuantity
          : doseQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      rateRatio: freezed == rateRatio
          ? _value.rateRatio
          : rateRatio // ignore: cast_nullable_to_non_nullable
              as RateRatio?,
      rateRange: freezed == rateRange
          ? _value.rateRange
          : rateRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      rateQuantity: freezed == rateQuantity
          ? _value.rateQuantity
          : rateQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DosageDoseAndRate implements _DosageDoseAndRate {
  _$_DosageDoseAndRate(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'DoseRange') this.doseRange,
      @JsonKey(name: 'DoseQuantity') this.doseQuantity,
      @JsonKey(name: 'RateRatio') this.rateRatio,
      @JsonKey(name: 'RateRange') this.rateRange,
      @JsonKey(name: 'RateQuantity') this.rateQuantity});

  factory _$_DosageDoseAndRate.fromJson(Map<String, dynamic> json) =>
      _$$_DosageDoseAndRateFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Type')
  final CodeableConcept? type;
  @override
  @JsonKey(name: 'DoseRange')
  final Range? doseRange;
  @override
  @JsonKey(name: 'DoseQuantity')
  final Quantity? doseQuantity;
  @override
  @JsonKey(name: 'RateRatio')
  final RateRatio? rateRatio;
  @override
  @JsonKey(name: 'RateRange')
  final Range? rateRange;
  @override
  @JsonKey(name: 'RateQuantity')
  final Quantity? rateQuantity;

  @override
  String toString() {
    return 'DosageDoseAndRate(id: $id, type: $type, doseRange: $doseRange, doseQuantity: $doseQuantity, rateRatio: $rateRatio, rateRange: $rateRange, rateQuantity: $rateQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DosageDoseAndRate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.doseRange, doseRange) ||
                other.doseRange == doseRange) &&
            (identical(other.doseQuantity, doseQuantity) ||
                other.doseQuantity == doseQuantity) &&
            (identical(other.rateRatio, rateRatio) ||
                other.rateRatio == rateRatio) &&
            (identical(other.rateRange, rateRange) ||
                other.rateRange == rateRange) &&
            (identical(other.rateQuantity, rateQuantity) ||
                other.rateQuantity == rateQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, doseRange,
      doseQuantity, rateRatio, rateRange, rateQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DosageDoseAndRateCopyWith<_$_DosageDoseAndRate> get copyWith =>
      __$$_DosageDoseAndRateCopyWithImpl<_$_DosageDoseAndRate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DosageDoseAndRateToJson(
      this,
    );
  }
}

abstract class _DosageDoseAndRate implements DosageDoseAndRate {
  factory _DosageDoseAndRate(
          {@JsonKey(name: 'ID') final String? id,
          @JsonKey(name: 'Type') final CodeableConcept? type,
          @JsonKey(name: 'DoseRange') final Range? doseRange,
          @JsonKey(name: 'DoseQuantity') final Quantity? doseQuantity,
          @JsonKey(name: 'RateRatio') final RateRatio? rateRatio,
          @JsonKey(name: 'RateRange') final Range? rateRange,
          @JsonKey(name: 'RateQuantity') final Quantity? rateQuantity}) =
      _$_DosageDoseAndRate;

  factory _DosageDoseAndRate.fromJson(Map<String, dynamic> json) =
      _$_DosageDoseAndRate.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Type')
  CodeableConcept? get type;
  @override
  @JsonKey(name: 'DoseRange')
  Range? get doseRange;
  @override
  @JsonKey(name: 'DoseQuantity')
  Quantity? get doseQuantity;
  @override
  @JsonKey(name: 'RateRatio')
  RateRatio? get rateRatio;
  @override
  @JsonKey(name: 'RateRange')
  Range? get rateRange;
  @override
  @JsonKey(name: 'RateQuantity')
  Quantity? get rateQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_DosageDoseAndRateCopyWith<_$_DosageDoseAndRate> get copyWith =>
      throw _privateConstructorUsedError;
}

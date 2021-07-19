// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'fhir.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attester _$AttesterFromJson(Map<String, dynamic> json) {
  return _Attester.fromJson(json);
}

/// @nodoc
class _$AttesterTearOff {
  const _$AttesterTearOff();

  _Attester call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode}) {
    return _Attester(
      id: id,
      mode: mode,
    );
  }

  Attester fromJson(Map<String, Object> json) {
    return Attester.fromJson(json);
  }
}

/// @nodoc
const $Attester = _$AttesterTearOff();

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
      _$AttesterCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode});

  $CodeableConceptCopyWith<$Res>? get id;
}

/// @nodoc
class _$AttesterCopyWithImpl<$Res> implements $AttesterCopyWith<$Res> {
  _$AttesterCopyWithImpl(this._value, this._then);

  final Attester _value;
  // ignore: unused_field
  final $Res Function(Attester) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as CompositionAttesterModeEnum?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$AttesterCopyWith<$Res> implements $AttesterCopyWith<$Res> {
  factory _$AttesterCopyWith(_Attester value, $Res Function(_Attester) then) =
      __$AttesterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode});

  @override
  $CodeableConceptCopyWith<$Res>? get id;
}

/// @nodoc
class __$AttesterCopyWithImpl<$Res> extends _$AttesterCopyWithImpl<$Res>
    implements _$AttesterCopyWith<$Res> {
  __$AttesterCopyWithImpl(_Attester _value, $Res Function(_Attester) _then)
      : super(_value, (v) => _then(v as _Attester));

  @override
  _Attester get _value => super._value as _Attester;

  @override
  $Res call({
    Object? id = freezed,
    Object? mode = freezed,
  }) {
    return _then(_Attester(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      mode: mode == freezed
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
      _$_$_AttesterFromJson(json);

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
        (other is _Attester &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mode);

  @JsonKey(ignore: true)
  @override
  _$AttesterCopyWith<_Attester> get copyWith =>
      __$AttesterCopyWithImpl<_Attester>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AttesterToJson(this);
  }
}

abstract class _Attester implements Attester {
  factory _Attester(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode}) = _$_Attester;

  factory _Attester.fromJson(Map<String, dynamic> json) = _$_Attester.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Mode')
  CompositionAttesterModeEnum? get mode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttesterCopyWith<_Attester> get copyWith =>
      throw _privateConstructorUsedError;
}

RelatesTo _$RelatesToFromJson(Map<String, dynamic> json) {
  return _RelatesTo.fromJson(json);
}

/// @nodoc
class _$RelatesToTearOff {
  const _$RelatesToTearOff();

  _RelatesTo call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'TargetIdentifier') Identifier? targetIdentifier,
      @JsonKey(name: 'TargetReference') Reference? targetReference}) {
    return _RelatesTo(
      id: id,
      code: code,
      targetIdentifier: targetIdentifier,
      targetReference: targetReference,
    );
  }

  RelatesTo fromJson(Map<String, Object> json) {
    return RelatesTo.fromJson(json);
  }
}

/// @nodoc
const $RelatesTo = _$RelatesToTearOff();

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
      _$RelatesToCopyWithImpl<$Res>;
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
class _$RelatesToCopyWithImpl<$Res> implements $RelatesToCopyWith<$Res> {
  _$RelatesToCopyWithImpl(this._value, this._then);

  final RelatesTo _value;
  // ignore: unused_field
  final $Res Function(RelatesTo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? targetReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: targetIdentifier == freezed
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      targetReference: targetReference == freezed
          ? _value.targetReference
          : targetReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $IdentifierCopyWith<$Res>? get targetIdentifier {
    if (_value.targetIdentifier == null) {
      return null;
    }

    return $IdentifierCopyWith<$Res>(_value.targetIdentifier!, (value) {
      return _then(_value.copyWith(targetIdentifier: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get targetReference {
    if (_value.targetReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.targetReference!, (value) {
      return _then(_value.copyWith(targetReference: value));
    });
  }
}

/// @nodoc
abstract class _$RelatesToCopyWith<$Res> implements $RelatesToCopyWith<$Res> {
  factory _$RelatesToCopyWith(
          _RelatesTo value, $Res Function(_RelatesTo) then) =
      __$RelatesToCopyWithImpl<$Res>;
  @override
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
class __$RelatesToCopyWithImpl<$Res> extends _$RelatesToCopyWithImpl<$Res>
    implements _$RelatesToCopyWith<$Res> {
  __$RelatesToCopyWithImpl(_RelatesTo _value, $Res Function(_RelatesTo) _then)
      : super(_value, (v) => _then(v as _RelatesTo));

  @override
  _RelatesTo get _value => super._value as _RelatesTo;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? targetReference = freezed,
  }) {
    return _then(_RelatesTo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: targetIdentifier == freezed
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      targetReference: targetReference == freezed
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
      _$_$_RelatesToFromJson(json);

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
        (other is _RelatesTo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.targetIdentifier, targetIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.targetIdentifier, targetIdentifier)) &&
            (identical(other.targetReference, targetReference) ||
                const DeepCollectionEquality()
                    .equals(other.targetReference, targetReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(targetIdentifier) ^
      const DeepCollectionEquality().hash(targetReference);

  @JsonKey(ignore: true)
  @override
  _$RelatesToCopyWith<_RelatesTo> get copyWith =>
      __$RelatesToCopyWithImpl<_RelatesTo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RelatesToToJson(this);
  }
}

abstract class _RelatesTo implements RelatesTo {
  factory _RelatesTo(
          {@JsonKey(name: 'ID') CodeableConcept? id,
          @JsonKey(name: 'Code') String? code,
          @JsonKey(name: 'TargetIdentifier') Identifier? targetIdentifier,
          @JsonKey(name: 'TargetReference') Reference? targetReference}) =
      _$_RelatesTo;

  factory _RelatesTo.fromJson(Map<String, dynamic> json) =
      _$_RelatesTo.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'TargetIdentifier')
  Identifier? get targetIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'TargetReference')
  Reference? get targetReference => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RelatesToCopyWith<_RelatesTo> get copyWith =>
      throw _privateConstructorUsedError;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Period') Period? targetIdentifier,
      @JsonKey(name: 'Detail') List<Reference?>? detail}) {
    return _Event(
      id: id,
      code: code,
      targetIdentifier: targetIdentifier,
      detail: detail,
    );
  }

  Event fromJson(Map<String, Object> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

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
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Period') Period? targetIdentifier,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  $CodeableConceptCopyWith<$Res>? get id;
  $PeriodCopyWith<$Res>? get targetIdentifier;
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: targetIdentifier == freezed
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Period?,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get targetIdentifier {
    if (_value.targetIdentifier == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.targetIdentifier!, (value) {
      return _then(_value.copyWith(targetIdentifier: value));
    });
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
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
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? targetIdentifier = freezed,
    Object? detail = freezed,
  }) {
    return _then(_Event(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIdentifier: targetIdentifier == freezed
          ? _value.targetIdentifier
          : targetIdentifier // ignore: cast_nullable_to_non_nullable
              as Period?,
      detail: detail == freezed
          ? _value.detail
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
      @JsonKey(name: 'Detail') this.detail});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final CodeableConcept? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Period')
  final Period? targetIdentifier;
  @override
  @JsonKey(name: 'Detail')
  final List<Reference?>? detail;

  @override
  String toString() {
    return 'Event(id: $id, code: $code, targetIdentifier: $targetIdentifier, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.targetIdentifier, targetIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.targetIdentifier, targetIdentifier)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(targetIdentifier) ^
      const DeepCollectionEquality().hash(detail);

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  factory _Event(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Period') Period? targetIdentifier,
      @JsonKey(name: 'Detail') List<Reference?>? detail}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Period')
  Period? get targetIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}

Section _$SectionFromJson(Map<String, dynamic> json) {
  return _Section.fromJson(json);
}

/// @nodoc
class _$SectionTearOff {
  const _$SectionTearOff();

  _Section call(
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
      @JsonKey(name: 'Section') List<Section?>? section}) {
    return _Section(
      id: id,
      title: title,
      code: code,
      author: author,
      focus: focus,
      text: text,
      mode: mode,
      orderedBy: orderedBy,
      entry: entry,
      emptyReason: emptyReason,
      section: section,
    );
  }

  Section fromJson(Map<String, Object> json) {
    return Section.fromJson(json);
  }
}

/// @nodoc
const $Section = _$SectionTearOff();

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
      _$SectionCopyWithImpl<$Res>;
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
class _$SectionCopyWithImpl<$Res> implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._value, this._then);

  final Section _value;
  // ignore: unused_field
  final $Res Function(Section) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      focus: focus == freezed
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as Reference?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedBy: orderedBy == freezed
          ? _value.orderedBy
          : orderedBy // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      emptyReason: emptyReason == freezed
          ? _value.emptyReason
          : emptyReason // ignore: cast_nullable_to_non_nullable
              as Reference?,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as List<Section?>?,
    ));
  }

  @override
  $ReferenceCopyWith<$Res>? get focus {
    if (_value.focus == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.focus!, (value) {
      return _then(_value.copyWith(focus: value));
    });
  }

  @override
  $NarrativeCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $NarrativeCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get orderedBy {
    if (_value.orderedBy == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.orderedBy!, (value) {
      return _then(_value.copyWith(orderedBy: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get emptyReason {
    if (_value.emptyReason == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.emptyReason!, (value) {
      return _then(_value.copyWith(emptyReason: value));
    });
  }
}

/// @nodoc
abstract class _$SectionCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$SectionCopyWith(_Section value, $Res Function(_Section) then) =
      __$SectionCopyWithImpl<$Res>;
  @override
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
class __$SectionCopyWithImpl<$Res> extends _$SectionCopyWithImpl<$Res>
    implements _$SectionCopyWith<$Res> {
  __$SectionCopyWithImpl(_Section _value, $Res Function(_Section) _then)
      : super(_value, (v) => _then(v as _Section));

  @override
  _Section get _value => super._value as _Section;

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
    return _then(_Section(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      focus: focus == freezed
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as Reference?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedBy: orderedBy == freezed
          ? _value.orderedBy
          : orderedBy // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      emptyReason: emptyReason == freezed
          ? _value.emptyReason
          : emptyReason // ignore: cast_nullable_to_non_nullable
              as Reference?,
      section: section == freezed
          ? _value.section
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
      @JsonKey(name: 'Author') this.author,
      @JsonKey(name: 'Focus') this.focus,
      @JsonKey(name: 'Text') this.text,
      @JsonKey(name: 'Mode') this.mode,
      @JsonKey(name: 'OrderedBy') this.orderedBy,
      @JsonKey(name: 'Entry') this.entry,
      @JsonKey(name: 'EmptyReason') this.emptyReason,
      @JsonKey(name: 'Section') this.section});

  factory _$_Section.fromJson(Map<String, dynamic> json) =>
      _$_$_SectionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Author')
  final List<Reference?>? author;
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
  @override
  @JsonKey(name: 'Entry')
  final List<Reference?>? entry;
  @override
  @JsonKey(name: 'EmptyReason')
  final Reference? emptyReason;
  @override
  @JsonKey(name: 'Section')
  final List<Section?>? section;

  @override
  String toString() {
    return 'Section(id: $id, title: $title, code: $code, author: $author, focus: $focus, text: $text, mode: $mode, orderedBy: $orderedBy, entry: $entry, emptyReason: $emptyReason, section: $section)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Section &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.focus, focus) ||
                const DeepCollectionEquality().equals(other.focus, focus)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)) &&
            (identical(other.orderedBy, orderedBy) ||
                const DeepCollectionEquality()
                    .equals(other.orderedBy, orderedBy)) &&
            (identical(other.entry, entry) ||
                const DeepCollectionEquality().equals(other.entry, entry)) &&
            (identical(other.emptyReason, emptyReason) ||
                const DeepCollectionEquality()
                    .equals(other.emptyReason, emptyReason)) &&
            (identical(other.section, section) ||
                const DeepCollectionEquality().equals(other.section, section)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(focus) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(orderedBy) ^
      const DeepCollectionEquality().hash(entry) ^
      const DeepCollectionEquality().hash(emptyReason) ^
      const DeepCollectionEquality().hash(section);

  @JsonKey(ignore: true)
  @override
  _$SectionCopyWith<_Section> get copyWith =>
      __$SectionCopyWithImpl<_Section>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SectionToJson(this);
  }
}

abstract class _Section implements Section {
  factory _Section(
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
      @JsonKey(name: 'Section') List<Section?>? section}) = _$_Section;

  factory _Section.fromJson(Map<String, dynamic> json) = _$_Section.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Author')
  List<Reference?>? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Focus')
  Reference? get focus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Mode')
  String? get mode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'OrderedBy')
  CodeableConcept? get orderedBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Entry')
  List<Reference?>? get entry => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'EmptyReason')
  Reference? get emptyReason => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Section')
  List<Section?>? get section => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SectionCopyWith<_Section> get copyWith =>
      throw _privateConstructorUsedError;
}

Age _$AgeFromJson(Map<String, dynamic> json) {
  return _Age.fromJson(json);
}

/// @nodoc
class _$AgeTearOff {
  const _$AgeTearOff();

  _Age call(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code}) {
    return _Age(
      id: id,
      value: value,
      comparator: comparator,
      unit: unit,
      system: system,
      code: code,
    );
  }

  Age fromJson(Map<String, Object> json) {
    return Age.fromJson(json);
  }
}

/// @nodoc
const $Age = _$AgeTearOff();

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
      _$AgeCopyWithImpl<$Res>;
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
class _$AgeCopyWithImpl<$Res> implements $AgeCopyWith<$Res> {
  _$AgeCopyWithImpl(this._value, this._then);

  final Age _value;
  // ignore: unused_field
  final $Res Function(Age) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: comparator == freezed
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$AgeCopyWith<$Res> implements $AgeCopyWith<$Res> {
  factory _$AgeCopyWith(_Age value, $Res Function(_Age) then) =
      __$AgeCopyWithImpl<$Res>;
  @override
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
class __$AgeCopyWithImpl<$Res> extends _$AgeCopyWithImpl<$Res>
    implements _$AgeCopyWith<$Res> {
  __$AgeCopyWithImpl(_Age _value, $Res Function(_Age) _then)
      : super(_value, (v) => _then(v as _Age));

  @override
  _Age get _value => super._value as _Age;

  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? comparator = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_Age(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: comparator == freezed
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
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

  factory _$_Age.fromJson(Map<String, dynamic> json) => _$_$_AgeFromJson(json);

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
        (other is _Age &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.comparator, comparator) ||
                const DeepCollectionEquality()
                    .equals(other.comparator, comparator)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(comparator) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(system) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$AgeCopyWith<_Age> get copyWith =>
      __$AgeCopyWithImpl<_Age>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AgeToJson(this);
  }
}

abstract class _Age implements Age {
  factory _Age(
      {@JsonKey(name: 'ID') CodeableConcept? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code}) = _$_Age;

  factory _Age.fromJson(Map<String, dynamic> json) = _$_Age.fromJson;

  @override
  @JsonKey(name: 'ID')
  CodeableConcept? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Value')
  double? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Comparator')
  ComparatorEnum? get comparator => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AgeCopyWith<_Age> get copyWith => throw _privateConstructorUsedError;
}

Quantity _$QuantityFromJson(Map<String, dynamic> json) {
  return _Quantity.fromJson(json);
}

/// @nodoc
class _$QuantityTearOff {
  const _$QuantityTearOff();

  _Quantity call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code}) {
    return _Quantity(
      id: id,
      value: value,
      comparator: comparator,
      unit: unit,
      system: system,
      code: code,
    );
  }

  Quantity fromJson(Map<String, Object> json) {
    return Quantity.fromJson(json);
  }
}

/// @nodoc
const $Quantity = _$QuantityTearOff();

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
      _$QuantityCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class _$QuantityCopyWithImpl<$Res> implements $QuantityCopyWith<$Res> {
  _$QuantityCopyWithImpl(this._value, this._then);

  final Quantity _value;
  // ignore: unused_field
  final $Res Function(Quantity) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: comparator == freezed
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QuantityCopyWith<$Res> implements $QuantityCopyWith<$Res> {
  factory _$QuantityCopyWith(_Quantity value, $Res Function(_Quantity) then) =
      __$QuantityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class __$QuantityCopyWithImpl<$Res> extends _$QuantityCopyWithImpl<$Res>
    implements _$QuantityCopyWith<$Res> {
  __$QuantityCopyWithImpl(_Quantity _value, $Res Function(_Quantity) _then)
      : super(_value, (v) => _then(v as _Quantity));

  @override
  _Quantity get _value => super._value as _Quantity;

  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? comparator = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_Quantity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      comparator: comparator == freezed
          ? _value.comparator
          : comparator // ignore: cast_nullable_to_non_nullable
              as ComparatorEnum?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
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
      _$_$_QuantityFromJson(json);

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
        (other is _Quantity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.comparator, comparator) ||
                const DeepCollectionEquality()
                    .equals(other.comparator, comparator)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(comparator) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(system) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$QuantityCopyWith<_Quantity> get copyWith =>
      __$QuantityCopyWithImpl<_Quantity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuantityToJson(this);
  }
}

abstract class _Quantity implements Quantity {
  factory _Quantity(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Code') String? code}) = _$_Quantity;

  factory _Quantity.fromJson(Map<String, dynamic> json) = _$_Quantity.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Value')
  double? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Comparator')
  ComparatorEnum? get comparator => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuantityCopyWith<_Quantity> get copyWith =>
      throw _privateConstructorUsedError;
}

Stage _$StageFromJson(Map<String, dynamic> json) {
  return _Stage.fromJson(json);
}

/// @nodoc
class _$StageTearOff {
  const _$StageTearOff();

  _Stage call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Summary') CodeableConcept? summary,
      @JsonKey(name: 'Assessment') List<Reference?>? assessment,
      @JsonKey(name: 'Type') Reference? type}) {
    return _Stage(
      id: id,
      summary: summary,
      assessment: assessment,
      type: type,
    );
  }

  Stage fromJson(Map<String, Object> json) {
    return Stage.fromJson(json);
  }
}

/// @nodoc
const $Stage = _$StageTearOff();

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
      _$StageCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Summary') CodeableConcept? summary,
      @JsonKey(name: 'Assessment') List<Reference?>? assessment,
      @JsonKey(name: 'Type') Reference? type});

  $CodeableConceptCopyWith<$Res>? get summary;
  $ReferenceCopyWith<$Res>? get type;
}

/// @nodoc
class _$StageCopyWithImpl<$Res> implements $StageCopyWith<$Res> {
  _$StageCopyWithImpl(this._value, this._then);

  final Stage _value;
  // ignore: unused_field
  final $Res Function(Stage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? summary = freezed,
    Object? assessment = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      assessment: assessment == freezed
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
abstract class _$StageCopyWith<$Res> implements $StageCopyWith<$Res> {
  factory _$StageCopyWith(_Stage value, $Res Function(_Stage) then) =
      __$StageCopyWithImpl<$Res>;
  @override
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
class __$StageCopyWithImpl<$Res> extends _$StageCopyWithImpl<$Res>
    implements _$StageCopyWith<$Res> {
  __$StageCopyWithImpl(_Stage _value, $Res Function(_Stage) _then)
      : super(_value, (v) => _then(v as _Stage));

  @override
  _Stage get _value => super._value as _Stage;

  @override
  $Res call({
    Object? id = freezed,
    Object? summary = freezed,
    Object? assessment = freezed,
    Object? type = freezed,
  }) {
    return _then(_Stage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      assessment: assessment == freezed
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      type: type == freezed
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
      @JsonKey(name: 'Assessment') this.assessment,
      @JsonKey(name: 'Type') this.type});

  factory _$_Stage.fromJson(Map<String, dynamic> json) =>
      _$_$_StageFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Summary')
  final CodeableConcept? summary;
  @override
  @JsonKey(name: 'Assessment')
  final List<Reference?>? assessment;
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
        (other is _Stage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.assessment, assessment) ||
                const DeepCollectionEquality()
                    .equals(other.assessment, assessment)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(assessment) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$StageCopyWith<_Stage> get copyWith =>
      __$StageCopyWithImpl<_Stage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StageToJson(this);
  }
}

abstract class _Stage implements Stage {
  factory _Stage(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Summary') CodeableConcept? summary,
      @JsonKey(name: 'Assessment') List<Reference?>? assessment,
      @JsonKey(name: 'Type') Reference? type}) = _$_Stage;

  factory _Stage.fromJson(Map<String, dynamic> json) = _$_Stage.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Summary')
  CodeableConcept? get summary => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Assessment')
  List<Reference?>? get assessment => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Type')
  Reference? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StageCopyWith<_Stage> get copyWith => throw _privateConstructorUsedError;
}

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return _Evidence.fromJson(json);
}

/// @nodoc
class _$EvidenceTearOff {
  const _$EvidenceTearOff();

  _Evidence call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'Detail') List<Reference?>? detail}) {
    return _Evidence(
      id: id,
      code: code,
      detail: detail,
    );
  }

  Evidence fromJson(Map<String, Object> json) {
    return Evidence.fromJson(json);
  }
}

/// @nodoc
const $Evidence = _$EvidenceTearOff();

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
      _$EvidenceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  $CodeableConceptCopyWith<$Res>? get code;
}

/// @nodoc
class _$EvidenceCopyWithImpl<$Res> implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._value, this._then);

  final Evidence _value;
  // ignore: unused_field
  final $Res Function(Evidence) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value));
    });
  }
}

/// @nodoc
abstract class _$EvidenceCopyWith<$Res> implements $EvidenceCopyWith<$Res> {
  factory _$EvidenceCopyWith(_Evidence value, $Res Function(_Evidence) then) =
      __$EvidenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'Detail') List<Reference?>? detail});

  @override
  $CodeableConceptCopyWith<$Res>? get code;
}

/// @nodoc
class __$EvidenceCopyWithImpl<$Res> extends _$EvidenceCopyWithImpl<$Res>
    implements _$EvidenceCopyWith<$Res> {
  __$EvidenceCopyWithImpl(_Evidence _value, $Res Function(_Evidence) _then)
      : super(_value, (v) => _then(v as _Evidence));

  @override
  _Evidence get _value => super._value as _Evidence;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? detail = freezed,
  }) {
    return _then(_Evidence(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      detail: detail == freezed
          ? _value.detail
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
      @JsonKey(name: 'Detail') this.detail});

  factory _$_Evidence.fromJson(Map<String, dynamic> json) =>
      _$_$_EvidenceFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'Detail')
  final List<Reference?>? detail;

  @override
  String toString() {
    return 'Evidence(id: $id, code: $code, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Evidence &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(detail);

  @JsonKey(ignore: true)
  @override
  _$EvidenceCopyWith<_Evidence> get copyWith =>
      __$EvidenceCopyWithImpl<_Evidence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EvidenceToJson(this);
  }
}

abstract class _Evidence implements Evidence {
  factory _Evidence(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'Detail') List<Reference?>? detail}) = _$_Evidence;

  factory _Evidence.fromJson(Map<String, dynamic> json) = _$_Evidence.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Detail')
  List<Reference?>? get detail => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EvidenceCopyWith<_Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

Composition _$CompositionFromJson(Map<String, dynamic> json) {
  return _Composition.fromJson(json);
}

/// @nodoc
class _$CompositionTearOff {
  const _$CompositionTearOff();

  _Composition call(
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
      @JsonKey(name: 'Section') List<Section?>? section}) {
    return _Composition(
      id: id,
      identifier: identifier,
      status: status,
      type: type,
      category: category,
      subject: subject,
      encounter: encounter,
      date: date,
      author: author,
      title: title,
      confidentiality: confidentiality,
      attester: attester,
      custodian: custodian,
      relatesTo: relatesTo,
      event: event,
      section: section,
    );
  }

  Composition fromJson(Map<String, Object> json) {
    return Composition.fromJson(json);
  }
}

/// @nodoc
const $Composition = _$CompositionTearOff();

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
      _$CompositionCopyWithImpl<$Res>;
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
class _$CompositionCopyWithImpl<$Res> implements $CompositionCopyWith<$Res> {
  _$CompositionCopyWithImpl(this._value, this._then);

  final Composition _value;
  // ignore: unused_field
  final $Res Function(Composition) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CompositionStatusEnum?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      confidentiality: confidentiality == freezed
          ? _value.confidentiality
          : confidentiality // ignore: cast_nullable_to_non_nullable
              as String?,
      attester: attester == freezed
          ? _value.attester
          : attester // ignore: cast_nullable_to_non_nullable
              as List<Attester?>?,
      custodian: custodian == freezed
          ? _value.custodian
          : custodian // ignore: cast_nullable_to_non_nullable
              as Reference?,
      relatesTo: relatesTo == freezed
          ? _value.relatesTo
          : relatesTo // ignore: cast_nullable_to_non_nullable
              as List<RelatesTo?>?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as List<Event?>?,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as List<Section?>?,
    ));
  }

  @override
  $IdentifierCopyWith<$Res>? get identifier {
    if (_value.identifier == null) {
      return null;
    }

    return $IdentifierCopyWith<$Res>(_value.identifier!, (value) {
      return _then(_value.copyWith(identifier: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get encounter {
    if (_value.encounter == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.encounter!, (value) {
      return _then(_value.copyWith(encounter: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get custodian {
    if (_value.custodian == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.custodian!, (value) {
      return _then(_value.copyWith(custodian: value));
    });
  }
}

/// @nodoc
abstract class _$CompositionCopyWith<$Res>
    implements $CompositionCopyWith<$Res> {
  factory _$CompositionCopyWith(
          _Composition value, $Res Function(_Composition) then) =
      __$CompositionCopyWithImpl<$Res>;
  @override
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
class __$CompositionCopyWithImpl<$Res> extends _$CompositionCopyWithImpl<$Res>
    implements _$CompositionCopyWith<$Res> {
  __$CompositionCopyWithImpl(
      _Composition _value, $Res Function(_Composition) _then)
      : super(_value, (v) => _then(v as _Composition));

  @override
  _Composition get _value => super._value as _Composition;

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
    return _then(_Composition(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CompositionStatusEnum?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      confidentiality: confidentiality == freezed
          ? _value.confidentiality
          : confidentiality // ignore: cast_nullable_to_non_nullable
              as String?,
      attester: attester == freezed
          ? _value.attester
          : attester // ignore: cast_nullable_to_non_nullable
              as List<Attester?>?,
      custodian: custodian == freezed
          ? _value.custodian
          : custodian // ignore: cast_nullable_to_non_nullable
              as Reference?,
      relatesTo: relatesTo == freezed
          ? _value.relatesTo
          : relatesTo // ignore: cast_nullable_to_non_nullable
              as List<RelatesTo?>?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as List<Event?>?,
      section: section == freezed
          ? _value.section
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
      @JsonKey(name: 'Category') this.category,
      @JsonKey(name: 'Subject') this.subject,
      @JsonKey(name: 'Encounter') this.encounter,
      @JsonKey(name: 'Date') this.date,
      @JsonKey(name: 'Author') this.author,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Confidentiality') this.confidentiality,
      @JsonKey(name: 'Attester') this.attester,
      @JsonKey(name: 'Custodian') this.custodian,
      @JsonKey(name: 'RelatesTo') this.relatesTo,
      @JsonKey(name: 'Event') this.event,
      @JsonKey(name: 'Section') this.section});

  factory _$_Composition.fromJson(Map<String, dynamic> json) =>
      _$_$_CompositionFromJson(json);

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
  @override
  @JsonKey(name: 'Category')
  final List<CodeableConcept?>? category;
  @override
  @JsonKey(name: 'Subject')
  final Reference? subject;
  @override
  @JsonKey(name: 'Encounter')
  final Reference? encounter;
  @override
  @JsonKey(name: 'Date')
  final String? date;
  @override
  @JsonKey(name: 'Author')
  final List<Reference?>? author;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Confidentiality')
  final String? confidentiality;
  @override
  @JsonKey(name: 'Attester')
  final List<Attester?>? attester;
  @override
  @JsonKey(name: 'Custodian')
  final Reference? custodian;
  @override
  @JsonKey(name: 'RelatesTo')
  final List<RelatesTo?>? relatesTo;
  @override
  @JsonKey(name: 'Event')
  final List<Event?>? event;
  @override
  @JsonKey(name: 'Section')
  final List<Section?>? section;

  @override
  String toString() {
    return 'Composition(id: $id, identifier: $identifier, status: $status, type: $type, category: $category, subject: $subject, encounter: $encounter, date: $date, author: $author, title: $title, confidentiality: $confidentiality, attester: $attester, custodian: $custodian, relatesTo: $relatesTo, event: $event, section: $section)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Composition &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.encounter, encounter) ||
                const DeepCollectionEquality()
                    .equals(other.encounter, encounter)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.confidentiality, confidentiality) ||
                const DeepCollectionEquality()
                    .equals(other.confidentiality, confidentiality)) &&
            (identical(other.attester, attester) ||
                const DeepCollectionEquality()
                    .equals(other.attester, attester)) &&
            (identical(other.custodian, custodian) ||
                const DeepCollectionEquality()
                    .equals(other.custodian, custodian)) &&
            (identical(other.relatesTo, relatesTo) ||
                const DeepCollectionEquality()
                    .equals(other.relatesTo, relatesTo)) &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.section, section) ||
                const DeepCollectionEquality().equals(other.section, section)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(encounter) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(confidentiality) ^
      const DeepCollectionEquality().hash(attester) ^
      const DeepCollectionEquality().hash(custodian) ^
      const DeepCollectionEquality().hash(relatesTo) ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(section);

  @JsonKey(ignore: true)
  @override
  _$CompositionCopyWith<_Composition> get copyWith =>
      __$CompositionCopyWithImpl<_Composition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompositionToJson(this);
  }
}

abstract class _Composition implements Composition {
  factory _Composition(
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
      @JsonKey(name: 'Section') List<Section?>? section}) = _$_Composition;

  factory _Composition.fromJson(Map<String, dynamic> json) =
      _$_Composition.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Identifier')
  Identifier? get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Status')
  CompositionStatusEnum? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Type')
  CodeableConcept? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Date')
  String? get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Author')
  List<Reference?>? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Confidentiality')
  String? get confidentiality => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Attester')
  List<Attester?>? get attester => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Custodian')
  Reference? get custodian => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'RelatesTo')
  List<RelatesTo?>? get relatesTo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Event')
  List<Event?>? get event => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Section')
  List<Section?>? get section => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CompositionCopyWith<_Composition> get copyWith =>
      throw _privateConstructorUsedError;
}

TimingRepeat _$TimingRepeatFromJson(Map<String, dynamic> json) {
  return _TimingRepeat.fromJson(json);
}

/// @nodoc
class _$TimingRepeatTearOff {
  const _$TimingRepeatTearOff();

  _TimingRepeat call(
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
      @JsonKey(name: 'Offset') int? offset}) {
    return _TimingRepeat(
      id: id,
      boundsDuration: boundsDuration,
      boundsRange: boundsRange,
      boundsPeriod: boundsPeriod,
      count: count,
      countMax: countMax,
      duration: duration,
      durationMax: durationMax,
      durationUnit: durationUnit,
      frequency: frequency,
      frequencyMax: frequencyMax,
      period: period,
      periodMax: periodMax,
      periodUnit: periodUnit,
      dayOfWeek: dayOfWeek,
      when: when,
      offset: offset,
    );
  }

  TimingRepeat fromJson(Map<String, Object> json) {
    return TimingRepeat.fromJson(json);
  }
}

/// @nodoc
const $TimingRepeat = _$TimingRepeatTearOff();

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
      _$TimingRepeatCopyWithImpl<$Res>;
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
class _$TimingRepeatCopyWithImpl<$Res> implements $TimingRepeatCopyWith<$Res> {
  _$TimingRepeatCopyWithImpl(this._value, this._then);

  final TimingRepeat _value;
  // ignore: unused_field
  final $Res Function(TimingRepeat) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boundsDuration: boundsDuration == freezed
          ? _value.boundsDuration
          : boundsDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      boundsRange: boundsRange == freezed
          ? _value.boundsRange
          : boundsRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      boundsPeriod: boundsPeriod == freezed
          ? _value.boundsPeriod
          : boundsPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      countMax: countMax == freezed
          ? _value.countMax
          : countMax // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      durationMax: durationMax == freezed
          ? _value.durationMax
          : durationMax // ignore: cast_nullable_to_non_nullable
              as double?,
      durationUnit: durationUnit == freezed
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      frequencyMax: frequencyMax == freezed
          ? _value.frequencyMax
          : frequencyMax // ignore: cast_nullable_to_non_nullable
              as int?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as double?,
      periodMax: periodMax == freezed
          ? _value.periodMax
          : periodMax // ignore: cast_nullable_to_non_nullable
              as double?,
      periodUnit: periodUnit == freezed
          ? _value.periodUnit
          : periodUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      dayOfWeek: dayOfWeek == freezed
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as DayOfWeek?,
      when: when == freezed
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $RangeCopyWith<$Res>? get boundsRange {
    if (_value.boundsRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.boundsRange!, (value) {
      return _then(_value.copyWith(boundsRange: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get boundsPeriod {
    if (_value.boundsPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.boundsPeriod!, (value) {
      return _then(_value.copyWith(boundsPeriod: value));
    });
  }
}

/// @nodoc
abstract class _$TimingRepeatCopyWith<$Res>
    implements $TimingRepeatCopyWith<$Res> {
  factory _$TimingRepeatCopyWith(
          _TimingRepeat value, $Res Function(_TimingRepeat) then) =
      __$TimingRepeatCopyWithImpl<$Res>;
  @override
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
class __$TimingRepeatCopyWithImpl<$Res> extends _$TimingRepeatCopyWithImpl<$Res>
    implements _$TimingRepeatCopyWith<$Res> {
  __$TimingRepeatCopyWithImpl(
      _TimingRepeat _value, $Res Function(_TimingRepeat) _then)
      : super(_value, (v) => _then(v as _TimingRepeat));

  @override
  _TimingRepeat get _value => super._value as _TimingRepeat;

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
    return _then(_TimingRepeat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boundsDuration: boundsDuration == freezed
          ? _value.boundsDuration
          : boundsDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      boundsRange: boundsRange == freezed
          ? _value.boundsRange
          : boundsRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      boundsPeriod: boundsPeriod == freezed
          ? _value.boundsPeriod
          : boundsPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      countMax: countMax == freezed
          ? _value.countMax
          : countMax // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      durationMax: durationMax == freezed
          ? _value.durationMax
          : durationMax // ignore: cast_nullable_to_non_nullable
              as double?,
      durationUnit: durationUnit == freezed
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      frequencyMax: frequencyMax == freezed
          ? _value.frequencyMax
          : frequencyMax // ignore: cast_nullable_to_non_nullable
              as int?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as double?,
      periodMax: periodMax == freezed
          ? _value.periodMax
          : periodMax // ignore: cast_nullable_to_non_nullable
              as double?,
      periodUnit: periodUnit == freezed
          ? _value.periodUnit
          : periodUnit // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      dayOfWeek: dayOfWeek == freezed
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as DayOfWeek?,
      when: when == freezed
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as TimingRepeatPeriodUnit?,
      offset: offset == freezed
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
      _$_$_TimingRepeatFromJson(json);

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
        (other is _TimingRepeat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.boundsDuration, boundsDuration) ||
                const DeepCollectionEquality()
                    .equals(other.boundsDuration, boundsDuration)) &&
            (identical(other.boundsRange, boundsRange) ||
                const DeepCollectionEquality()
                    .equals(other.boundsRange, boundsRange)) &&
            (identical(other.boundsPeriod, boundsPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.boundsPeriod, boundsPeriod)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.countMax, countMax) ||
                const DeepCollectionEquality()
                    .equals(other.countMax, countMax)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.durationMax, durationMax) ||
                const DeepCollectionEquality()
                    .equals(other.durationMax, durationMax)) &&
            (identical(other.durationUnit, durationUnit) ||
                const DeepCollectionEquality()
                    .equals(other.durationUnit, durationUnit)) &&
            (identical(other.frequency, frequency) ||
                const DeepCollectionEquality()
                    .equals(other.frequency, frequency)) &&
            (identical(other.frequencyMax, frequencyMax) ||
                const DeepCollectionEquality()
                    .equals(other.frequencyMax, frequencyMax)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.periodMax, periodMax) ||
                const DeepCollectionEquality()
                    .equals(other.periodMax, periodMax)) &&
            (identical(other.periodUnit, periodUnit) ||
                const DeepCollectionEquality()
                    .equals(other.periodUnit, periodUnit)) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfWeek, dayOfWeek)) &&
            (identical(other.when, when) ||
                const DeepCollectionEquality().equals(other.when, when)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(boundsDuration) ^
      const DeepCollectionEquality().hash(boundsRange) ^
      const DeepCollectionEquality().hash(boundsPeriod) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(countMax) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(durationMax) ^
      const DeepCollectionEquality().hash(durationUnit) ^
      const DeepCollectionEquality().hash(frequency) ^
      const DeepCollectionEquality().hash(frequencyMax) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(periodMax) ^
      const DeepCollectionEquality().hash(periodUnit) ^
      const DeepCollectionEquality().hash(dayOfWeek) ^
      const DeepCollectionEquality().hash(when) ^
      const DeepCollectionEquality().hash(offset);

  @JsonKey(ignore: true)
  @override
  _$TimingRepeatCopyWith<_TimingRepeat> get copyWith =>
      __$TimingRepeatCopyWithImpl<_TimingRepeat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimingRepeatToJson(this);
  }
}

abstract class _TimingRepeat implements TimingRepeat {
  factory _TimingRepeat(
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
      @JsonKey(name: 'Offset') int? offset}) = _$_TimingRepeat;

  factory _TimingRepeat.fromJson(Map<String, dynamic> json) =
      _$_TimingRepeat.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'BoundsDuration')
  Duration? get boundsDuration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'BoundsRange')
  Range? get boundsRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'BoundsPeriod')
  Period? get boundsPeriod => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Count')
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'CountMax')
  int? get countMax => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Duration')
  double? get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DurationMax')
  double? get durationMax => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DurationUnit')
  TimingRepeatPeriodUnit? get durationUnit =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Frequency')
  int? get frequency => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'FrequencyMax')
  int? get frequencyMax => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Period')
  double? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PeriodMax')
  double? get periodMax => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PeriodUnit')
  TimingRepeatPeriodUnit? get periodUnit => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DayOfWeek')
  DayOfWeek? get dayOfWeek => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'When')
  TimingRepeatPeriodUnit? get when => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Offset')
  int? get offset => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimingRepeatCopyWith<_TimingRepeat> get copyWith =>
      throw _privateConstructorUsedError;
}

Timing _$TimingFromJson(Map<String, dynamic> json) {
  return _Timing.fromJson(json);
}

/// @nodoc
class _$TimingTearOff {
  const _$TimingTearOff();

  _Timing call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Event') Duration? event,
      @JsonKey(name: 'Repeat') TimingRepeat? repeat,
      @JsonKey(name: 'Code') TimingCodes? code}) {
    return _Timing(
      id: id,
      event: event,
      repeat: repeat,
      code: code,
    );
  }

  Timing fromJson(Map<String, Object> json) {
    return Timing.fromJson(json);
  }
}

/// @nodoc
const $Timing = _$TimingTearOff();

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
      _$TimingCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Event') Duration? event,
      @JsonKey(name: 'Repeat') TimingRepeat? repeat,
      @JsonKey(name: 'Code') TimingCodes? code});

  $TimingRepeatCopyWith<$Res>? get repeat;
}

/// @nodoc
class _$TimingCopyWithImpl<$Res> implements $TimingCopyWith<$Res> {
  _$TimingCopyWithImpl(this._value, this._then);

  final Timing _value;
  // ignore: unused_field
  final $Res Function(Timing) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? repeat = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Duration?,
      repeat: repeat == freezed
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as TimingRepeat?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as TimingCodes?,
    ));
  }

  @override
  $TimingRepeatCopyWith<$Res>? get repeat {
    if (_value.repeat == null) {
      return null;
    }

    return $TimingRepeatCopyWith<$Res>(_value.repeat!, (value) {
      return _then(_value.copyWith(repeat: value));
    });
  }
}

/// @nodoc
abstract class _$TimingCopyWith<$Res> implements $TimingCopyWith<$Res> {
  factory _$TimingCopyWith(_Timing value, $Res Function(_Timing) then) =
      __$TimingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Event') Duration? event,
      @JsonKey(name: 'Repeat') TimingRepeat? repeat,
      @JsonKey(name: 'Code') TimingCodes? code});

  @override
  $TimingRepeatCopyWith<$Res>? get repeat;
}

/// @nodoc
class __$TimingCopyWithImpl<$Res> extends _$TimingCopyWithImpl<$Res>
    implements _$TimingCopyWith<$Res> {
  __$TimingCopyWithImpl(_Timing _value, $Res Function(_Timing) _then)
      : super(_value, (v) => _then(v as _Timing));

  @override
  _Timing get _value => super._value as _Timing;

  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? repeat = freezed,
    Object? code = freezed,
  }) {
    return _then(_Timing(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Duration?,
      repeat: repeat == freezed
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as TimingRepeat?,
      code: code == freezed
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
      _$_$_TimingFromJson(json);

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
        (other is _Timing &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.repeat, repeat) ||
                const DeepCollectionEquality().equals(other.repeat, repeat)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(repeat) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$TimingCopyWith<_Timing> get copyWith =>
      __$TimingCopyWithImpl<_Timing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimingToJson(this);
  }
}

abstract class _Timing implements Timing {
  factory _Timing(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Event') Duration? event,
      @JsonKey(name: 'Repeat') TimingRepeat? repeat,
      @JsonKey(name: 'Code') TimingCodes? code}) = _$_Timing;

  factory _Timing.fromJson(Map<String, dynamic> json) = _$_Timing.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Event')
  Duration? get event => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Repeat')
  TimingRepeat? get repeat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  TimingCodes? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimingCopyWith<_Timing> get copyWith => throw _privateConstructorUsedError;
}

RateRatio _$RateRatioFromJson(Map<String, dynamic> json) {
  return _RateRatio.fromJson(json);
}

/// @nodoc
class _$RateRatioTearOff {
  const _$RateRatioTearOff();

  _RateRatio call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Numerator') Quantity? numerator,
      @JsonKey(name: 'Denominator') Quantity? denominator}) {
    return _RateRatio(
      id: id,
      numerator: numerator,
      denominator: denominator,
    );
  }

  RateRatio fromJson(Map<String, Object> json) {
    return RateRatio.fromJson(json);
  }
}

/// @nodoc
const $RateRatio = _$RateRatioTearOff();

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
      _$RateRatioCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Numerator') Quantity? numerator,
      @JsonKey(name: 'Denominator') Quantity? denominator});

  $QuantityCopyWith<$Res>? get numerator;
  $QuantityCopyWith<$Res>? get denominator;
}

/// @nodoc
class _$RateRatioCopyWithImpl<$Res> implements $RateRatioCopyWith<$Res> {
  _$RateRatioCopyWithImpl(this._value, this._then);

  final RateRatio _value;
  // ignore: unused_field
  final $Res Function(RateRatio) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? numerator = freezed,
    Object? denominator = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numerator: numerator == freezed
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      denominator: denominator == freezed
          ? _value.denominator
          : denominator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ));
  }

  @override
  $QuantityCopyWith<$Res>? get numerator {
    if (_value.numerator == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.numerator!, (value) {
      return _then(_value.copyWith(numerator: value));
    });
  }

  @override
  $QuantityCopyWith<$Res>? get denominator {
    if (_value.denominator == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.denominator!, (value) {
      return _then(_value.copyWith(denominator: value));
    });
  }
}

/// @nodoc
abstract class _$RateRatioCopyWith<$Res> implements $RateRatioCopyWith<$Res> {
  factory _$RateRatioCopyWith(
          _RateRatio value, $Res Function(_RateRatio) then) =
      __$RateRatioCopyWithImpl<$Res>;
  @override
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
class __$RateRatioCopyWithImpl<$Res> extends _$RateRatioCopyWithImpl<$Res>
    implements _$RateRatioCopyWith<$Res> {
  __$RateRatioCopyWithImpl(_RateRatio _value, $Res Function(_RateRatio) _then)
      : super(_value, (v) => _then(v as _RateRatio));

  @override
  _RateRatio get _value => super._value as _RateRatio;

  @override
  $Res call({
    Object? id = freezed,
    Object? numerator = freezed,
    Object? denominator = freezed,
  }) {
    return _then(_RateRatio(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numerator: numerator == freezed
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      denominator: denominator == freezed
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
      _$_$_RateRatioFromJson(json);

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
        (other is _RateRatio &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.numerator, numerator) ||
                const DeepCollectionEquality()
                    .equals(other.numerator, numerator)) &&
            (identical(other.denominator, denominator) ||
                const DeepCollectionEquality()
                    .equals(other.denominator, denominator)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(numerator) ^
      const DeepCollectionEquality().hash(denominator);

  @JsonKey(ignore: true)
  @override
  _$RateRatioCopyWith<_RateRatio> get copyWith =>
      __$RateRatioCopyWithImpl<_RateRatio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RateRatioToJson(this);
  }
}

abstract class _RateRatio implements RateRatio {
  factory _RateRatio(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Numerator') Quantity? numerator,
      @JsonKey(name: 'Denominator') Quantity? denominator}) = _$_RateRatio;

  factory _RateRatio.fromJson(Map<String, dynamic> json) =
      _$_RateRatio.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Numerator')
  Quantity? get numerator => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Denominator')
  Quantity? get denominator => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RateRatioCopyWith<_RateRatio> get copyWith =>
      throw _privateConstructorUsedError;
}

DosageDoseAndRate _$DosageDoseAndRateFromJson(Map<String, dynamic> json) {
  return _DosageDoseAndRate.fromJson(json);
}

/// @nodoc
class _$DosageDoseAndRateTearOff {
  const _$DosageDoseAndRateTearOff();

  _DosageDoseAndRate call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Type') CodeableConcept? type,
      @JsonKey(name: 'DoseRange') Range? doseRange,
      @JsonKey(name: 'DoseQuantity') Quantity? doseQuantity,
      @JsonKey(name: 'RateRatio') RateRatio? rateRatio,
      @JsonKey(name: 'RateRange') Range? rateRange,
      @JsonKey(name: 'RateQuantity') Quantity? rateQuantity}) {
    return _DosageDoseAndRate(
      id: id,
      type: type,
      doseRange: doseRange,
      doseQuantity: doseQuantity,
      rateRatio: rateRatio,
      rateRange: rateRange,
      rateQuantity: rateQuantity,
    );
  }

  DosageDoseAndRate fromJson(Map<String, Object> json) {
    return DosageDoseAndRate.fromJson(json);
  }
}

/// @nodoc
const $DosageDoseAndRate = _$DosageDoseAndRateTearOff();

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
      _$DosageDoseAndRateCopyWithImpl<$Res>;
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
class _$DosageDoseAndRateCopyWithImpl<$Res>
    implements $DosageDoseAndRateCopyWith<$Res> {
  _$DosageDoseAndRateCopyWithImpl(this._value, this._then);

  final DosageDoseAndRate _value;
  // ignore: unused_field
  final $Res Function(DosageDoseAndRate) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      doseRange: doseRange == freezed
          ? _value.doseRange
          : doseRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      doseQuantity: doseQuantity == freezed
          ? _value.doseQuantity
          : doseQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      rateRatio: rateRatio == freezed
          ? _value.rateRatio
          : rateRatio // ignore: cast_nullable_to_non_nullable
              as RateRatio?,
      rateRange: rateRange == freezed
          ? _value.rateRange
          : rateRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      rateQuantity: rateQuantity == freezed
          ? _value.rateQuantity
          : rateQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value));
    });
  }

  @override
  $RangeCopyWith<$Res>? get doseRange {
    if (_value.doseRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.doseRange!, (value) {
      return _then(_value.copyWith(doseRange: value));
    });
  }

  @override
  $QuantityCopyWith<$Res>? get doseQuantity {
    if (_value.doseQuantity == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.doseQuantity!, (value) {
      return _then(_value.copyWith(doseQuantity: value));
    });
  }

  @override
  $RateRatioCopyWith<$Res>? get rateRatio {
    if (_value.rateRatio == null) {
      return null;
    }

    return $RateRatioCopyWith<$Res>(_value.rateRatio!, (value) {
      return _then(_value.copyWith(rateRatio: value));
    });
  }

  @override
  $RangeCopyWith<$Res>? get rateRange {
    if (_value.rateRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.rateRange!, (value) {
      return _then(_value.copyWith(rateRange: value));
    });
  }

  @override
  $QuantityCopyWith<$Res>? get rateQuantity {
    if (_value.rateQuantity == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.rateQuantity!, (value) {
      return _then(_value.copyWith(rateQuantity: value));
    });
  }
}

/// @nodoc
abstract class _$DosageDoseAndRateCopyWith<$Res>
    implements $DosageDoseAndRateCopyWith<$Res> {
  factory _$DosageDoseAndRateCopyWith(
          _DosageDoseAndRate value, $Res Function(_DosageDoseAndRate) then) =
      __$DosageDoseAndRateCopyWithImpl<$Res>;
  @override
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
class __$DosageDoseAndRateCopyWithImpl<$Res>
    extends _$DosageDoseAndRateCopyWithImpl<$Res>
    implements _$DosageDoseAndRateCopyWith<$Res> {
  __$DosageDoseAndRateCopyWithImpl(
      _DosageDoseAndRate _value, $Res Function(_DosageDoseAndRate) _then)
      : super(_value, (v) => _then(v as _DosageDoseAndRate));

  @override
  _DosageDoseAndRate get _value => super._value as _DosageDoseAndRate;

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
    return _then(_DosageDoseAndRate(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      doseRange: doseRange == freezed
          ? _value.doseRange
          : doseRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      doseQuantity: doseQuantity == freezed
          ? _value.doseQuantity
          : doseQuantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      rateRatio: rateRatio == freezed
          ? _value.rateRatio
          : rateRatio // ignore: cast_nullable_to_non_nullable
              as RateRatio?,
      rateRange: rateRange == freezed
          ? _value.rateRange
          : rateRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      rateQuantity: rateQuantity == freezed
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
      _$_$_DosageDoseAndRateFromJson(json);

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
        (other is _DosageDoseAndRate &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.doseRange, doseRange) ||
                const DeepCollectionEquality()
                    .equals(other.doseRange, doseRange)) &&
            (identical(other.doseQuantity, doseQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.doseQuantity, doseQuantity)) &&
            (identical(other.rateRatio, rateRatio) ||
                const DeepCollectionEquality()
                    .equals(other.rateRatio, rateRatio)) &&
            (identical(other.rateRange, rateRange) ||
                const DeepCollectionEquality()
                    .equals(other.rateRange, rateRange)) &&
            (identical(other.rateQuantity, rateQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.rateQuantity, rateQuantity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(doseRange) ^
      const DeepCollectionEquality().hash(doseQuantity) ^
      const DeepCollectionEquality().hash(rateRatio) ^
      const DeepCollectionEquality().hash(rateRange) ^
      const DeepCollectionEquality().hash(rateQuantity);

  @JsonKey(ignore: true)
  @override
  _$DosageDoseAndRateCopyWith<_DosageDoseAndRate> get copyWith =>
      __$DosageDoseAndRateCopyWithImpl<_DosageDoseAndRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DosageDoseAndRateToJson(this);
  }
}

abstract class _DosageDoseAndRate implements DosageDoseAndRate {
  factory _DosageDoseAndRate(
          {@JsonKey(name: 'ID') String? id,
          @JsonKey(name: 'Type') CodeableConcept? type,
          @JsonKey(name: 'DoseRange') Range? doseRange,
          @JsonKey(name: 'DoseQuantity') Quantity? doseQuantity,
          @JsonKey(name: 'RateRatio') RateRatio? rateRatio,
          @JsonKey(name: 'RateRange') Range? rateRange,
          @JsonKey(name: 'RateQuantity') Quantity? rateQuantity}) =
      _$_DosageDoseAndRate;

  factory _DosageDoseAndRate.fromJson(Map<String, dynamic> json) =
      _$_DosageDoseAndRate.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Type')
  CodeableConcept? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DoseRange')
  Range? get doseRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DoseQuantity')
  Quantity? get doseQuantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'RateRatio')
  RateRatio? get rateRatio => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'RateRange')
  Range? get rateRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'RateQuantity')
  Quantity? get rateQuantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DosageDoseAndRateCopyWith<_DosageDoseAndRate> get copyWith =>
      throw _privateConstructorUsedError;
}

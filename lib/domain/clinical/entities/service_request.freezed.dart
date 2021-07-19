// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'service_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestConnection _$ServiceRequestConnectionFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestConnection.fromJson(json);
}

/// @nodoc
class _$ServiceRequestConnectionTearOff {
  const _$ServiceRequestConnectionTearOff();

  _ServiceRequestConnection call(
      {@JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) {
    return _ServiceRequestConnection(
      edges: edges,
      pageInfo: pageInfo,
    );
  }

  ServiceRequestConnection fromJson(Map<String, Object> json) {
    return ServiceRequestConnection.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestConnection = _$ServiceRequestConnectionTearOff();

/// @nodoc
mixin _$ServiceRequestConnection {
  @JsonKey(name: 'edges')
  List<ServiceRequestEdge?>? get edges => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestConnectionCopyWith<ServiceRequestConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestConnectionCopyWith<$Res> {
  factory $ServiceRequestConnectionCopyWith(ServiceRequestConnection value,
          $Res Function(ServiceRequestConnection) then) =
      _$ServiceRequestConnectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$ServiceRequestConnectionCopyWithImpl<$Res>
    implements $ServiceRequestConnectionCopyWith<$Res> {
  _$ServiceRequestConnectionCopyWithImpl(this._value, this._then);

  final ServiceRequestConnection _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestConnection) _then;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestEdge?>?,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }

  @override
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceRequestConnectionCopyWith<$Res>
    implements $ServiceRequestConnectionCopyWith<$Res> {
  factory _$ServiceRequestConnectionCopyWith(_ServiceRequestConnection value,
          $Res Function(_ServiceRequestConnection) then) =
      __$ServiceRequestConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$ServiceRequestConnectionCopyWithImpl<$Res>
    extends _$ServiceRequestConnectionCopyWithImpl<$Res>
    implements _$ServiceRequestConnectionCopyWith<$Res> {
  __$ServiceRequestConnectionCopyWithImpl(_ServiceRequestConnection _value,
      $Res Function(_ServiceRequestConnection) _then)
      : super(_value, (v) => _then(v as _ServiceRequestConnection));

  @override
  _ServiceRequestConnection get _value =>
      super._value as _ServiceRequestConnection;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_ServiceRequestConnection(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestEdge?>?,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestConnection implements _ServiceRequestConnection {
  _$_ServiceRequestConnection(
      {@JsonKey(name: 'edges') this.edges,
      @JsonKey(name: 'pageInfo') this.pageInfo});

  factory _$_ServiceRequestConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestConnectionFromJson(json);

  @override
  @JsonKey(name: 'edges')
  final List<ServiceRequestEdge?>? edges;
  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;

  @override
  String toString() {
    return 'ServiceRequestConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceRequestConnection &&
            (identical(other.edges, edges) ||
                const DeepCollectionEquality().equals(other.edges, edges)) &&
            (identical(other.pageInfo, pageInfo) ||
                const DeepCollectionEquality()
                    .equals(other.pageInfo, pageInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(edges) ^
      const DeepCollectionEquality().hash(pageInfo);

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestConnectionCopyWith<_ServiceRequestConnection> get copyWith =>
      __$ServiceRequestConnectionCopyWithImpl<_ServiceRequestConnection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestConnectionToJson(this);
  }
}

abstract class _ServiceRequestConnection implements ServiceRequestConnection {
  factory _ServiceRequestConnection(
          {@JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
          @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) =
      _$_ServiceRequestConnection;

  factory _ServiceRequestConnection.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<ServiceRequestEdge?>? get edges => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestConnectionCopyWith<_ServiceRequestConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceRequestEdge _$ServiceRequestEdgeFromJson(Map<String, dynamic> json) {
  return _ServiceRequestEdge.fromJson(json);
}

/// @nodoc
class _$ServiceRequestEdgeTearOff {
  const _$ServiceRequestEdgeTearOff();

  _ServiceRequestEdge call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') ServiceRequest? node}) {
    return _ServiceRequestEdge(
      cursor: cursor,
      node: node,
    );
  }

  ServiceRequestEdge fromJson(Map<String, Object> json) {
    return ServiceRequestEdge.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestEdge = _$ServiceRequestEdgeTearOff();

/// @nodoc
mixin _$ServiceRequestEdge {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  ServiceRequest? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestEdgeCopyWith<ServiceRequestEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestEdgeCopyWith<$Res> {
  factory $ServiceRequestEdgeCopyWith(
          ServiceRequestEdge value, $Res Function(ServiceRequestEdge) then) =
      _$ServiceRequestEdgeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') ServiceRequest? node});

  $ServiceRequestCopyWith<$Res>? get node;
}

/// @nodoc
class _$ServiceRequestEdgeCopyWithImpl<$Res>
    implements $ServiceRequestEdgeCopyWith<$Res> {
  _$ServiceRequestEdgeCopyWithImpl(this._value, this._then);

  final ServiceRequestEdge _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestEdge) _then;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ServiceRequest?,
    ));
  }

  @override
  $ServiceRequestCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $ServiceRequestCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceRequestEdgeCopyWith<$Res>
    implements $ServiceRequestEdgeCopyWith<$Res> {
  factory _$ServiceRequestEdgeCopyWith(
          _ServiceRequestEdge value, $Res Function(_ServiceRequestEdge) then) =
      __$ServiceRequestEdgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') ServiceRequest? node});

  @override
  $ServiceRequestCopyWith<$Res>? get node;
}

/// @nodoc
class __$ServiceRequestEdgeCopyWithImpl<$Res>
    extends _$ServiceRequestEdgeCopyWithImpl<$Res>
    implements _$ServiceRequestEdgeCopyWith<$Res> {
  __$ServiceRequestEdgeCopyWithImpl(
      _ServiceRequestEdge _value, $Res Function(_ServiceRequestEdge) _then)
      : super(_value, (v) => _then(v as _ServiceRequestEdge));

  @override
  _ServiceRequestEdge get _value => super._value as _ServiceRequestEdge;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_ServiceRequestEdge(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ServiceRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestEdge implements _ServiceRequestEdge {
  _$_ServiceRequestEdge(
      {@JsonKey(name: 'cursor') this.cursor, @JsonKey(name: 'node') this.node});

  factory _$_ServiceRequestEdge.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestEdgeFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final ServiceRequest? node;

  @override
  String toString() {
    return 'ServiceRequestEdge(cursor: $cursor, node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceRequestEdge &&
            (identical(other.cursor, cursor) ||
                const DeepCollectionEquality().equals(other.cursor, cursor)) &&
            (identical(other.node, node) ||
                const DeepCollectionEquality().equals(other.node, node)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cursor) ^
      const DeepCollectionEquality().hash(node);

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestEdgeCopyWith<_ServiceRequestEdge> get copyWith =>
      __$ServiceRequestEdgeCopyWithImpl<_ServiceRequestEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestEdgeToJson(this);
  }
}

abstract class _ServiceRequestEdge implements ServiceRequestEdge {
  factory _ServiceRequestEdge(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') ServiceRequest? node}) = _$_ServiceRequestEdge;

  factory _ServiceRequestEdge.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestEdge.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  ServiceRequest? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestEdgeCopyWith<_ServiceRequestEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

/// @nodoc
class _$ServiceRequestTearOff {
  const _$ServiceRequestTearOff();

  _ServiceRequest call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status')
          String? status,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Category')
          List<CodeableConcept?>? category,
      @JsonKey(name: 'Requester')
          Reference? requester,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
          ServiceRequestIntentEnum? intent,
      @JsonKey(name: 'Priority')
          String? priority,
      @JsonKey(name: 'Subject')
          Reference? subject,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'SupportingInfo')
          List<Reference?>? supportingInfo,
      @JsonKey(name: 'Note')
          List<Annotation?>? note}) {
    return _ServiceRequest(
      id: id,
      status: status,
      text: text,
      identifier: identifier,
      category: category,
      requester: requester,
      code: code,
      intent: intent,
      priority: priority,
      subject: subject,
      encounter: encounter,
      supportingInfo: supportingInfo,
      note: note,
    );
  }

  ServiceRequest fromJson(Map<String, Object> json) {
    return ServiceRequest.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequest = _$ServiceRequestTearOff();

/// @nodoc
mixin _$ServiceRequest {
  /// The logical id of the resource, as used in the URL for the resource.
  /// Once assigned, this value never changes.
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The status of the order.
  @JsonKey(name: 'Status')
  String? get status => throw _privateConstructorUsedError;

  /// A human-readable narrative that contains a summary of the resource
  ///  and can be used to represent the content of the resource to a human.
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;

  /// A code that classifies the service for searching, sorting and display
  /// purposes (e.g. "Surgical Procedure").
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;

  /// The individual who initiated the request and has responsibility
  ///  for its activation.
  @JsonKey(name: 'Requester')
  Reference? get requester =>
      throw _privateConstructorUsedError; //A code that identifies a particular service (i.e., procedure,
//diagnostic investigation, or panel of investigations)
//that have been requested.
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;

  /// Whether the request is a proposal, plan, an original order
  /// or a reflex order.
  @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
  ServiceRequestIntentEnum? get intent => throw _privateConstructorUsedError;

  /// Indicates how quickly the ServiceRequest should be addressed with
  /// respect to other requests.
  @JsonKey(name: 'Priority')
  String? get priority => throw _privateConstructorUsedError;

  /// On whom or what the service is to be performed. This is usually a human
  ///  patient, but can also be requested on animals, groups of humans
  ///  or animals, devices such as dialysis machines, or even locations
  /// (typically for environmental scans).
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;

  /// An encounter that provides additional information about the healthcare
  ///  context in which this request is made.
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;

  /// Additional clinical information about the patient or specimen that may
  ///  influence the services or their interpretations.
  @JsonKey(name: 'SupportingInfo')
  List<Reference?>? get supportingInfo => throw _privateConstructorUsedError;

  /// Any other notes and comments made about the service request.
  ///  For example, internal billing notes.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestCopyWith<ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCopyWith<$Res> {
  factory $ServiceRequestCopyWith(
          ServiceRequest value, $Res Function(ServiceRequest) then) =
      _$ServiceRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status')
          String? status,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Category')
          List<CodeableConcept?>? category,
      @JsonKey(name: 'Requester')
          Reference? requester,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
          ServiceRequestIntentEnum? intent,
      @JsonKey(name: 'Priority')
          String? priority,
      @JsonKey(name: 'Subject')
          Reference? subject,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'SupportingInfo')
          List<Reference?>? supportingInfo,
      @JsonKey(name: 'Note')
          List<Annotation?>? note});

  $NarrativeCopyWith<$Res>? get text;
  $ReferenceCopyWith<$Res>? get requester;
  $CodeableConceptCopyWith<$Res>? get code;
  $ReferenceCopyWith<$Res>? get subject;
  $ReferenceCopyWith<$Res>? get encounter;
}

/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  final ServiceRequest _value;
  // ignore: unused_field
  final $Res Function(ServiceRequest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? text = freezed,
    Object? identifier = freezed,
    Object? category = freezed,
    Object? requester = freezed,
    Object? code = freezed,
    Object? intent = freezed,
    Object? priority = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? supportingInfo = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      requester: requester == freezed
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: intent == freezed
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as ServiceRequestIntentEnum?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInfo: supportingInfo == freezed
          ? _value.supportingInfo
          : supportingInfo // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ));
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
  $ReferenceCopyWith<$Res>? get requester {
    if (_value.requester == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.requester!, (value) {
      return _then(_value.copyWith(requester: value));
    });
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
}

/// @nodoc
abstract class _$ServiceRequestCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$ServiceRequestCopyWith(
          _ServiceRequest value, $Res Function(_ServiceRequest) then) =
      __$ServiceRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status')
          String? status,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Category')
          List<CodeableConcept?>? category,
      @JsonKey(name: 'Requester')
          Reference? requester,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
          ServiceRequestIntentEnum? intent,
      @JsonKey(name: 'Priority')
          String? priority,
      @JsonKey(name: 'Subject')
          Reference? subject,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'SupportingInfo')
          List<Reference?>? supportingInfo,
      @JsonKey(name: 'Note')
          List<Annotation?>? note});

  @override
  $NarrativeCopyWith<$Res>? get text;
  @override
  $ReferenceCopyWith<$Res>? get requester;
  @override
  $CodeableConceptCopyWith<$Res>? get code;
  @override
  $ReferenceCopyWith<$Res>? get subject;
  @override
  $ReferenceCopyWith<$Res>? get encounter;
}

/// @nodoc
class __$ServiceRequestCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res>
    implements _$ServiceRequestCopyWith<$Res> {
  __$ServiceRequestCopyWithImpl(
      _ServiceRequest _value, $Res Function(_ServiceRequest) _then)
      : super(_value, (v) => _then(v as _ServiceRequest));

  @override
  _ServiceRequest get _value => super._value as _ServiceRequest;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? text = freezed,
    Object? identifier = freezed,
    Object? category = freezed,
    Object? requester = freezed,
    Object? code = freezed,
    Object? intent = freezed,
    Object? priority = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? supportingInfo = freezed,
    Object? note = freezed,
  }) {
    return _then(_ServiceRequest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      requester: requester == freezed
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: intent == freezed
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as ServiceRequestIntentEnum?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInfo: supportingInfo == freezed
          ? _value.supportingInfo
          : supportingInfo // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequest implements _ServiceRequest {
  _$_ServiceRequest(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Status')
          this.status,
      @JsonKey(name: 'Text')
          this.text,
      @JsonKey(name: 'Identifier')
          this.identifier,
      @JsonKey(name: 'Category')
          this.category,
      @JsonKey(name: 'Requester')
          this.requester,
      @JsonKey(name: 'Code')
          this.code,
      @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
          this.intent,
      @JsonKey(name: 'Priority')
          this.priority,
      @JsonKey(name: 'Subject')
          this.subject,
      @JsonKey(name: 'Encounter')
          this.encounter,
      @JsonKey(name: 'SupportingInfo')
          this.supportingInfo,
      @JsonKey(name: 'Note')
          this.note});

  factory _$_ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestFromJson(json);

  @override

  /// The logical id of the resource, as used in the URL for the resource.
  /// Once assigned, this value never changes.
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The status of the order.
  @JsonKey(name: 'Status')
  final String? status;
  @override

  /// A human-readable narrative that contains a summary of the resource
  ///  and can be used to represent the content of the resource to a human.
  @JsonKey(name: 'Text')
  final Narrative? text;
  @override

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  final List<Identifier?>? identifier;
  @override

  /// A code that classifies the service for searching, sorting and display
  /// purposes (e.g. "Surgical Procedure").
  @JsonKey(name: 'Category')
  final List<CodeableConcept?>? category;
  @override

  /// The individual who initiated the request and has responsibility
  ///  for its activation.
  @JsonKey(name: 'Requester')
  final Reference? requester;
  @override //A code that identifies a particular service (i.e., procedure,
//diagnostic investigation, or panel of investigations)
//that have been requested.
  @JsonKey(name: 'Code')
  final CodeableConcept? code;
  @override

  /// Whether the request is a proposal, plan, an original order
  /// or a reflex order.
  @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
  final ServiceRequestIntentEnum? intent;
  @override

  /// Indicates how quickly the ServiceRequest should be addressed with
  /// respect to other requests.
  @JsonKey(name: 'Priority')
  final String? priority;
  @override

  /// On whom or what the service is to be performed. This is usually a human
  ///  patient, but can also be requested on animals, groups of humans
  ///  or animals, devices such as dialysis machines, or even locations
  /// (typically for environmental scans).
  @JsonKey(name: 'Subject')
  final Reference? subject;
  @override

  /// An encounter that provides additional information about the healthcare
  ///  context in which this request is made.
  @JsonKey(name: 'Encounter')
  final Reference? encounter;
  @override

  /// Additional clinical information about the patient or specimen that may
  ///  influence the services or their interpretations.
  @JsonKey(name: 'SupportingInfo')
  final List<Reference?>? supportingInfo;
  @override

  /// Any other notes and comments made about the service request.
  ///  For example, internal billing notes.
  @JsonKey(name: 'Note')
  final List<Annotation?>? note;

  @override
  String toString() {
    return 'ServiceRequest(id: $id, status: $status, text: $text, identifier: $identifier, category: $category, requester: $requester, code: $code, intent: $intent, priority: $priority, subject: $subject, encounter: $encounter, supportingInfo: $supportingInfo, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceRequest &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.requester, requester) ||
                const DeepCollectionEquality()
                    .equals(other.requester, requester)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.intent, intent) ||
                const DeepCollectionEquality().equals(other.intent, intent)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.encounter, encounter) ||
                const DeepCollectionEquality()
                    .equals(other.encounter, encounter)) &&
            (identical(other.supportingInfo, supportingInfo) ||
                const DeepCollectionEquality()
                    .equals(other.supportingInfo, supportingInfo)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(requester) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(intent) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(encounter) ^
      const DeepCollectionEquality().hash(supportingInfo) ^
      const DeepCollectionEquality().hash(note);

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestCopyWith<_ServiceRequest> get copyWith =>
      __$ServiceRequestCopyWithImpl<_ServiceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestToJson(this);
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  factory _ServiceRequest(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status')
          String? status,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Category')
          List<CodeableConcept?>? category,
      @JsonKey(name: 'Requester')
          Reference? requester,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
          ServiceRequestIntentEnum? intent,
      @JsonKey(name: 'Priority')
          String? priority,
      @JsonKey(name: 'Subject')
          Reference? subject,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'SupportingInfo')
          List<Reference?>? supportingInfo,
      @JsonKey(name: 'Note')
          List<Annotation?>? note}) = _$_ServiceRequest;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequest.fromJson;

  @override

  /// The logical id of the resource, as used in the URL for the resource.
  /// Once assigned, this value never changes.
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The status of the order.
  @JsonKey(name: 'Status')
  String? get status => throw _privateConstructorUsedError;
  @override

  /// A human-readable narrative that contains a summary of the resource
  ///  and can be used to represent the content of the resource to a human.
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;
  @override

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @override

  /// A code that classifies the service for searching, sorting and display
  /// purposes (e.g. "Surgical Procedure").
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @override

  /// The individual who initiated the request and has responsibility
  ///  for its activation.
  @JsonKey(name: 'Requester')
  Reference? get requester => throw _privateConstructorUsedError;
  @override //A code that identifies a particular service (i.e., procedure,
//diagnostic investigation, or panel of investigations)
//that have been requested.
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @override

  /// Whether the request is a proposal, plan, an original order
  /// or a reflex order.
  @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
  ServiceRequestIntentEnum? get intent => throw _privateConstructorUsedError;
  @override

  /// Indicates how quickly the ServiceRequest should be addressed with
  /// respect to other requests.
  @JsonKey(name: 'Priority')
  String? get priority => throw _privateConstructorUsedError;
  @override

  /// On whom or what the service is to be performed. This is usually a human
  ///  patient, but can also be requested on animals, groups of humans
  ///  or animals, devices such as dialysis machines, or even locations
  /// (typically for environmental scans).
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @override

  /// An encounter that provides additional information about the healthcare
  ///  context in which this request is made.
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @override

  /// Additional clinical information about the patient or specimen that may
  ///  influence the services or their interpretations.
  @JsonKey(name: 'SupportingInfo')
  List<Reference?>? get supportingInfo => throw _privateConstructorUsedError;
  @override

  /// Any other notes and comments made about the service request.
  ///  For example, internal billing notes.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestCopyWith<_ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestConnection _$ServiceRequestConnectionFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestConnection.fromJson(json);
}

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
      _$ServiceRequestConnectionCopyWithImpl<$Res, ServiceRequestConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$ServiceRequestConnectionCopyWithImpl<$Res,
        $Val extends ServiceRequestConnection>
    implements $ServiceRequestConnectionCopyWith<$Res> {
  _$ServiceRequestConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: freezed == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestEdge?>?,
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestConnectionCopyWith<$Res>
    implements $ServiceRequestConnectionCopyWith<$Res> {
  factory _$$_ServiceRequestConnectionCopyWith(
          _$_ServiceRequestConnection value,
          $Res Function(_$_ServiceRequestConnection) then) =
      __$$_ServiceRequestConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_ServiceRequestConnectionCopyWithImpl<$Res>
    extends _$ServiceRequestConnectionCopyWithImpl<$Res,
        _$_ServiceRequestConnection>
    implements _$$_ServiceRequestConnectionCopyWith<$Res> {
  __$$_ServiceRequestConnectionCopyWithImpl(_$_ServiceRequestConnection _value,
      $Res Function(_$_ServiceRequestConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_$_ServiceRequestConnection(
      edges: freezed == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestEdge?>?,
      pageInfo: freezed == pageInfo
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
      {@JsonKey(name: 'edges') final List<ServiceRequestEdge?>? edges,
      @JsonKey(name: 'pageInfo') this.pageInfo})
      : _edges = edges;

  factory _$_ServiceRequestConnection.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestConnectionFromJson(json);

  final List<ServiceRequestEdge?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<ServiceRequestEdge?>? get edges {
    final value = _edges;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequestConnection &&
            const DeepCollectionEquality().equals(other._edges, _edges) &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_edges), pageInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestConnectionCopyWith<_$_ServiceRequestConnection>
      get copyWith => __$$_ServiceRequestConnectionCopyWithImpl<
          _$_ServiceRequestConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestConnectionToJson(
      this,
    );
  }
}

abstract class _ServiceRequestConnection implements ServiceRequestConnection {
  factory _ServiceRequestConnection(
          {@JsonKey(name: 'edges') final List<ServiceRequestEdge?>? edges,
          @JsonKey(name: 'pageInfo') final PageInfo? pageInfo}) =
      _$_ServiceRequestConnection;

  factory _ServiceRequestConnection.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<ServiceRequestEdge?>? get edges;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestConnectionCopyWith<_$_ServiceRequestConnection>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceRequestEdge _$ServiceRequestEdgeFromJson(Map<String, dynamic> json) {
  return _ServiceRequestEdge.fromJson(json);
}

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
      _$ServiceRequestEdgeCopyWithImpl<$Res, ServiceRequestEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') ServiceRequest? node});

  $ServiceRequestCopyWith<$Res>? get node;
}

/// @nodoc
class _$ServiceRequestEdgeCopyWithImpl<$Res, $Val extends ServiceRequestEdge>
    implements $ServiceRequestEdgeCopyWith<$Res> {
  _$ServiceRequestEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ServiceRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $ServiceRequestCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestEdgeCopyWith<$Res>
    implements $ServiceRequestEdgeCopyWith<$Res> {
  factory _$$_ServiceRequestEdgeCopyWith(_$_ServiceRequestEdge value,
          $Res Function(_$_ServiceRequestEdge) then) =
      __$$_ServiceRequestEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') ServiceRequest? node});

  @override
  $ServiceRequestCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_ServiceRequestEdgeCopyWithImpl<$Res>
    extends _$ServiceRequestEdgeCopyWithImpl<$Res, _$_ServiceRequestEdge>
    implements _$$_ServiceRequestEdgeCopyWith<$Res> {
  __$$_ServiceRequestEdgeCopyWithImpl(
      _$_ServiceRequestEdge _value, $Res Function(_$_ServiceRequestEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_$_ServiceRequestEdge(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
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
      _$$_ServiceRequestEdgeFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequestEdge &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.node, node) || other.node == node));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, node);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestEdgeCopyWith<_$_ServiceRequestEdge> get copyWith =>
      __$$_ServiceRequestEdgeCopyWithImpl<_$_ServiceRequestEdge>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestEdgeToJson(
      this,
    );
  }
}

abstract class _ServiceRequestEdge implements ServiceRequestEdge {
  factory _ServiceRequestEdge(
          {@JsonKey(name: 'cursor') final String? cursor,
          @JsonKey(name: 'node') final ServiceRequest? node}) =
      _$_ServiceRequestEdge;

  factory _ServiceRequestEdge.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestEdge.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor;
  @override
  @JsonKey(name: 'node')
  ServiceRequest? get node;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestEdgeCopyWith<_$_ServiceRequestEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

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
      _$ServiceRequestCopyWithImpl<$Res, ServiceRequest>;
  @useResult
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
class _$ServiceRequestCopyWithImpl<$Res, $Val extends ServiceRequest>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      requester: freezed == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as ServiceRequestIntentEnum?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInfo: freezed == supportingInfo
          ? _value.supportingInfo
          : supportingInfo // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ) as $Val);
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
  $ReferenceCopyWith<$Res>? get requester {
    if (_value.requester == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.requester!, (value) {
      return _then(_value.copyWith(requester: value) as $Val);
    });
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
}

/// @nodoc
abstract class _$$_ServiceRequestCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$$_ServiceRequestCopyWith(
          _$_ServiceRequest value, $Res Function(_$_ServiceRequest) then) =
      __$$_ServiceRequestCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_ServiceRequestCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res, _$_ServiceRequest>
    implements _$$_ServiceRequestCopyWith<$Res> {
  __$$_ServiceRequestCopyWithImpl(
      _$_ServiceRequest _value, $Res Function(_$_ServiceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_ServiceRequest(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: freezed == identifier
          ? _value._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      requester: freezed == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as ServiceRequestIntentEnum?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInfo: freezed == supportingInfo
          ? _value._supportingInfo
          : supportingInfo // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: freezed == note
          ? _value._note
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
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Category')
          final List<CodeableConcept?>? category,
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
          final List<Reference?>? supportingInfo,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note})
      : _identifier = identifier,
        _category = category,
        _supportingInfo = supportingInfo,
        _note = note;

  factory _$_ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestFromJson(json);

  /// The logical id of the resource, as used in the URL for the resource.
  /// Once assigned, this value never changes.
  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The status of the order.
  @override
  @JsonKey(name: 'Status')
  final String? status;

  /// A human-readable narrative that contains a summary of the resource
  ///  and can be used to represent the content of the resource to a human.
  @override
  @JsonKey(name: 'Text')
  final Narrative? text;

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  final List<Identifier?>? _identifier;

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A code that classifies the service for searching, sorting and display
  /// purposes (e.g. "Surgical Procedure").
  final List<CodeableConcept?>? _category;

  /// A code that classifies the service for searching, sorting and display
  /// purposes (e.g. "Surgical Procedure").
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category {
    final value = _category;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The individual who initiated the request and has responsibility
  ///  for its activation.
  @override
  @JsonKey(name: 'Requester')
  final Reference? requester;
//A code that identifies a particular service (i.e., procedure,
//diagnostic investigation, or panel of investigations)
//that have been requested.
  @override
  @JsonKey(name: 'Code')
  final CodeableConcept? code;

  /// Whether the request is a proposal, plan, an original order
  /// or a reflex order.
  @override
  @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
  final ServiceRequestIntentEnum? intent;

  /// Indicates how quickly the ServiceRequest should be addressed with
  /// respect to other requests.
  @override
  @JsonKey(name: 'Priority')
  final String? priority;

  /// On whom or what the service is to be performed. This is usually a human
  ///  patient, but can also be requested on animals, groups of humans
  ///  or animals, devices such as dialysis machines, or even locations
  /// (typically for environmental scans).
  @override
  @JsonKey(name: 'Subject')
  final Reference? subject;

  /// An encounter that provides additional information about the healthcare
  ///  context in which this request is made.
  @override
  @JsonKey(name: 'Encounter')
  final Reference? encounter;

  /// Additional clinical information about the patient or specimen that may
  ///  influence the services or their interpretations.
  final List<Reference?>? _supportingInfo;

  /// Additional clinical information about the patient or specimen that may
  ///  influence the services or their interpretations.
  @override
  @JsonKey(name: 'SupportingInfo')
  List<Reference?>? get supportingInfo {
    final value = _supportingInfo;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Any other notes and comments made about the service request.
  ///  For example, internal billing notes.
  final List<Annotation?>? _note;

  /// Any other notes and comments made about the service request.
  ///  For example, internal billing notes.
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note {
    final value = _note;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceRequest(id: $id, status: $status, text: $text, identifier: $identifier, category: $category, requester: $requester, code: $code, intent: $intent, priority: $priority, subject: $subject, encounter: $encounter, supportingInfo: $supportingInfo, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.requester, requester) ||
                other.requester == requester) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.intent, intent) || other.intent == intent) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            const DeepCollectionEquality()
                .equals(other._supportingInfo, _supportingInfo) &&
            const DeepCollectionEquality().equals(other._note, _note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      text,
      const DeepCollectionEquality().hash(_identifier),
      const DeepCollectionEquality().hash(_category),
      requester,
      code,
      intent,
      priority,
      subject,
      encounter,
      const DeepCollectionEquality().hash(_supportingInfo),
      const DeepCollectionEquality().hash(_note));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      __$$_ServiceRequestCopyWithImpl<_$_ServiceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestToJson(
      this,
    );
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  factory _ServiceRequest(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Status')
          final String? status,
      @JsonKey(name: 'Text')
          final Narrative? text,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Category')
          final List<CodeableConcept?>? category,
      @JsonKey(name: 'Requester')
          final Reference? requester,
      @JsonKey(name: 'Code')
          final CodeableConcept? code,
      @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
          final ServiceRequestIntentEnum? intent,
      @JsonKey(name: 'Priority')
          final String? priority,
      @JsonKey(name: 'Subject')
          final Reference? subject,
      @JsonKey(name: 'Encounter')
          final Reference? encounter,
      @JsonKey(name: 'SupportingInfo')
          final List<Reference?>? supportingInfo,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note}) = _$_ServiceRequest;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequest.fromJson;

  @override

  /// The logical id of the resource, as used in the URL for the resource.
  /// Once assigned, this value never changes.
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The status of the order.
  @JsonKey(name: 'Status')
  String? get status;
  @override

  /// A human-readable narrative that contains a summary of the resource
  ///  and can be used to represent the content of the resource to a human.
  @JsonKey(name: 'Text')
  Narrative? get text;
  @override

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier;
  @override

  /// A code that classifies the service for searching, sorting and display
  /// purposes (e.g. "Surgical Procedure").
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category;
  @override

  /// The individual who initiated the request and has responsibility
  ///  for its activation.
  @JsonKey(name: 'Requester')
  Reference? get requester;
  @override //A code that identifies a particular service (i.e., procedure,
//diagnostic investigation, or panel of investigations)
//that have been requested.
  @JsonKey(name: 'Code')
  CodeableConcept? get code;
  @override

  /// Whether the request is a proposal, plan, an original order
  /// or a reflex order.
  @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
  ServiceRequestIntentEnum? get intent;
  @override

  /// Indicates how quickly the ServiceRequest should be addressed with
  /// respect to other requests.
  @JsonKey(name: 'Priority')
  String? get priority;
  @override

  /// On whom or what the service is to be performed. This is usually a human
  ///  patient, but can also be requested on animals, groups of humans
  ///  or animals, devices such as dialysis machines, or even locations
  /// (typically for environmental scans).
  @JsonKey(name: 'Subject')
  Reference? get subject;
  @override

  /// An encounter that provides additional information about the healthcare
  ///  context in which this request is made.
  @JsonKey(name: 'Encounter')
  Reference? get encounter;
  @override

  /// Additional clinical information about the patient or specimen that may
  ///  influence the services or their interpretations.
  @JsonKey(name: 'SupportingInfo')
  List<Reference?>? get supportingInfo;
  @override

  /// Any other notes and comments made about the service request.
  ///  For example, internal billing notes.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

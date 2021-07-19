// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'patient_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientEdge _$PatientEdgeFromJson(Map<String, dynamic> json) {
  return _PatientEdge.fromJson(json);
}

/// @nodoc
class _$PatientEdgeTearOff {
  const _$PatientEdgeTearOff();

  _PatientEdge call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Patient? node,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes}) {
    return _PatientEdge(
      cursor: cursor,
      node: node,
      hasOpenEpisodes: hasOpenEpisodes,
    );
  }

  PatientEdge fromJson(Map<String, Object> json) {
    return PatientEdge.fromJson(json);
  }
}

/// @nodoc
const $PatientEdge = _$PatientEdgeTearOff();

/// @nodoc
mixin _$PatientEdge {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  Patient? get node => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasOpenEpisodes')
  bool? get hasOpenEpisodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientEdgeCopyWith<PatientEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientEdgeCopyWith<$Res> {
  factory $PatientEdgeCopyWith(
          PatientEdge value, $Res Function(PatientEdge) then) =
      _$PatientEdgeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Patient? node,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes});

  $PatientCopyWith<$Res>? get node;
}

/// @nodoc
class _$PatientEdgeCopyWithImpl<$Res> implements $PatientEdgeCopyWith<$Res> {
  _$PatientEdgeCopyWithImpl(this._value, this._then);

  final PatientEdge _value;
  // ignore: unused_field
  final $Res Function(PatientEdge) _then;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
    Object? hasOpenEpisodes = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: hasOpenEpisodes == freezed
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $PatientCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $PatientCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$PatientEdgeCopyWith<$Res>
    implements $PatientEdgeCopyWith<$Res> {
  factory _$PatientEdgeCopyWith(
          _PatientEdge value, $Res Function(_PatientEdge) then) =
      __$PatientEdgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Patient? node,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes});

  @override
  $PatientCopyWith<$Res>? get node;
}

/// @nodoc
class __$PatientEdgeCopyWithImpl<$Res> extends _$PatientEdgeCopyWithImpl<$Res>
    implements _$PatientEdgeCopyWith<$Res> {
  __$PatientEdgeCopyWithImpl(
      _PatientEdge _value, $Res Function(_PatientEdge) _then)
      : super(_value, (v) => _then(v as _PatientEdge));

  @override
  _PatientEdge get _value => super._value as _PatientEdge;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
    Object? hasOpenEpisodes = freezed,
  }) {
    return _then(_PatientEdge(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: hasOpenEpisodes == freezed
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientEdge implements _PatientEdge {
  _$_PatientEdge(
      {@JsonKey(name: 'cursor') this.cursor,
      @JsonKey(name: 'node') this.node,
      @JsonKey(name: 'hasOpenEpisodes') this.hasOpenEpisodes});

  factory _$_PatientEdge.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientEdgeFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final Patient? node;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  final bool? hasOpenEpisodes;

  @override
  String toString() {
    return 'PatientEdge(cursor: $cursor, node: $node, hasOpenEpisodes: $hasOpenEpisodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientEdge &&
            (identical(other.cursor, cursor) ||
                const DeepCollectionEquality().equals(other.cursor, cursor)) &&
            (identical(other.node, node) ||
                const DeepCollectionEquality().equals(other.node, node)) &&
            (identical(other.hasOpenEpisodes, hasOpenEpisodes) ||
                const DeepCollectionEquality()
                    .equals(other.hasOpenEpisodes, hasOpenEpisodes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cursor) ^
      const DeepCollectionEquality().hash(node) ^
      const DeepCollectionEquality().hash(hasOpenEpisodes);

  @JsonKey(ignore: true)
  @override
  _$PatientEdgeCopyWith<_PatientEdge> get copyWith =>
      __$PatientEdgeCopyWithImpl<_PatientEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientEdgeToJson(this);
  }
}

abstract class _PatientEdge implements PatientEdge {
  factory _PatientEdge(
          {@JsonKey(name: 'cursor') String? cursor,
          @JsonKey(name: 'node') Patient? node,
          @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes}) =
      _$_PatientEdge;

  factory _PatientEdge.fromJson(Map<String, dynamic> json) =
      _$_PatientEdge.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  Patient? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  bool? get hasOpenEpisodes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientEdgeCopyWith<_PatientEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientConnection _$PatientConnectionFromJson(Map<String, dynamic> json) {
  return _PatientConnection.fromJson(json);
}

/// @nodoc
class _$PatientConnectionTearOff {
  const _$PatientConnectionTearOff();

  _PatientConnection call(
      {@JsonKey(name: 'edges') List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) {
    return _PatientConnection(
      edges: edges,
      pageInfo: pageInfo,
    );
  }

  PatientConnection fromJson(Map<String, Object> json) {
    return PatientConnection.fromJson(json);
  }
}

/// @nodoc
const $PatientConnection = _$PatientConnectionTearOff();

/// @nodoc
mixin _$PatientConnection {
  @JsonKey(name: 'edges')
  List<PatientEdge?>? get edges => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientConnectionCopyWith<PatientConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientConnectionCopyWith<$Res> {
  factory $PatientConnectionCopyWith(
          PatientConnection value, $Res Function(PatientConnection) then) =
      _$PatientConnectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'edges') List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$PatientConnectionCopyWithImpl<$Res>
    implements $PatientConnectionCopyWith<$Res> {
  _$PatientConnectionCopyWithImpl(this._value, this._then);

  final PatientConnection _value;
  // ignore: unused_field
  final $Res Function(PatientConnection) _then;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
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
abstract class _$PatientConnectionCopyWith<$Res>
    implements $PatientConnectionCopyWith<$Res> {
  factory _$PatientConnectionCopyWith(
          _PatientConnection value, $Res Function(_PatientConnection) then) =
      __$PatientConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'edges') List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$PatientConnectionCopyWithImpl<$Res>
    extends _$PatientConnectionCopyWithImpl<$Res>
    implements _$PatientConnectionCopyWith<$Res> {
  __$PatientConnectionCopyWithImpl(
      _PatientConnection _value, $Res Function(_PatientConnection) _then)
      : super(_value, (v) => _then(v as _PatientConnection));

  @override
  _PatientConnection get _value => super._value as _PatientConnection;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_PatientConnection(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientConnection implements _PatientConnection {
  _$_PatientConnection(
      {@JsonKey(name: 'edges') this.edges,
      @JsonKey(name: 'pageInfo') this.pageInfo});

  factory _$_PatientConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientConnectionFromJson(json);

  @override
  @JsonKey(name: 'edges')
  final List<PatientEdge?>? edges;
  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;

  @override
  String toString() {
    return 'PatientConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientConnection &&
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
  _$PatientConnectionCopyWith<_PatientConnection> get copyWith =>
      __$PatientConnectionCopyWithImpl<_PatientConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientConnectionToJson(this);
  }
}

abstract class _PatientConnection implements PatientConnection {
  factory _PatientConnection(
      {@JsonKey(name: 'edges') List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) = _$_PatientConnection;

  factory _PatientConnection.fromJson(Map<String, dynamic> json) =
      _$_PatientConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<PatientEdge?>? get edges => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientConnectionCopyWith<_PatientConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) {
  return _PatientInfo.fromJson(json);
}

/// @nodoc
class _$PatientInfoTearOff {
  const _$PatientInfoTearOff();

  _PatientInfo call(
      {String? patientId,
      String? patientReference,
      String? patientName,
      String? encounterId,
      String? encounterReference}) {
    return _PatientInfo(
      patientId: patientId,
      patientReference: patientReference,
      patientName: patientName,
      encounterId: encounterId,
      encounterReference: encounterReference,
    );
  }

  PatientInfo fromJson(Map<String, Object> json) {
    return PatientInfo.fromJson(json);
  }
}

/// @nodoc
const $PatientInfo = _$PatientInfoTearOff();

/// @nodoc
mixin _$PatientInfo {
  String? get patientId => throw _privateConstructorUsedError;
  String? get patientReference => throw _privateConstructorUsedError;
  String? get patientName => throw _privateConstructorUsedError;
  String? get encounterId => throw _privateConstructorUsedError;
  String? get encounterReference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientInfoCopyWith<PatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientInfoCopyWith<$Res> {
  factory $PatientInfoCopyWith(
          PatientInfo value, $Res Function(PatientInfo) then) =
      _$PatientInfoCopyWithImpl<$Res>;
  $Res call(
      {String? patientId,
      String? patientReference,
      String? patientName,
      String? encounterId,
      String? encounterReference});
}

/// @nodoc
class _$PatientInfoCopyWithImpl<$Res> implements $PatientInfoCopyWith<$Res> {
  _$PatientInfoCopyWithImpl(this._value, this._then);

  final PatientInfo _value;
  // ignore: unused_field
  final $Res Function(PatientInfo) _then;

  @override
  $Res call({
    Object? patientId = freezed,
    Object? patientReference = freezed,
    Object? patientName = freezed,
    Object? encounterId = freezed,
    Object? encounterReference = freezed,
  }) {
    return _then(_value.copyWith(
      patientId: patientId == freezed
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientReference: patientReference == freezed
          ? _value.patientReference
          : patientReference // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: patientName == freezed
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterId: encounterId == freezed
          ? _value.encounterId
          : encounterId // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterReference: encounterReference == freezed
          ? _value.encounterReference
          : encounterReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PatientInfoCopyWith<$Res>
    implements $PatientInfoCopyWith<$Res> {
  factory _$PatientInfoCopyWith(
          _PatientInfo value, $Res Function(_PatientInfo) then) =
      __$PatientInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? patientId,
      String? patientReference,
      String? patientName,
      String? encounterId,
      String? encounterReference});
}

/// @nodoc
class __$PatientInfoCopyWithImpl<$Res> extends _$PatientInfoCopyWithImpl<$Res>
    implements _$PatientInfoCopyWith<$Res> {
  __$PatientInfoCopyWithImpl(
      _PatientInfo _value, $Res Function(_PatientInfo) _then)
      : super(_value, (v) => _then(v as _PatientInfo));

  @override
  _PatientInfo get _value => super._value as _PatientInfo;

  @override
  $Res call({
    Object? patientId = freezed,
    Object? patientReference = freezed,
    Object? patientName = freezed,
    Object? encounterId = freezed,
    Object? encounterReference = freezed,
  }) {
    return _then(_PatientInfo(
      patientId: patientId == freezed
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientReference: patientReference == freezed
          ? _value.patientReference
          : patientReference // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: patientName == freezed
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterId: encounterId == freezed
          ? _value.encounterId
          : encounterId // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterReference: encounterReference == freezed
          ? _value.encounterReference
          : encounterReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientInfo implements _PatientInfo {
  _$_PatientInfo(
      {this.patientId,
      this.patientReference,
      this.patientName,
      this.encounterId,
      this.encounterReference});

  factory _$_PatientInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientInfoFromJson(json);

  @override
  final String? patientId;
  @override
  final String? patientReference;
  @override
  final String? patientName;
  @override
  final String? encounterId;
  @override
  final String? encounterReference;

  @override
  String toString() {
    return 'PatientInfo(patientId: $patientId, patientReference: $patientReference, patientName: $patientName, encounterId: $encounterId, encounterReference: $encounterReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientInfo &&
            (identical(other.patientId, patientId) ||
                const DeepCollectionEquality()
                    .equals(other.patientId, patientId)) &&
            (identical(other.patientReference, patientReference) ||
                const DeepCollectionEquality()
                    .equals(other.patientReference, patientReference)) &&
            (identical(other.patientName, patientName) ||
                const DeepCollectionEquality()
                    .equals(other.patientName, patientName)) &&
            (identical(other.encounterId, encounterId) ||
                const DeepCollectionEquality()
                    .equals(other.encounterId, encounterId)) &&
            (identical(other.encounterReference, encounterReference) ||
                const DeepCollectionEquality()
                    .equals(other.encounterReference, encounterReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(patientId) ^
      const DeepCollectionEquality().hash(patientReference) ^
      const DeepCollectionEquality().hash(patientName) ^
      const DeepCollectionEquality().hash(encounterId) ^
      const DeepCollectionEquality().hash(encounterReference);

  @JsonKey(ignore: true)
  @override
  _$PatientInfoCopyWith<_PatientInfo> get copyWith =>
      __$PatientInfoCopyWithImpl<_PatientInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientInfoToJson(this);
  }
}

abstract class _PatientInfo implements PatientInfo {
  factory _PatientInfo(
      {String? patientId,
      String? patientReference,
      String? patientName,
      String? encounterId,
      String? encounterReference}) = _$_PatientInfo;

  factory _PatientInfo.fromJson(Map<String, dynamic> json) =
      _$_PatientInfo.fromJson;

  @override
  String? get patientId => throw _privateConstructorUsedError;
  @override
  String? get patientReference => throw _privateConstructorUsedError;
  @override
  String? get patientName => throw _privateConstructorUsedError;
  @override
  String? get encounterId => throw _privateConstructorUsedError;
  @override
  String? get encounterReference => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientInfoCopyWith<_PatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

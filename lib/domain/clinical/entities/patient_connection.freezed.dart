// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientEdge _$PatientEdgeFromJson(Map<String, dynamic> json) {
  return _PatientEdge.fromJson(json);
}

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
      _$PatientEdgeCopyWithImpl<$Res, PatientEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Patient? node,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes});

  $PatientCopyWith<$Res>? get node;
}

/// @nodoc
class _$PatientEdgeCopyWithImpl<$Res, $Val extends PatientEdge>
    implements $PatientEdgeCopyWith<$Res> {
  _$PatientEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
    Object? hasOpenEpisodes = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: freezed == hasOpenEpisodes
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $PatientCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PatientEdgeCopyWith<$Res>
    implements $PatientEdgeCopyWith<$Res> {
  factory _$$_PatientEdgeCopyWith(
          _$_PatientEdge value, $Res Function(_$_PatientEdge) then) =
      __$$_PatientEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Patient? node,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes});

  @override
  $PatientCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_PatientEdgeCopyWithImpl<$Res>
    extends _$PatientEdgeCopyWithImpl<$Res, _$_PatientEdge>
    implements _$$_PatientEdgeCopyWith<$Res> {
  __$$_PatientEdgeCopyWithImpl(
      _$_PatientEdge _value, $Res Function(_$_PatientEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
    Object? hasOpenEpisodes = freezed,
  }) {
    return _then(_$_PatientEdge(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: freezed == hasOpenEpisodes
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
      _$$_PatientEdgeFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_PatientEdge &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.hasOpenEpisodes, hasOpenEpisodes) ||
                other.hasOpenEpisodes == hasOpenEpisodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, node, hasOpenEpisodes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientEdgeCopyWith<_$_PatientEdge> get copyWith =>
      __$$_PatientEdgeCopyWithImpl<_$_PatientEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientEdgeToJson(
      this,
    );
  }
}

abstract class _PatientEdge implements PatientEdge {
  factory _PatientEdge(
          {@JsonKey(name: 'cursor') final String? cursor,
          @JsonKey(name: 'node') final Patient? node,
          @JsonKey(name: 'hasOpenEpisodes') final bool? hasOpenEpisodes}) =
      _$_PatientEdge;

  factory _PatientEdge.fromJson(Map<String, dynamic> json) =
      _$_PatientEdge.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor;
  @override
  @JsonKey(name: 'node')
  Patient? get node;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  bool? get hasOpenEpisodes;
  @override
  @JsonKey(ignore: true)
  _$$_PatientEdgeCopyWith<_$_PatientEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientConnection _$PatientConnectionFromJson(Map<String, dynamic> json) {
  return _PatientConnection.fromJson(json);
}

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
      _$PatientConnectionCopyWithImpl<$Res, PatientConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$PatientConnectionCopyWithImpl<$Res, $Val extends PatientConnection>
    implements $PatientConnectionCopyWith<$Res> {
  _$PatientConnectionCopyWithImpl(this._value, this._then);

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
              as List<PatientEdge?>?,
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
abstract class _$$_PatientConnectionCopyWith<$Res>
    implements $PatientConnectionCopyWith<$Res> {
  factory _$$_PatientConnectionCopyWith(_$_PatientConnection value,
          $Res Function(_$_PatientConnection) then) =
      __$$_PatientConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_PatientConnectionCopyWithImpl<$Res>
    extends _$PatientConnectionCopyWithImpl<$Res, _$_PatientConnection>
    implements _$$_PatientConnectionCopyWith<$Res> {
  __$$_PatientConnectionCopyWithImpl(
      _$_PatientConnection _value, $Res Function(_$_PatientConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_$_PatientConnection(
      edges: freezed == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
      pageInfo: freezed == pageInfo
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
      {@JsonKey(name: 'edges') final List<PatientEdge?>? edges,
      @JsonKey(name: 'pageInfo') this.pageInfo})
      : _edges = edges;

  factory _$_PatientConnection.fromJson(Map<String, dynamic> json) =>
      _$$_PatientConnectionFromJson(json);

  final List<PatientEdge?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<PatientEdge?>? get edges {
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
    return 'PatientConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientConnection &&
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
  _$$_PatientConnectionCopyWith<_$_PatientConnection> get copyWith =>
      __$$_PatientConnectionCopyWithImpl<_$_PatientConnection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientConnectionToJson(
      this,
    );
  }
}

abstract class _PatientConnection implements PatientConnection {
  factory _PatientConnection(
          {@JsonKey(name: 'edges') final List<PatientEdge?>? edges,
          @JsonKey(name: 'pageInfo') final PageInfo? pageInfo}) =
      _$_PatientConnection;

  factory _PatientConnection.fromJson(Map<String, dynamic> json) =
      _$_PatientConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<PatientEdge?>? get edges;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(ignore: true)
  _$$_PatientConnectionCopyWith<_$_PatientConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) {
  return _PatientInfo.fromJson(json);
}

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
      _$PatientInfoCopyWithImpl<$Res, PatientInfo>;
  @useResult
  $Res call(
      {String? patientId,
      String? patientReference,
      String? patientName,
      String? encounterId,
      String? encounterReference});
}

/// @nodoc
class _$PatientInfoCopyWithImpl<$Res, $Val extends PatientInfo>
    implements $PatientInfoCopyWith<$Res> {
  _$PatientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = freezed,
    Object? patientReference = freezed,
    Object? patientName = freezed,
    Object? encounterId = freezed,
    Object? encounterReference = freezed,
  }) {
    return _then(_value.copyWith(
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientReference: freezed == patientReference
          ? _value.patientReference
          : patientReference // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterId: freezed == encounterId
          ? _value.encounterId
          : encounterId // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterReference: freezed == encounterReference
          ? _value.encounterReference
          : encounterReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientInfoCopyWith<$Res>
    implements $PatientInfoCopyWith<$Res> {
  factory _$$_PatientInfoCopyWith(
          _$_PatientInfo value, $Res Function(_$_PatientInfo) then) =
      __$$_PatientInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? patientId,
      String? patientReference,
      String? patientName,
      String? encounterId,
      String? encounterReference});
}

/// @nodoc
class __$$_PatientInfoCopyWithImpl<$Res>
    extends _$PatientInfoCopyWithImpl<$Res, _$_PatientInfo>
    implements _$$_PatientInfoCopyWith<$Res> {
  __$$_PatientInfoCopyWithImpl(
      _$_PatientInfo _value, $Res Function(_$_PatientInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = freezed,
    Object? patientReference = freezed,
    Object? patientName = freezed,
    Object? encounterId = freezed,
    Object? encounterReference = freezed,
  }) {
    return _then(_$_PatientInfo(
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientReference: freezed == patientReference
          ? _value.patientReference
          : patientReference // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterId: freezed == encounterId
          ? _value.encounterId
          : encounterId // ignore: cast_nullable_to_non_nullable
              as String?,
      encounterReference: freezed == encounterReference
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
      _$$_PatientInfoFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_PatientInfo &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.patientReference, patientReference) ||
                other.patientReference == patientReference) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.encounterId, encounterId) ||
                other.encounterId == encounterId) &&
            (identical(other.encounterReference, encounterReference) ||
                other.encounterReference == encounterReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, patientId, patientReference,
      patientName, encounterId, encounterReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientInfoCopyWith<_$_PatientInfo> get copyWith =>
      __$$_PatientInfoCopyWithImpl<_$_PatientInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientInfoToJson(
      this,
    );
  }
}

abstract class _PatientInfo implements PatientInfo {
  factory _PatientInfo(
      {final String? patientId,
      final String? patientReference,
      final String? patientName,
      final String? encounterId,
      final String? encounterReference}) = _$_PatientInfo;

  factory _PatientInfo.fromJson(Map<String, dynamic> json) =
      _$_PatientInfo.fromJson;

  @override
  String? get patientId;
  @override
  String? get patientReference;
  @override
  String? get patientName;
  @override
  String? get encounterId;
  @override
  String? get encounterReference;
  @override
  @JsonKey(ignore: true)
  _$$_PatientInfoCopyWith<_$_PatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

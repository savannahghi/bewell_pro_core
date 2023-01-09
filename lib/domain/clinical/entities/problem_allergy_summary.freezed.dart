// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_allergy_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProblemAllergySummary _$ProblemAllergySummaryFromJson(
    Map<String, dynamic> json) {
  return _ProblemAllergySummary.fromJson(json);
}

/// @nodoc
mixin _$ProblemAllergySummary {
  @JsonKey(name: 'problemSummary')
  List<String?>? get problemSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergySummary')
  List<String?>? get allergySummary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemAllergySummaryCopyWith<ProblemAllergySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemAllergySummaryCopyWith<$Res> {
  factory $ProblemAllergySummaryCopyWith(ProblemAllergySummary value,
          $Res Function(ProblemAllergySummary) then) =
      _$ProblemAllergySummaryCopyWithImpl<$Res, ProblemAllergySummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'problemSummary') List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary') List<String?>? allergySummary});
}

/// @nodoc
class _$ProblemAllergySummaryCopyWithImpl<$Res,
        $Val extends ProblemAllergySummary>
    implements $ProblemAllergySummaryCopyWith<$Res> {
  _$ProblemAllergySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemSummary = freezed,
    Object? allergySummary = freezed,
  }) {
    return _then(_value.copyWith(
      problemSummary: freezed == problemSummary
          ? _value.problemSummary
          : problemSummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      allergySummary: freezed == allergySummary
          ? _value.allergySummary
          : allergySummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProblemAllergySummaryCopyWith<$Res>
    implements $ProblemAllergySummaryCopyWith<$Res> {
  factory _$$_ProblemAllergySummaryCopyWith(_$_ProblemAllergySummary value,
          $Res Function(_$_ProblemAllergySummary) then) =
      __$$_ProblemAllergySummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'problemSummary') List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary') List<String?>? allergySummary});
}

/// @nodoc
class __$$_ProblemAllergySummaryCopyWithImpl<$Res>
    extends _$ProblemAllergySummaryCopyWithImpl<$Res, _$_ProblemAllergySummary>
    implements _$$_ProblemAllergySummaryCopyWith<$Res> {
  __$$_ProblemAllergySummaryCopyWithImpl(_$_ProblemAllergySummary _value,
      $Res Function(_$_ProblemAllergySummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemSummary = freezed,
    Object? allergySummary = freezed,
  }) {
    return _then(_$_ProblemAllergySummary(
      problemSummary: freezed == problemSummary
          ? _value._problemSummary
          : problemSummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      allergySummary: freezed == allergySummary
          ? _value._allergySummary
          : allergySummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProblemAllergySummary implements _ProblemAllergySummary {
  _$_ProblemAllergySummary(
      {@JsonKey(name: 'problemSummary') final List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary') final List<String?>? allergySummary})
      : _problemSummary = problemSummary,
        _allergySummary = allergySummary;

  factory _$_ProblemAllergySummary.fromJson(Map<String, dynamic> json) =>
      _$$_ProblemAllergySummaryFromJson(json);

  final List<String?>? _problemSummary;
  @override
  @JsonKey(name: 'problemSummary')
  List<String?>? get problemSummary {
    final value = _problemSummary;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String?>? _allergySummary;
  @override
  @JsonKey(name: 'allergySummary')
  List<String?>? get allergySummary {
    final value = _allergySummary;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProblemAllergySummary(problemSummary: $problemSummary, allergySummary: $allergySummary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProblemAllergySummary &&
            const DeepCollectionEquality()
                .equals(other._problemSummary, _problemSummary) &&
            const DeepCollectionEquality()
                .equals(other._allergySummary, _allergySummary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_problemSummary),
      const DeepCollectionEquality().hash(_allergySummary));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProblemAllergySummaryCopyWith<_$_ProblemAllergySummary> get copyWith =>
      __$$_ProblemAllergySummaryCopyWithImpl<_$_ProblemAllergySummary>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProblemAllergySummaryToJson(
      this,
    );
  }
}

abstract class _ProblemAllergySummary implements ProblemAllergySummary {
  factory _ProblemAllergySummary(
      {@JsonKey(name: 'problemSummary')
          final List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary')
          final List<String?>? allergySummary}) = _$_ProblemAllergySummary;

  factory _ProblemAllergySummary.fromJson(Map<String, dynamic> json) =
      _$_ProblemAllergySummary.fromJson;

  @override
  @JsonKey(name: 'problemSummary')
  List<String?>? get problemSummary;
  @override
  @JsonKey(name: 'allergySummary')
  List<String?>? get allergySummary;
  @override
  @JsonKey(ignore: true)
  _$$_ProblemAllergySummaryCopyWith<_$_ProblemAllergySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

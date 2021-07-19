// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'problem_allergy_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProblemAllergySummary _$ProblemAllergySummaryFromJson(
    Map<String, dynamic> json) {
  return _ProblemAllergySummary.fromJson(json);
}

/// @nodoc
class _$ProblemAllergySummaryTearOff {
  const _$ProblemAllergySummaryTearOff();

  _ProblemAllergySummary call(
      {@JsonKey(name: 'problemSummary') List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary') List<String?>? allergySummary}) {
    return _ProblemAllergySummary(
      problemSummary: problemSummary,
      allergySummary: allergySummary,
    );
  }

  ProblemAllergySummary fromJson(Map<String, Object> json) {
    return ProblemAllergySummary.fromJson(json);
  }
}

/// @nodoc
const $ProblemAllergySummary = _$ProblemAllergySummaryTearOff();

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
      _$ProblemAllergySummaryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'problemSummary') List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary') List<String?>? allergySummary});
}

/// @nodoc
class _$ProblemAllergySummaryCopyWithImpl<$Res>
    implements $ProblemAllergySummaryCopyWith<$Res> {
  _$ProblemAllergySummaryCopyWithImpl(this._value, this._then);

  final ProblemAllergySummary _value;
  // ignore: unused_field
  final $Res Function(ProblemAllergySummary) _then;

  @override
  $Res call({
    Object? problemSummary = freezed,
    Object? allergySummary = freezed,
  }) {
    return _then(_value.copyWith(
      problemSummary: problemSummary == freezed
          ? _value.problemSummary
          : problemSummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      allergySummary: allergySummary == freezed
          ? _value.allergySummary
          : allergySummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
abstract class _$ProblemAllergySummaryCopyWith<$Res>
    implements $ProblemAllergySummaryCopyWith<$Res> {
  factory _$ProblemAllergySummaryCopyWith(_ProblemAllergySummary value,
          $Res Function(_ProblemAllergySummary) then) =
      __$ProblemAllergySummaryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'problemSummary') List<String?>? problemSummary,
      @JsonKey(name: 'allergySummary') List<String?>? allergySummary});
}

/// @nodoc
class __$ProblemAllergySummaryCopyWithImpl<$Res>
    extends _$ProblemAllergySummaryCopyWithImpl<$Res>
    implements _$ProblemAllergySummaryCopyWith<$Res> {
  __$ProblemAllergySummaryCopyWithImpl(_ProblemAllergySummary _value,
      $Res Function(_ProblemAllergySummary) _then)
      : super(_value, (v) => _then(v as _ProblemAllergySummary));

  @override
  _ProblemAllergySummary get _value => super._value as _ProblemAllergySummary;

  @override
  $Res call({
    Object? problemSummary = freezed,
    Object? allergySummary = freezed,
  }) {
    return _then(_ProblemAllergySummary(
      problemSummary: problemSummary == freezed
          ? _value.problemSummary
          : problemSummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      allergySummary: allergySummary == freezed
          ? _value.allergySummary
          : allergySummary // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProblemAllergySummary implements _ProblemAllergySummary {
  _$_ProblemAllergySummary(
      {@JsonKey(name: 'problemSummary') this.problemSummary,
      @JsonKey(name: 'allergySummary') this.allergySummary});

  factory _$_ProblemAllergySummary.fromJson(Map<String, dynamic> json) =>
      _$_$_ProblemAllergySummaryFromJson(json);

  @override
  @JsonKey(name: 'problemSummary')
  final List<String?>? problemSummary;
  @override
  @JsonKey(name: 'allergySummary')
  final List<String?>? allergySummary;

  @override
  String toString() {
    return 'ProblemAllergySummary(problemSummary: $problemSummary, allergySummary: $allergySummary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProblemAllergySummary &&
            (identical(other.problemSummary, problemSummary) ||
                const DeepCollectionEquality()
                    .equals(other.problemSummary, problemSummary)) &&
            (identical(other.allergySummary, allergySummary) ||
                const DeepCollectionEquality()
                    .equals(other.allergySummary, allergySummary)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(problemSummary) ^
      const DeepCollectionEquality().hash(allergySummary);

  @JsonKey(ignore: true)
  @override
  _$ProblemAllergySummaryCopyWith<_ProblemAllergySummary> get copyWith =>
      __$ProblemAllergySummaryCopyWithImpl<_ProblemAllergySummary>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProblemAllergySummaryToJson(this);
  }
}

abstract class _ProblemAllergySummary implements ProblemAllergySummary {
  factory _ProblemAllergySummary(
          {@JsonKey(name: 'problemSummary') List<String?>? problemSummary,
          @JsonKey(name: 'allergySummary') List<String?>? allergySummary}) =
      _$_ProblemAllergySummary;

  factory _ProblemAllergySummary.fromJson(Map<String, dynamic> json) =
      _$_ProblemAllergySummary.fromJson;

  @override
  @JsonKey(name: 'problemSummary')
  List<String?>? get problemSummary => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'allergySummary')
  List<String?>? get allergySummary => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProblemAllergySummaryCopyWith<_ProblemAllergySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

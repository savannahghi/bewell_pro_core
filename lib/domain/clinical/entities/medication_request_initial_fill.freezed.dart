// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medication_request_initial_fill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationRequestInitialFill _$MedicationRequestInitialFillFromJson(
    Map<String, dynamic> json) {
  return _MedicationRequestInitialFill.fromJson(json);
}

/// @nodoc
mixin _$MedicationRequestInitialFill {
  @JsonKey(name: 'ID')
  String? get id =>
      throw _privateConstructorUsedError; //first medication fill quantity
  @JsonKey(name: 'Quantity')
  Quantity? get quantity =>
      throw _privateConstructorUsedError; //first medication fill duration
  @JsonKey(name: 'Duration')
  Duration? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationRequestInitialFillCopyWith<MedicationRequestInitialFill>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationRequestInitialFillCopyWith<$Res> {
  factory $MedicationRequestInitialFillCopyWith(
          MedicationRequestInitialFill value,
          $Res Function(MedicationRequestInitialFill) then) =
      _$MedicationRequestInitialFillCopyWithImpl<$Res,
          MedicationRequestInitialFill>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Quantity') Quantity? quantity,
      @JsonKey(name: 'Duration') Duration? duration});

  $QuantityCopyWith<$Res>? get quantity;
}

/// @nodoc
class _$MedicationRequestInitialFillCopyWithImpl<$Res,
        $Val extends MedicationRequestInitialFill>
    implements $MedicationRequestInitialFillCopyWith<$Res> {
  _$MedicationRequestInitialFillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get quantity {
    if (_value.quantity == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.quantity!, (value) {
      return _then(_value.copyWith(quantity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicationRequestInitialFillCopyWith<$Res>
    implements $MedicationRequestInitialFillCopyWith<$Res> {
  factory _$$_MedicationRequestInitialFillCopyWith(
          _$_MedicationRequestInitialFill value,
          $Res Function(_$_MedicationRequestInitialFill) then) =
      __$$_MedicationRequestInitialFillCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Quantity') Quantity? quantity,
      @JsonKey(name: 'Duration') Duration? duration});

  @override
  $QuantityCopyWith<$Res>? get quantity;
}

/// @nodoc
class __$$_MedicationRequestInitialFillCopyWithImpl<$Res>
    extends _$MedicationRequestInitialFillCopyWithImpl<$Res,
        _$_MedicationRequestInitialFill>
    implements _$$_MedicationRequestInitialFillCopyWith<$Res> {
  __$$_MedicationRequestInitialFillCopyWithImpl(
      _$_MedicationRequestInitialFill _value,
      $Res Function(_$_MedicationRequestInitialFill) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_MedicationRequestInitialFill(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationRequestInitialFill implements _MedicationRequestInitialFill {
  _$_MedicationRequestInitialFill(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'Duration') this.duration});

  factory _$_MedicationRequestInitialFill.fromJson(Map<String, dynamic> json) =>
      _$$_MedicationRequestInitialFillFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
//first medication fill quantity
  @override
  @JsonKey(name: 'Quantity')
  final Quantity? quantity;
//first medication fill duration
  @override
  @JsonKey(name: 'Duration')
  final Duration? duration;

  @override
  String toString() {
    return 'MedicationRequestInitialFill(id: $id, quantity: $quantity, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationRequestInitialFill &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationRequestInitialFillCopyWith<_$_MedicationRequestInitialFill>
      get copyWith => __$$_MedicationRequestInitialFillCopyWithImpl<
          _$_MedicationRequestInitialFill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationRequestInitialFillToJson(
      this,
    );
  }
}

abstract class _MedicationRequestInitialFill
    implements MedicationRequestInitialFill {
  factory _MedicationRequestInitialFill(
          {@JsonKey(name: 'ID') final String? id,
          @JsonKey(name: 'Quantity') final Quantity? quantity,
          @JsonKey(name: 'Duration') final Duration? duration}) =
      _$_MedicationRequestInitialFill;

  factory _MedicationRequestInitialFill.fromJson(Map<String, dynamic> json) =
      _$_MedicationRequestInitialFill.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override //first medication fill quantity
  @JsonKey(name: 'Quantity')
  Quantity? get quantity;
  @override //first medication fill duration
  @JsonKey(name: 'Duration')
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationRequestInitialFillCopyWith<_$_MedicationRequestInitialFill>
      get copyWith => throw _privateConstructorUsedError;
}

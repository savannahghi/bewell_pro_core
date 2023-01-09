// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medication_request_dispense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationRequestDispense _$MedicationRequestDispenseFromJson(
    Map<String, dynamic> json) {
  return _MedicationRequestDispense.fromJson(json);
}

/// @nodoc
mixin _$MedicationRequestDispense {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  ///first fill details
  @JsonKey(name: 'InitialFill')
  MedicationRequestInitialFill? get initialFill =>
      throw _privateConstructorUsedError; //Minimum period of time between dispenses
  @JsonKey(name: 'DispenseInterval')
  Duration? get dispenseInterval =>
      throw _privateConstructorUsedError; //Time period prescription is authorized for
  @JsonKey(name: 'ValidityPeriod')
  Period? get validityPeriod =>
      throw _privateConstructorUsedError; //Number of refills authorized
  @JsonKey(name: 'NumberOfRepeatsAllowed')
  int? get numberOfRepeatsAllowed =>
      throw _privateConstructorUsedError; //Amount of medication to prescribe per dispense
  @JsonKey(name: 'Quantity')
  Quantity? get quantity =>
      throw _privateConstructorUsedError; //Number of days prescribe per dispense
  @JsonKey(name: 'ExpectedSupplyDuration')
  Duration? get expectedSupplyDuration =>
      throw _privateConstructorUsedError; //Intended dispenser
  @JsonKey(name: 'Performer')
  Reference? get performer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationRequestDispenseCopyWith<MedicationRequestDispense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationRequestDispenseCopyWith<$Res> {
  factory $MedicationRequestDispenseCopyWith(MedicationRequestDispense value,
          $Res Function(MedicationRequestDispense) then) =
      _$MedicationRequestDispenseCopyWithImpl<$Res, MedicationRequestDispense>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'InitialFill') MedicationRequestInitialFill? initialFill,
      @JsonKey(name: 'DispenseInterval') Duration? dispenseInterval,
      @JsonKey(name: 'ValidityPeriod') Period? validityPeriod,
      @JsonKey(name: 'NumberOfRepeatsAllowed') int? numberOfRepeatsAllowed,
      @JsonKey(name: 'Quantity') Quantity? quantity,
      @JsonKey(name: 'ExpectedSupplyDuration') Duration? expectedSupplyDuration,
      @JsonKey(name: 'Performer') Reference? performer});

  $MedicationRequestInitialFillCopyWith<$Res>? get initialFill;
  $PeriodCopyWith<$Res>? get validityPeriod;
  $QuantityCopyWith<$Res>? get quantity;
  $ReferenceCopyWith<$Res>? get performer;
}

/// @nodoc
class _$MedicationRequestDispenseCopyWithImpl<$Res,
        $Val extends MedicationRequestDispense>
    implements $MedicationRequestDispenseCopyWith<$Res> {
  _$MedicationRequestDispenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? initialFill = freezed,
    Object? dispenseInterval = freezed,
    Object? validityPeriod = freezed,
    Object? numberOfRepeatsAllowed = freezed,
    Object? quantity = freezed,
    Object? expectedSupplyDuration = freezed,
    Object? performer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      initialFill: freezed == initialFill
          ? _value.initialFill
          : initialFill // ignore: cast_nullable_to_non_nullable
              as MedicationRequestInitialFill?,
      dispenseInterval: freezed == dispenseInterval
          ? _value.dispenseInterval
          : dispenseInterval // ignore: cast_nullable_to_non_nullable
              as Duration?,
      validityPeriod: freezed == validityPeriod
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      numberOfRepeatsAllowed: freezed == numberOfRepeatsAllowed
          ? _value.numberOfRepeatsAllowed
          : numberOfRepeatsAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      expectedSupplyDuration: freezed == expectedSupplyDuration
          ? _value.expectedSupplyDuration
          : expectedSupplyDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      performer: freezed == performer
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicationRequestInitialFillCopyWith<$Res>? get initialFill {
    if (_value.initialFill == null) {
      return null;
    }

    return $MedicationRequestInitialFillCopyWith<$Res>(_value.initialFill!,
        (value) {
      return _then(_value.copyWith(initialFill: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get validityPeriod {
    if (_value.validityPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.validityPeriod!, (value) {
      return _then(_value.copyWith(validityPeriod: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get performer {
    if (_value.performer == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.performer!, (value) {
      return _then(_value.copyWith(performer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicationRequestDispenseCopyWith<$Res>
    implements $MedicationRequestDispenseCopyWith<$Res> {
  factory _$$_MedicationRequestDispenseCopyWith(
          _$_MedicationRequestDispense value,
          $Res Function(_$_MedicationRequestDispense) then) =
      __$$_MedicationRequestDispenseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'InitialFill') MedicationRequestInitialFill? initialFill,
      @JsonKey(name: 'DispenseInterval') Duration? dispenseInterval,
      @JsonKey(name: 'ValidityPeriod') Period? validityPeriod,
      @JsonKey(name: 'NumberOfRepeatsAllowed') int? numberOfRepeatsAllowed,
      @JsonKey(name: 'Quantity') Quantity? quantity,
      @JsonKey(name: 'ExpectedSupplyDuration') Duration? expectedSupplyDuration,
      @JsonKey(name: 'Performer') Reference? performer});

  @override
  $MedicationRequestInitialFillCopyWith<$Res>? get initialFill;
  @override
  $PeriodCopyWith<$Res>? get validityPeriod;
  @override
  $QuantityCopyWith<$Res>? get quantity;
  @override
  $ReferenceCopyWith<$Res>? get performer;
}

/// @nodoc
class __$$_MedicationRequestDispenseCopyWithImpl<$Res>
    extends _$MedicationRequestDispenseCopyWithImpl<$Res,
        _$_MedicationRequestDispense>
    implements _$$_MedicationRequestDispenseCopyWith<$Res> {
  __$$_MedicationRequestDispenseCopyWithImpl(
      _$_MedicationRequestDispense _value,
      $Res Function(_$_MedicationRequestDispense) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? initialFill = freezed,
    Object? dispenseInterval = freezed,
    Object? validityPeriod = freezed,
    Object? numberOfRepeatsAllowed = freezed,
    Object? quantity = freezed,
    Object? expectedSupplyDuration = freezed,
    Object? performer = freezed,
  }) {
    return _then(_$_MedicationRequestDispense(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      initialFill: freezed == initialFill
          ? _value.initialFill
          : initialFill // ignore: cast_nullable_to_non_nullable
              as MedicationRequestInitialFill?,
      dispenseInterval: freezed == dispenseInterval
          ? _value.dispenseInterval
          : dispenseInterval // ignore: cast_nullable_to_non_nullable
              as Duration?,
      validityPeriod: freezed == validityPeriod
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      numberOfRepeatsAllowed: freezed == numberOfRepeatsAllowed
          ? _value.numberOfRepeatsAllowed
          : numberOfRepeatsAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      expectedSupplyDuration: freezed == expectedSupplyDuration
          ? _value.expectedSupplyDuration
          : expectedSupplyDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      performer: freezed == performer
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationRequestDispense implements _MedicationRequestDispense {
  _$_MedicationRequestDispense(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'InitialFill') this.initialFill,
      @JsonKey(name: 'DispenseInterval') this.dispenseInterval,
      @JsonKey(name: 'ValidityPeriod') this.validityPeriod,
      @JsonKey(name: 'NumberOfRepeatsAllowed') this.numberOfRepeatsAllowed,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'ExpectedSupplyDuration') this.expectedSupplyDuration,
      @JsonKey(name: 'Performer') this.performer});

  factory _$_MedicationRequestDispense.fromJson(Map<String, dynamic> json) =>
      _$$_MedicationRequestDispenseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  ///first fill details
  @override
  @JsonKey(name: 'InitialFill')
  final MedicationRequestInitialFill? initialFill;
//Minimum period of time between dispenses
  @override
  @JsonKey(name: 'DispenseInterval')
  final Duration? dispenseInterval;
//Time period prescription is authorized for
  @override
  @JsonKey(name: 'ValidityPeriod')
  final Period? validityPeriod;
//Number of refills authorized
  @override
  @JsonKey(name: 'NumberOfRepeatsAllowed')
  final int? numberOfRepeatsAllowed;
//Amount of medication to prescribe per dispense
  @override
  @JsonKey(name: 'Quantity')
  final Quantity? quantity;
//Number of days prescribe per dispense
  @override
  @JsonKey(name: 'ExpectedSupplyDuration')
  final Duration? expectedSupplyDuration;
//Intended dispenser
  @override
  @JsonKey(name: 'Performer')
  final Reference? performer;

  @override
  String toString() {
    return 'MedicationRequestDispense(id: $id, initialFill: $initialFill, dispenseInterval: $dispenseInterval, validityPeriod: $validityPeriod, numberOfRepeatsAllowed: $numberOfRepeatsAllowed, quantity: $quantity, expectedSupplyDuration: $expectedSupplyDuration, performer: $performer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationRequestDispense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.initialFill, initialFill) ||
                other.initialFill == initialFill) &&
            (identical(other.dispenseInterval, dispenseInterval) ||
                other.dispenseInterval == dispenseInterval) &&
            (identical(other.validityPeriod, validityPeriod) ||
                other.validityPeriod == validityPeriod) &&
            (identical(other.numberOfRepeatsAllowed, numberOfRepeatsAllowed) ||
                other.numberOfRepeatsAllowed == numberOfRepeatsAllowed) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.expectedSupplyDuration, expectedSupplyDuration) ||
                other.expectedSupplyDuration == expectedSupplyDuration) &&
            (identical(other.performer, performer) ||
                other.performer == performer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      initialFill,
      dispenseInterval,
      validityPeriod,
      numberOfRepeatsAllowed,
      quantity,
      expectedSupplyDuration,
      performer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationRequestDispenseCopyWith<_$_MedicationRequestDispense>
      get copyWith => __$$_MedicationRequestDispenseCopyWithImpl<
          _$_MedicationRequestDispense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationRequestDispenseToJson(
      this,
    );
  }
}

abstract class _MedicationRequestDispense implements MedicationRequestDispense {
  factory _MedicationRequestDispense(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'InitialFill')
          final MedicationRequestInitialFill? initialFill,
      @JsonKey(name: 'DispenseInterval')
          final Duration? dispenseInterval,
      @JsonKey(name: 'ValidityPeriod')
          final Period? validityPeriod,
      @JsonKey(name: 'NumberOfRepeatsAllowed')
          final int? numberOfRepeatsAllowed,
      @JsonKey(name: 'Quantity')
          final Quantity? quantity,
      @JsonKey(name: 'ExpectedSupplyDuration')
          final Duration? expectedSupplyDuration,
      @JsonKey(name: 'Performer')
          final Reference? performer}) = _$_MedicationRequestDispense;

  factory _MedicationRequestDispense.fromJson(Map<String, dynamic> json) =
      _$_MedicationRequestDispense.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  ///first fill details
  @JsonKey(name: 'InitialFill')
  MedicationRequestInitialFill? get initialFill;
  @override //Minimum period of time between dispenses
  @JsonKey(name: 'DispenseInterval')
  Duration? get dispenseInterval;
  @override //Time period prescription is authorized for
  @JsonKey(name: 'ValidityPeriod')
  Period? get validityPeriod;
  @override //Number of refills authorized
  @JsonKey(name: 'NumberOfRepeatsAllowed')
  int? get numberOfRepeatsAllowed;
  @override //Amount of medication to prescribe per dispense
  @JsonKey(name: 'Quantity')
  Quantity? get quantity;
  @override //Number of days prescribe per dispense
  @JsonKey(name: 'ExpectedSupplyDuration')
  Duration? get expectedSupplyDuration;
  @override //Intended dispenser
  @JsonKey(name: 'Performer')
  Reference? get performer;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationRequestDispenseCopyWith<_$_MedicationRequestDispense>
      get copyWith => throw _privateConstructorUsedError;
}

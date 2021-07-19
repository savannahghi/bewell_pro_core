// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'medication_request_dispense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationRequestDispense _$MedicationRequestDispenseFromJson(
    Map<String, dynamic> json) {
  return _MedicationRequestDispense.fromJson(json);
}

/// @nodoc
class _$MedicationRequestDispenseTearOff {
  const _$MedicationRequestDispenseTearOff();

  _MedicationRequestDispense call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'InitialFill') MedicationRequestInitialFill? initialFill,
      @JsonKey(name: 'DispenseInterval') Duration? dispenseInterval,
      @JsonKey(name: 'ValidityPeriod') Period? validityPeriod,
      @JsonKey(name: 'NumberOfRepeatsAllowed') int? numberOfRepeatsAllowed,
      @JsonKey(name: 'Quantity') Quantity? quantity,
      @JsonKey(name: 'ExpectedSupplyDuration') Duration? expectedSupplyDuration,
      @JsonKey(name: 'Performer') Reference? performer}) {
    return _MedicationRequestDispense(
      id: id,
      initialFill: initialFill,
      dispenseInterval: dispenseInterval,
      validityPeriod: validityPeriod,
      numberOfRepeatsAllowed: numberOfRepeatsAllowed,
      quantity: quantity,
      expectedSupplyDuration: expectedSupplyDuration,
      performer: performer,
    );
  }

  MedicationRequestDispense fromJson(Map<String, Object> json) {
    return MedicationRequestDispense.fromJson(json);
  }
}

/// @nodoc
const $MedicationRequestDispense = _$MedicationRequestDispenseTearOff();

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
      _$MedicationRequestDispenseCopyWithImpl<$Res>;
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
class _$MedicationRequestDispenseCopyWithImpl<$Res>
    implements $MedicationRequestDispenseCopyWith<$Res> {
  _$MedicationRequestDispenseCopyWithImpl(this._value, this._then);

  final MedicationRequestDispense _value;
  // ignore: unused_field
  final $Res Function(MedicationRequestDispense) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      initialFill: initialFill == freezed
          ? _value.initialFill
          : initialFill // ignore: cast_nullable_to_non_nullable
              as MedicationRequestInitialFill?,
      dispenseInterval: dispenseInterval == freezed
          ? _value.dispenseInterval
          : dispenseInterval // ignore: cast_nullable_to_non_nullable
              as Duration?,
      validityPeriod: validityPeriod == freezed
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      numberOfRepeatsAllowed: numberOfRepeatsAllowed == freezed
          ? _value.numberOfRepeatsAllowed
          : numberOfRepeatsAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      expectedSupplyDuration: expectedSupplyDuration == freezed
          ? _value.expectedSupplyDuration
          : expectedSupplyDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      performer: performer == freezed
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }

  @override
  $MedicationRequestInitialFillCopyWith<$Res>? get initialFill {
    if (_value.initialFill == null) {
      return null;
    }

    return $MedicationRequestInitialFillCopyWith<$Res>(_value.initialFill!,
        (value) {
      return _then(_value.copyWith(initialFill: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get validityPeriod {
    if (_value.validityPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.validityPeriod!, (value) {
      return _then(_value.copyWith(validityPeriod: value));
    });
  }

  @override
  $QuantityCopyWith<$Res>? get quantity {
    if (_value.quantity == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.quantity!, (value) {
      return _then(_value.copyWith(quantity: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get performer {
    if (_value.performer == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.performer!, (value) {
      return _then(_value.copyWith(performer: value));
    });
  }
}

/// @nodoc
abstract class _$MedicationRequestDispenseCopyWith<$Res>
    implements $MedicationRequestDispenseCopyWith<$Res> {
  factory _$MedicationRequestDispenseCopyWith(_MedicationRequestDispense value,
          $Res Function(_MedicationRequestDispense) then) =
      __$MedicationRequestDispenseCopyWithImpl<$Res>;
  @override
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
class __$MedicationRequestDispenseCopyWithImpl<$Res>
    extends _$MedicationRequestDispenseCopyWithImpl<$Res>
    implements _$MedicationRequestDispenseCopyWith<$Res> {
  __$MedicationRequestDispenseCopyWithImpl(_MedicationRequestDispense _value,
      $Res Function(_MedicationRequestDispense) _then)
      : super(_value, (v) => _then(v as _MedicationRequestDispense));

  @override
  _MedicationRequestDispense get _value =>
      super._value as _MedicationRequestDispense;

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
    return _then(_MedicationRequestDispense(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      initialFill: initialFill == freezed
          ? _value.initialFill
          : initialFill // ignore: cast_nullable_to_non_nullable
              as MedicationRequestInitialFill?,
      dispenseInterval: dispenseInterval == freezed
          ? _value.dispenseInterval
          : dispenseInterval // ignore: cast_nullable_to_non_nullable
              as Duration?,
      validityPeriod: validityPeriod == freezed
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      numberOfRepeatsAllowed: numberOfRepeatsAllowed == freezed
          ? _value.numberOfRepeatsAllowed
          : numberOfRepeatsAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      expectedSupplyDuration: expectedSupplyDuration == freezed
          ? _value.expectedSupplyDuration
          : expectedSupplyDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      performer: performer == freezed
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
      _$_$_MedicationRequestDispenseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  ///first fill details
  @JsonKey(name: 'InitialFill')
  final MedicationRequestInitialFill? initialFill;
  @override //Minimum period of time between dispenses
  @JsonKey(name: 'DispenseInterval')
  final Duration? dispenseInterval;
  @override //Time period prescription is authorized for
  @JsonKey(name: 'ValidityPeriod')
  final Period? validityPeriod;
  @override //Number of refills authorized
  @JsonKey(name: 'NumberOfRepeatsAllowed')
  final int? numberOfRepeatsAllowed;
  @override //Amount of medication to prescribe per dispense
  @JsonKey(name: 'Quantity')
  final Quantity? quantity;
  @override //Number of days prescribe per dispense
  @JsonKey(name: 'ExpectedSupplyDuration')
  final Duration? expectedSupplyDuration;
  @override //Intended dispenser
  @JsonKey(name: 'Performer')
  final Reference? performer;

  @override
  String toString() {
    return 'MedicationRequestDispense(id: $id, initialFill: $initialFill, dispenseInterval: $dispenseInterval, validityPeriod: $validityPeriod, numberOfRepeatsAllowed: $numberOfRepeatsAllowed, quantity: $quantity, expectedSupplyDuration: $expectedSupplyDuration, performer: $performer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MedicationRequestDispense &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.initialFill, initialFill) ||
                const DeepCollectionEquality()
                    .equals(other.initialFill, initialFill)) &&
            (identical(other.dispenseInterval, dispenseInterval) ||
                const DeepCollectionEquality()
                    .equals(other.dispenseInterval, dispenseInterval)) &&
            (identical(other.validityPeriod, validityPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.validityPeriod, validityPeriod)) &&
            (identical(other.numberOfRepeatsAllowed, numberOfRepeatsAllowed) ||
                const DeepCollectionEquality().equals(
                    other.numberOfRepeatsAllowed, numberOfRepeatsAllowed)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.expectedSupplyDuration, expectedSupplyDuration) ||
                const DeepCollectionEquality().equals(
                    other.expectedSupplyDuration, expectedSupplyDuration)) &&
            (identical(other.performer, performer) ||
                const DeepCollectionEquality()
                    .equals(other.performer, performer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(initialFill) ^
      const DeepCollectionEquality().hash(dispenseInterval) ^
      const DeepCollectionEquality().hash(validityPeriod) ^
      const DeepCollectionEquality().hash(numberOfRepeatsAllowed) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(expectedSupplyDuration) ^
      const DeepCollectionEquality().hash(performer);

  @JsonKey(ignore: true)
  @override
  _$MedicationRequestDispenseCopyWith<_MedicationRequestDispense>
      get copyWith =>
          __$MedicationRequestDispenseCopyWithImpl<_MedicationRequestDispense>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MedicationRequestDispenseToJson(this);
  }
}

abstract class _MedicationRequestDispense implements MedicationRequestDispense {
  factory _MedicationRequestDispense(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'InitialFill')
          MedicationRequestInitialFill? initialFill,
      @JsonKey(name: 'DispenseInterval')
          Duration? dispenseInterval,
      @JsonKey(name: 'ValidityPeriod')
          Period? validityPeriod,
      @JsonKey(name: 'NumberOfRepeatsAllowed')
          int? numberOfRepeatsAllowed,
      @JsonKey(name: 'Quantity')
          Quantity? quantity,
      @JsonKey(name: 'ExpectedSupplyDuration')
          Duration? expectedSupplyDuration,
      @JsonKey(name: 'Performer')
          Reference? performer}) = _$_MedicationRequestDispense;

  factory _MedicationRequestDispense.fromJson(Map<String, dynamic> json) =
      _$_MedicationRequestDispense.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  ///first fill details
  @JsonKey(name: 'InitialFill')
  MedicationRequestInitialFill? get initialFill =>
      throw _privateConstructorUsedError;
  @override //Minimum period of time between dispenses
  @JsonKey(name: 'DispenseInterval')
  Duration? get dispenseInterval => throw _privateConstructorUsedError;
  @override //Time period prescription is authorized for
  @JsonKey(name: 'ValidityPeriod')
  Period? get validityPeriod => throw _privateConstructorUsedError;
  @override //Number of refills authorized
  @JsonKey(name: 'NumberOfRepeatsAllowed')
  int? get numberOfRepeatsAllowed => throw _privateConstructorUsedError;
  @override //Amount of medication to prescribe per dispense
  @JsonKey(name: 'Quantity')
  Quantity? get quantity => throw _privateConstructorUsedError;
  @override //Number of days prescribe per dispense
  @JsonKey(name: 'ExpectedSupplyDuration')
  Duration? get expectedSupplyDuration => throw _privateConstructorUsedError;
  @override //Intended dispenser
  @JsonKey(name: 'Performer')
  Reference? get performer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MedicationRequestDispenseCopyWith<_MedicationRequestDispense>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dosage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dosage _$DosageFromJson(Map<String, dynamic> json) {
  return _Dosage.fromJson(json);
}

/// @nodoc
mixin _$Dosage {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sequence')
  int? get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdditionalInstruction')
  CodeableConcept? get additionalInstruction =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PatientInstruction')
  String? get patientInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timing')
  Timing? get timing => throw _privateConstructorUsedError;
  @JsonKey(name: 'AsNeededBoolean')
  bool? get asNeededBoolean => throw _privateConstructorUsedError;
  @JsonKey(name: 'Site')
  CodeableConcept? get site => throw _privateConstructorUsedError;
  @JsonKey(name: 'Route')
  CodeableConcept? get route => throw _privateConstructorUsedError;
  @JsonKey(name: 'Method')
  CodeableConcept? get method => throw _privateConstructorUsedError;
  @JsonKey(name: 'DoseAndRate')
  DosageDoseAndRate? get doseAndRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxDosePerPeriod')
  RateRatio? get maxDosePerPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxDosePerAdministration')
  Quantity? get maxDosePerAdministration => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxDosePerLifetime')
  Quantity? get maxDosePerLifetime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DosageCopyWith<Dosage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DosageCopyWith<$Res> {
  factory $DosageCopyWith(Dosage value, $Res Function(Dosage) then) =
      _$DosageCopyWithImpl<$Res, Dosage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Sequence')
          int? sequence,
      @JsonKey(name: 'Text')
          String? text,
      @JsonKey(name: 'AdditionalInstruction')
          CodeableConcept? additionalInstruction,
      @JsonKey(name: 'PatientInstruction')
          String? patientInstruction,
      @JsonKey(name: 'Timing')
          Timing? timing,
      @JsonKey(name: 'AsNeededBoolean')
          bool? asNeededBoolean,
      @JsonKey(name: 'Site')
          CodeableConcept? site,
      @JsonKey(name: 'Route')
          CodeableConcept? route,
      @JsonKey(name: 'Method')
          CodeableConcept? method,
      @JsonKey(name: 'DoseAndRate')
          DosageDoseAndRate? doseAndRate,
      @JsonKey(name: 'MaxDosePerPeriod')
          RateRatio? maxDosePerPeriod,
      @JsonKey(name: 'MaxDosePerAdministration')
          Quantity? maxDosePerAdministration,
      @JsonKey(name: 'MaxDosePerLifetime')
          Quantity? maxDosePerLifetime});

  $CodeableConceptCopyWith<$Res>? get additionalInstruction;
  $TimingCopyWith<$Res>? get timing;
  $CodeableConceptCopyWith<$Res>? get site;
  $CodeableConceptCopyWith<$Res>? get route;
  $CodeableConceptCopyWith<$Res>? get method;
  $DosageDoseAndRateCopyWith<$Res>? get doseAndRate;
  $RateRatioCopyWith<$Res>? get maxDosePerPeriod;
  $QuantityCopyWith<$Res>? get maxDosePerAdministration;
  $QuantityCopyWith<$Res>? get maxDosePerLifetime;
}

/// @nodoc
class _$DosageCopyWithImpl<$Res, $Val extends Dosage>
    implements $DosageCopyWith<$Res> {
  _$DosageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sequence = freezed,
    Object? text = freezed,
    Object? additionalInstruction = freezed,
    Object? patientInstruction = freezed,
    Object? timing = freezed,
    Object? asNeededBoolean = freezed,
    Object? site = freezed,
    Object? route = freezed,
    Object? method = freezed,
    Object? doseAndRate = freezed,
    Object? maxDosePerPeriod = freezed,
    Object? maxDosePerAdministration = freezed,
    Object? maxDosePerLifetime = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalInstruction: freezed == additionalInstruction
          ? _value.additionalInstruction
          : additionalInstruction // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patientInstruction: freezed == patientInstruction
          ? _value.patientInstruction
          : patientInstruction // ignore: cast_nullable_to_non_nullable
              as String?,
      timing: freezed == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as Timing?,
      asNeededBoolean: freezed == asNeededBoolean
          ? _value.asNeededBoolean
          : asNeededBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      doseAndRate: freezed == doseAndRate
          ? _value.doseAndRate
          : doseAndRate // ignore: cast_nullable_to_non_nullable
              as DosageDoseAndRate?,
      maxDosePerPeriod: freezed == maxDosePerPeriod
          ? _value.maxDosePerPeriod
          : maxDosePerPeriod // ignore: cast_nullable_to_non_nullable
              as RateRatio?,
      maxDosePerAdministration: freezed == maxDosePerAdministration
          ? _value.maxDosePerAdministration
          : maxDosePerAdministration // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      maxDosePerLifetime: freezed == maxDosePerLifetime
          ? _value.maxDosePerLifetime
          : maxDosePerLifetime // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get additionalInstruction {
    if (_value.additionalInstruction == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.additionalInstruction!,
        (value) {
      return _then(_value.copyWith(additionalInstruction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimingCopyWith<$Res>? get timing {
    if (_value.timing == null) {
      return null;
    }

    return $TimingCopyWith<$Res>(_value.timing!, (value) {
      return _then(_value.copyWith(timing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get site {
    if (_value.site == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.site!, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get route {
    if (_value.route == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.route!, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get method {
    if (_value.method == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.method!, (value) {
      return _then(_value.copyWith(method: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DosageDoseAndRateCopyWith<$Res>? get doseAndRate {
    if (_value.doseAndRate == null) {
      return null;
    }

    return $DosageDoseAndRateCopyWith<$Res>(_value.doseAndRate!, (value) {
      return _then(_value.copyWith(doseAndRate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateRatioCopyWith<$Res>? get maxDosePerPeriod {
    if (_value.maxDosePerPeriod == null) {
      return null;
    }

    return $RateRatioCopyWith<$Res>(_value.maxDosePerPeriod!, (value) {
      return _then(_value.copyWith(maxDosePerPeriod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get maxDosePerAdministration {
    if (_value.maxDosePerAdministration == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.maxDosePerAdministration!, (value) {
      return _then(_value.copyWith(maxDosePerAdministration: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get maxDosePerLifetime {
    if (_value.maxDosePerLifetime == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.maxDosePerLifetime!, (value) {
      return _then(_value.copyWith(maxDosePerLifetime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DosageCopyWith<$Res> implements $DosageCopyWith<$Res> {
  factory _$$_DosageCopyWith(_$_Dosage value, $Res Function(_$_Dosage) then) =
      __$$_DosageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Sequence')
          int? sequence,
      @JsonKey(name: 'Text')
          String? text,
      @JsonKey(name: 'AdditionalInstruction')
          CodeableConcept? additionalInstruction,
      @JsonKey(name: 'PatientInstruction')
          String? patientInstruction,
      @JsonKey(name: 'Timing')
          Timing? timing,
      @JsonKey(name: 'AsNeededBoolean')
          bool? asNeededBoolean,
      @JsonKey(name: 'Site')
          CodeableConcept? site,
      @JsonKey(name: 'Route')
          CodeableConcept? route,
      @JsonKey(name: 'Method')
          CodeableConcept? method,
      @JsonKey(name: 'DoseAndRate')
          DosageDoseAndRate? doseAndRate,
      @JsonKey(name: 'MaxDosePerPeriod')
          RateRatio? maxDosePerPeriod,
      @JsonKey(name: 'MaxDosePerAdministration')
          Quantity? maxDosePerAdministration,
      @JsonKey(name: 'MaxDosePerLifetime')
          Quantity? maxDosePerLifetime});

  @override
  $CodeableConceptCopyWith<$Res>? get additionalInstruction;
  @override
  $TimingCopyWith<$Res>? get timing;
  @override
  $CodeableConceptCopyWith<$Res>? get site;
  @override
  $CodeableConceptCopyWith<$Res>? get route;
  @override
  $CodeableConceptCopyWith<$Res>? get method;
  @override
  $DosageDoseAndRateCopyWith<$Res>? get doseAndRate;
  @override
  $RateRatioCopyWith<$Res>? get maxDosePerPeriod;
  @override
  $QuantityCopyWith<$Res>? get maxDosePerAdministration;
  @override
  $QuantityCopyWith<$Res>? get maxDosePerLifetime;
}

/// @nodoc
class __$$_DosageCopyWithImpl<$Res>
    extends _$DosageCopyWithImpl<$Res, _$_Dosage>
    implements _$$_DosageCopyWith<$Res> {
  __$$_DosageCopyWithImpl(_$_Dosage _value, $Res Function(_$_Dosage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sequence = freezed,
    Object? text = freezed,
    Object? additionalInstruction = freezed,
    Object? patientInstruction = freezed,
    Object? timing = freezed,
    Object? asNeededBoolean = freezed,
    Object? site = freezed,
    Object? route = freezed,
    Object? method = freezed,
    Object? doseAndRate = freezed,
    Object? maxDosePerPeriod = freezed,
    Object? maxDosePerAdministration = freezed,
    Object? maxDosePerLifetime = freezed,
  }) {
    return _then(_$_Dosage(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalInstruction: freezed == additionalInstruction
          ? _value.additionalInstruction
          : additionalInstruction // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patientInstruction: freezed == patientInstruction
          ? _value.patientInstruction
          : patientInstruction // ignore: cast_nullable_to_non_nullable
              as String?,
      timing: freezed == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as Timing?,
      asNeededBoolean: freezed == asNeededBoolean
          ? _value.asNeededBoolean
          : asNeededBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      doseAndRate: freezed == doseAndRate
          ? _value.doseAndRate
          : doseAndRate // ignore: cast_nullable_to_non_nullable
              as DosageDoseAndRate?,
      maxDosePerPeriod: freezed == maxDosePerPeriod
          ? _value.maxDosePerPeriod
          : maxDosePerPeriod // ignore: cast_nullable_to_non_nullable
              as RateRatio?,
      maxDosePerAdministration: freezed == maxDosePerAdministration
          ? _value.maxDosePerAdministration
          : maxDosePerAdministration // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      maxDosePerLifetime: freezed == maxDosePerLifetime
          ? _value.maxDosePerLifetime
          : maxDosePerLifetime // ignore: cast_nullable_to_non_nullable
              as Quantity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dosage implements _Dosage {
  _$_Dosage(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Sequence') this.sequence,
      @JsonKey(name: 'Text') this.text,
      @JsonKey(name: 'AdditionalInstruction') this.additionalInstruction,
      @JsonKey(name: 'PatientInstruction') this.patientInstruction,
      @JsonKey(name: 'Timing') this.timing,
      @JsonKey(name: 'AsNeededBoolean') this.asNeededBoolean,
      @JsonKey(name: 'Site') this.site,
      @JsonKey(name: 'Route') this.route,
      @JsonKey(name: 'Method') this.method,
      @JsonKey(name: 'DoseAndRate') this.doseAndRate,
      @JsonKey(name: 'MaxDosePerPeriod') this.maxDosePerPeriod,
      @JsonKey(name: 'MaxDosePerAdministration') this.maxDosePerAdministration,
      @JsonKey(name: 'MaxDosePerLifetime') this.maxDosePerLifetime});

  factory _$_Dosage.fromJson(Map<String, dynamic> json) =>
      _$$_DosageFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Sequence')
  final int? sequence;
  @override
  @JsonKey(name: 'Text')
  final String? text;
  @override
  @JsonKey(name: 'AdditionalInstruction')
  final CodeableConcept? additionalInstruction;
  @override
  @JsonKey(name: 'PatientInstruction')
  final String? patientInstruction;
  @override
  @JsonKey(name: 'Timing')
  final Timing? timing;
  @override
  @JsonKey(name: 'AsNeededBoolean')
  final bool? asNeededBoolean;
  @override
  @JsonKey(name: 'Site')
  final CodeableConcept? site;
  @override
  @JsonKey(name: 'Route')
  final CodeableConcept? route;
  @override
  @JsonKey(name: 'Method')
  final CodeableConcept? method;
  @override
  @JsonKey(name: 'DoseAndRate')
  final DosageDoseAndRate? doseAndRate;
  @override
  @JsonKey(name: 'MaxDosePerPeriod')
  final RateRatio? maxDosePerPeriod;
  @override
  @JsonKey(name: 'MaxDosePerAdministration')
  final Quantity? maxDosePerAdministration;
  @override
  @JsonKey(name: 'MaxDosePerLifetime')
  final Quantity? maxDosePerLifetime;

  @override
  String toString() {
    return 'Dosage(id: $id, sequence: $sequence, text: $text, additionalInstruction: $additionalInstruction, patientInstruction: $patientInstruction, timing: $timing, asNeededBoolean: $asNeededBoolean, site: $site, route: $route, method: $method, doseAndRate: $doseAndRate, maxDosePerPeriod: $maxDosePerPeriod, maxDosePerAdministration: $maxDosePerAdministration, maxDosePerLifetime: $maxDosePerLifetime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dosage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.additionalInstruction, additionalInstruction) ||
                other.additionalInstruction == additionalInstruction) &&
            (identical(other.patientInstruction, patientInstruction) ||
                other.patientInstruction == patientInstruction) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            (identical(other.asNeededBoolean, asNeededBoolean) ||
                other.asNeededBoolean == asNeededBoolean) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.doseAndRate, doseAndRate) ||
                other.doseAndRate == doseAndRate) &&
            (identical(other.maxDosePerPeriod, maxDosePerPeriod) ||
                other.maxDosePerPeriod == maxDosePerPeriod) &&
            (identical(
                    other.maxDosePerAdministration, maxDosePerAdministration) ||
                other.maxDosePerAdministration == maxDosePerAdministration) &&
            (identical(other.maxDosePerLifetime, maxDosePerLifetime) ||
                other.maxDosePerLifetime == maxDosePerLifetime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sequence,
      text,
      additionalInstruction,
      patientInstruction,
      timing,
      asNeededBoolean,
      site,
      route,
      method,
      doseAndRate,
      maxDosePerPeriod,
      maxDosePerAdministration,
      maxDosePerLifetime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DosageCopyWith<_$_Dosage> get copyWith =>
      __$$_DosageCopyWithImpl<_$_Dosage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DosageToJson(
      this,
    );
  }
}

abstract class _Dosage implements Dosage {
  factory _Dosage(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Sequence')
          final int? sequence,
      @JsonKey(name: 'Text')
          final String? text,
      @JsonKey(name: 'AdditionalInstruction')
          final CodeableConcept? additionalInstruction,
      @JsonKey(name: 'PatientInstruction')
          final String? patientInstruction,
      @JsonKey(name: 'Timing')
          final Timing? timing,
      @JsonKey(name: 'AsNeededBoolean')
          final bool? asNeededBoolean,
      @JsonKey(name: 'Site')
          final CodeableConcept? site,
      @JsonKey(name: 'Route')
          final CodeableConcept? route,
      @JsonKey(name: 'Method')
          final CodeableConcept? method,
      @JsonKey(name: 'DoseAndRate')
          final DosageDoseAndRate? doseAndRate,
      @JsonKey(name: 'MaxDosePerPeriod')
          final RateRatio? maxDosePerPeriod,
      @JsonKey(name: 'MaxDosePerAdministration')
          final Quantity? maxDosePerAdministration,
      @JsonKey(name: 'MaxDosePerLifetime')
          final Quantity? maxDosePerLifetime}) = _$_Dosage;

  factory _Dosage.fromJson(Map<String, dynamic> json) = _$_Dosage.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Sequence')
  int? get sequence;
  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(name: 'AdditionalInstruction')
  CodeableConcept? get additionalInstruction;
  @override
  @JsonKey(name: 'PatientInstruction')
  String? get patientInstruction;
  @override
  @JsonKey(name: 'Timing')
  Timing? get timing;
  @override
  @JsonKey(name: 'AsNeededBoolean')
  bool? get asNeededBoolean;
  @override
  @JsonKey(name: 'Site')
  CodeableConcept? get site;
  @override
  @JsonKey(name: 'Route')
  CodeableConcept? get route;
  @override
  @JsonKey(name: 'Method')
  CodeableConcept? get method;
  @override
  @JsonKey(name: 'DoseAndRate')
  DosageDoseAndRate? get doseAndRate;
  @override
  @JsonKey(name: 'MaxDosePerPeriod')
  RateRatio? get maxDosePerPeriod;
  @override
  @JsonKey(name: 'MaxDosePerAdministration')
  Quantity? get maxDosePerAdministration;
  @override
  @JsonKey(name: 'MaxDosePerLifetime')
  Quantity? get maxDosePerLifetime;
  @override
  @JsonKey(ignore: true)
  _$$_DosageCopyWith<_$_Dosage> get copyWith =>
      throw _privateConstructorUsedError;
}

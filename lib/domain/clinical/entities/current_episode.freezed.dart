// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'current_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeOfCare _$EpisodeOfCareFromJson(Map<String, dynamic> json) {
  return _EpisodeOfCare.fromJson(json);
}

/// @nodoc
class _$EpisodeOfCareTearOff {
  const _$EpisodeOfCareTearOff();

  _EpisodeOfCare call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'StatusHistory')
          List<EpisodeofcareStatusHistory?>? statusHistory,
      @JsonKey(name: 'Type')
          List<CodeableConcept?>? type,
      @JsonKey(name: 'Diagnosis')
          List<EpisodeofcareDiagnosis?>? diagnosis,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'ReferralRequest')
          List<Reference?>? referralRequest,
      @JsonKey(name: 'CareManager')
          Reference? careManager,
      @JsonKey(name: 'Team')
          List<Reference?>? team,
      @JsonKey(name: 'Account')
          List<Reference?>? account}) {
    return _EpisodeOfCare(
      id: id,
      text: text,
      identifier: identifier,
      status: status,
      statusHistory: statusHistory,
      type: type,
      diagnosis: diagnosis,
      patient: patient,
      managingOrganization: managingOrganization,
      period: period,
      referralRequest: referralRequest,
      careManager: careManager,
      team: team,
      account: account,
    );
  }

  EpisodeOfCare fromJson(Map<String, Object> json) {
    return EpisodeOfCare.fromJson(json);
  }
}

/// @nodoc
const $EpisodeOfCare = _$EpisodeOfCareTearOff();

/// @nodoc
mixin _$EpisodeOfCare {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  ///
  /// The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
  /// Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;

  /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  EpisodeOfCareStatusEnum? get status => throw _privateConstructorUsedError;

  /// The history of statuses that the EpisodeOfCare has been through
  /// without requiring processing the history of the resource
  @JsonKey(name: 'StatusHistory')
  List<EpisodeofcareStatusHistory?>? get statusHistory =>
      throw _privateConstructorUsedError;

  /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
  @JsonKey(name: 'Type')
  List<CodeableConcept?>? get type => throw _privateConstructorUsedError;

  ///The list of diagnosis relevant to this episode of care.
  @JsonKey(name: 'Diagnosis')
  List<EpisodeofcareDiagnosis?>? get diagnosis =>
      throw _privateConstructorUsedError;

  /// The patient who is the focus of this episode of care.
  @JsonKey(name: 'Patient')
  Reference? get patient => throw _privateConstructorUsedError;

  /// The organization that has assumed the specific responsibilities for the specified duration.
  @JsonKey(name: 'ManagingOrganization')
  Reference? get managingOrganization => throw _privateConstructorUsedError;

  /// The interval during which the managing organization assumes the defined responsibility.
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;

  /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
  @JsonKey(name: 'ReferralRequest')
  List<Reference?>? get referralRequest => throw _privateConstructorUsedError;

  /// The practitioner that is the care manager/care coordinator for this patient.
  @JsonKey(name: 'CareManager')
  Reference? get careManager => throw _privateConstructorUsedError;

  /// The list of practitioners that may be facilitating this episode of care for specific purposes.
  @JsonKey(name: 'Team')
  List<Reference?>? get team => throw _privateConstructorUsedError;

  /// The set of accounts that may be used for billing for this EpisodeOfCare.
  @JsonKey(name: 'Account')
  List<Reference?>? get account => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeOfCareCopyWith<EpisodeOfCare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeOfCareCopyWith<$Res> {
  factory $EpisodeOfCareCopyWith(
          EpisodeOfCare value, $Res Function(EpisodeOfCare) then) =
      _$EpisodeOfCareCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'StatusHistory')
          List<EpisodeofcareStatusHistory?>? statusHistory,
      @JsonKey(name: 'Type')
          List<CodeableConcept?>? type,
      @JsonKey(name: 'Diagnosis')
          List<EpisodeofcareDiagnosis?>? diagnosis,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'ReferralRequest')
          List<Reference?>? referralRequest,
      @JsonKey(name: 'CareManager')
          Reference? careManager,
      @JsonKey(name: 'Team')
          List<Reference?>? team,
      @JsonKey(name: 'Account')
          List<Reference?>? account});

  $NarrativeCopyWith<$Res>? get text;
  $ReferenceCopyWith<$Res>? get patient;
  $ReferenceCopyWith<$Res>? get managingOrganization;
  $PeriodCopyWith<$Res>? get period;
  $ReferenceCopyWith<$Res>? get careManager;
}

/// @nodoc
class _$EpisodeOfCareCopyWithImpl<$Res>
    implements $EpisodeOfCareCopyWith<$Res> {
  _$EpisodeOfCareCopyWithImpl(this._value, this._then);

  final EpisodeOfCare _value;
  // ignore: unused_field
  final $Res Function(EpisodeOfCare) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? identifier = freezed,
    Object? status = freezed,
    Object? statusHistory = freezed,
    Object? type = freezed,
    Object? diagnosis = freezed,
    Object? patient = freezed,
    Object? managingOrganization = freezed,
    Object? period = freezed,
    Object? referralRequest = freezed,
    Object? careManager = freezed,
    Object? team = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
      statusHistory: statusHistory == freezed
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareStatusHistory?>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      diagnosis: diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareDiagnosis?>?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      managingOrganization: managingOrganization == freezed
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      referralRequest: referralRequest == freezed
          ? _value.referralRequest
          : referralRequest // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      careManager: careManager == freezed
          ? _value.careManager
          : careManager // ignore: cast_nullable_to_non_nullable
              as Reference?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
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
  $ReferenceCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get managingOrganization {
    if (_value.managingOrganization == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.managingOrganization!, (value) {
      return _then(_value.copyWith(managingOrganization: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get careManager {
    if (_value.careManager == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.careManager!, (value) {
      return _then(_value.copyWith(careManager: value));
    });
  }
}

/// @nodoc
abstract class _$EpisodeOfCareCopyWith<$Res>
    implements $EpisodeOfCareCopyWith<$Res> {
  factory _$EpisodeOfCareCopyWith(
          _EpisodeOfCare value, $Res Function(_EpisodeOfCare) then) =
      __$EpisodeOfCareCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'StatusHistory')
          List<EpisodeofcareStatusHistory?>? statusHistory,
      @JsonKey(name: 'Type')
          List<CodeableConcept?>? type,
      @JsonKey(name: 'Diagnosis')
          List<EpisodeofcareDiagnosis?>? diagnosis,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'ReferralRequest')
          List<Reference?>? referralRequest,
      @JsonKey(name: 'CareManager')
          Reference? careManager,
      @JsonKey(name: 'Team')
          List<Reference?>? team,
      @JsonKey(name: 'Account')
          List<Reference?>? account});

  @override
  $NarrativeCopyWith<$Res>? get text;
  @override
  $ReferenceCopyWith<$Res>? get patient;
  @override
  $ReferenceCopyWith<$Res>? get managingOrganization;
  @override
  $PeriodCopyWith<$Res>? get period;
  @override
  $ReferenceCopyWith<$Res>? get careManager;
}

/// @nodoc
class __$EpisodeOfCareCopyWithImpl<$Res>
    extends _$EpisodeOfCareCopyWithImpl<$Res>
    implements _$EpisodeOfCareCopyWith<$Res> {
  __$EpisodeOfCareCopyWithImpl(
      _EpisodeOfCare _value, $Res Function(_EpisodeOfCare) _then)
      : super(_value, (v) => _then(v as _EpisodeOfCare));

  @override
  _EpisodeOfCare get _value => super._value as _EpisodeOfCare;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? identifier = freezed,
    Object? status = freezed,
    Object? statusHistory = freezed,
    Object? type = freezed,
    Object? diagnosis = freezed,
    Object? patient = freezed,
    Object? managingOrganization = freezed,
    Object? period = freezed,
    Object? referralRequest = freezed,
    Object? careManager = freezed,
    Object? team = freezed,
    Object? account = freezed,
  }) {
    return _then(_EpisodeOfCare(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
      statusHistory: statusHistory == freezed
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareStatusHistory?>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      diagnosis: diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareDiagnosis?>?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      managingOrganization: managingOrganization == freezed
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      referralRequest: referralRequest == freezed
          ? _value.referralRequest
          : referralRequest // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      careManager: careManager == freezed
          ? _value.careManager
          : careManager // ignore: cast_nullable_to_non_nullable
              as Reference?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeOfCare implements _EpisodeOfCare {
  _$_EpisodeOfCare(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Text')
          this.text,
      @JsonKey(name: 'Identifier')
          this.identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          this.status,
      @JsonKey(name: 'StatusHistory')
          this.statusHistory,
      @JsonKey(name: 'Type')
          this.type,
      @JsonKey(name: 'Diagnosis')
          this.diagnosis,
      @JsonKey(name: 'Patient')
          this.patient,
      @JsonKey(name: 'ManagingOrganization')
          this.managingOrganization,
      @JsonKey(name: 'Period')
          this.period,
      @JsonKey(name: 'ReferralRequest')
          this.referralRequest,
      @JsonKey(name: 'CareManager')
          this.careManager,
      @JsonKey(name: 'Team')
          this.team,
      @JsonKey(name: 'Account')
          this.account});

  factory _$_EpisodeOfCare.fromJson(Map<String, dynamic> json) =>
      _$_$_EpisodeOfCareFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  ///
  /// The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
  /// Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
  @JsonKey(name: 'Text')
  final Narrative? text;
  @override

  /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
  @JsonKey(name: 'Identifier')
  final List<Identifier?>? identifier;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  final EpisodeOfCareStatusEnum? status;
  @override

  /// The history of statuses that the EpisodeOfCare has been through
  /// without requiring processing the history of the resource
  @JsonKey(name: 'StatusHistory')
  final List<EpisodeofcareStatusHistory?>? statusHistory;
  @override

  /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
  @JsonKey(name: 'Type')
  final List<CodeableConcept?>? type;
  @override

  ///The list of diagnosis relevant to this episode of care.
  @JsonKey(name: 'Diagnosis')
  final List<EpisodeofcareDiagnosis?>? diagnosis;
  @override

  /// The patient who is the focus of this episode of care.
  @JsonKey(name: 'Patient')
  final Reference? patient;
  @override

  /// The organization that has assumed the specific responsibilities for the specified duration.
  @JsonKey(name: 'ManagingOrganization')
  final Reference? managingOrganization;
  @override

  /// The interval during which the managing organization assumes the defined responsibility.
  @JsonKey(name: 'Period')
  final Period? period;
  @override

  /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
  @JsonKey(name: 'ReferralRequest')
  final List<Reference?>? referralRequest;
  @override

  /// The practitioner that is the care manager/care coordinator for this patient.
  @JsonKey(name: 'CareManager')
  final Reference? careManager;
  @override

  /// The list of practitioners that may be facilitating this episode of care for specific purposes.
  @JsonKey(name: 'Team')
  final List<Reference?>? team;
  @override

  /// The set of accounts that may be used for billing for this EpisodeOfCare.
  @JsonKey(name: 'Account')
  final List<Reference?>? account;

  @override
  String toString() {
    return 'EpisodeOfCare(id: $id, text: $text, identifier: $identifier, status: $status, statusHistory: $statusHistory, type: $type, diagnosis: $diagnosis, patient: $patient, managingOrganization: $managingOrganization, period: $period, referralRequest: $referralRequest, careManager: $careManager, team: $team, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EpisodeOfCare &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusHistory, statusHistory) ||
                const DeepCollectionEquality()
                    .equals(other.statusHistory, statusHistory)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)) &&
            (identical(other.patient, patient) ||
                const DeepCollectionEquality()
                    .equals(other.patient, patient)) &&
            (identical(other.managingOrganization, managingOrganization) ||
                const DeepCollectionEquality().equals(
                    other.managingOrganization, managingOrganization)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.referralRequest, referralRequest) ||
                const DeepCollectionEquality()
                    .equals(other.referralRequest, referralRequest)) &&
            (identical(other.careManager, careManager) ||
                const DeepCollectionEquality()
                    .equals(other.careManager, careManager)) &&
            (identical(other.team, team) ||
                const DeepCollectionEquality().equals(other.team, team)) &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusHistory) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(diagnosis) ^
      const DeepCollectionEquality().hash(patient) ^
      const DeepCollectionEquality().hash(managingOrganization) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(referralRequest) ^
      const DeepCollectionEquality().hash(careManager) ^
      const DeepCollectionEquality().hash(team) ^
      const DeepCollectionEquality().hash(account);

  @JsonKey(ignore: true)
  @override
  _$EpisodeOfCareCopyWith<_EpisodeOfCare> get copyWith =>
      __$EpisodeOfCareCopyWithImpl<_EpisodeOfCare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EpisodeOfCareToJson(this);
  }
}

abstract class _EpisodeOfCare implements EpisodeOfCare {
  factory _EpisodeOfCare(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'StatusHistory')
          List<EpisodeofcareStatusHistory?>? statusHistory,
      @JsonKey(name: 'Type')
          List<CodeableConcept?>? type,
      @JsonKey(name: 'Diagnosis')
          List<EpisodeofcareDiagnosis?>? diagnosis,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'ReferralRequest')
          List<Reference?>? referralRequest,
      @JsonKey(name: 'CareManager')
          Reference? careManager,
      @JsonKey(name: 'Team')
          List<Reference?>? team,
      @JsonKey(name: 'Account')
          List<Reference?>? account}) = _$_EpisodeOfCare;

  factory _EpisodeOfCare.fromJson(Map<String, dynamic> json) =
      _$_EpisodeOfCare.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  ///
  /// The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
  /// Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;
  @override

  /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  EpisodeOfCareStatusEnum? get status => throw _privateConstructorUsedError;
  @override

  /// The history of statuses that the EpisodeOfCare has been through
  /// without requiring processing the history of the resource
  @JsonKey(name: 'StatusHistory')
  List<EpisodeofcareStatusHistory?>? get statusHistory =>
      throw _privateConstructorUsedError;
  @override

  /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
  @JsonKey(name: 'Type')
  List<CodeableConcept?>? get type => throw _privateConstructorUsedError;
  @override

  ///The list of diagnosis relevant to this episode of care.
  @JsonKey(name: 'Diagnosis')
  List<EpisodeofcareDiagnosis?>? get diagnosis =>
      throw _privateConstructorUsedError;
  @override

  /// The patient who is the focus of this episode of care.
  @JsonKey(name: 'Patient')
  Reference? get patient => throw _privateConstructorUsedError;
  @override

  /// The organization that has assumed the specific responsibilities for the specified duration.
  @JsonKey(name: 'ManagingOrganization')
  Reference? get managingOrganization => throw _privateConstructorUsedError;
  @override

  /// The interval during which the managing organization assumes the defined responsibility.
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;
  @override

  /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
  @JsonKey(name: 'ReferralRequest')
  List<Reference?>? get referralRequest => throw _privateConstructorUsedError;
  @override

  /// The practitioner that is the care manager/care coordinator for this patient.
  @JsonKey(name: 'CareManager')
  Reference? get careManager => throw _privateConstructorUsedError;
  @override

  /// The list of practitioners that may be facilitating this episode of care for specific purposes.
  @JsonKey(name: 'Team')
  List<Reference?>? get team => throw _privateConstructorUsedError;
  @override

  /// The set of accounts that may be used for billing for this EpisodeOfCare.
  @JsonKey(name: 'Account')
  List<Reference?>? get account => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EpisodeOfCareCopyWith<_EpisodeOfCare> get copyWith =>
      throw _privateConstructorUsedError;
}

EpisodeOfCarePayload _$EpisodeOfCarePayloadFromJson(Map<String, dynamic> json) {
  return _EpisodeOfCarePayload.fromJson(json);
}

/// @nodoc
class _$EpisodeOfCarePayloadTearOff {
  const _$EpisodeOfCarePayloadTearOff();

  _EpisodeOfCarePayload call(
      {@JsonKey(name: 'totalVisits') int? totalVisits,
      @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare}) {
    return _EpisodeOfCarePayload(
      totalVisits: totalVisits,
      episodeOfCare: episodeOfCare,
    );
  }

  EpisodeOfCarePayload fromJson(Map<String, Object> json) {
    return EpisodeOfCarePayload.fromJson(json);
  }
}

/// @nodoc
const $EpisodeOfCarePayload = _$EpisodeOfCarePayloadTearOff();

/// @nodoc
mixin _$EpisodeOfCarePayload {
  @JsonKey(name: 'totalVisits')
  int? get totalVisits => throw _privateConstructorUsedError;
  @JsonKey(name: 'episodeOfCare')
  EpisodeOfCare? get episodeOfCare => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeOfCarePayloadCopyWith<EpisodeOfCarePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeOfCarePayloadCopyWith<$Res> {
  factory $EpisodeOfCarePayloadCopyWith(EpisodeOfCarePayload value,
          $Res Function(EpisodeOfCarePayload) then) =
      _$EpisodeOfCarePayloadCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'totalVisits') int? totalVisits,
      @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare});

  $EpisodeOfCareCopyWith<$Res>? get episodeOfCare;
}

/// @nodoc
class _$EpisodeOfCarePayloadCopyWithImpl<$Res>
    implements $EpisodeOfCarePayloadCopyWith<$Res> {
  _$EpisodeOfCarePayloadCopyWithImpl(this._value, this._then);

  final EpisodeOfCarePayload _value;
  // ignore: unused_field
  final $Res Function(EpisodeOfCarePayload) _then;

  @override
  $Res call({
    Object? totalVisits = freezed,
    Object? episodeOfCare = freezed,
  }) {
    return _then(_value.copyWith(
      totalVisits: totalVisits == freezed
          ? _value.totalVisits
          : totalVisits // ignore: cast_nullable_to_non_nullable
              as int?,
      episodeOfCare: episodeOfCare == freezed
          ? _value.episodeOfCare
          : episodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
    ));
  }

  @override
  $EpisodeOfCareCopyWith<$Res>? get episodeOfCare {
    if (_value.episodeOfCare == null) {
      return null;
    }

    return $EpisodeOfCareCopyWith<$Res>(_value.episodeOfCare!, (value) {
      return _then(_value.copyWith(episodeOfCare: value));
    });
  }
}

/// @nodoc
abstract class _$EpisodeOfCarePayloadCopyWith<$Res>
    implements $EpisodeOfCarePayloadCopyWith<$Res> {
  factory _$EpisodeOfCarePayloadCopyWith(_EpisodeOfCarePayload value,
          $Res Function(_EpisodeOfCarePayload) then) =
      __$EpisodeOfCarePayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'totalVisits') int? totalVisits,
      @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare});

  @override
  $EpisodeOfCareCopyWith<$Res>? get episodeOfCare;
}

/// @nodoc
class __$EpisodeOfCarePayloadCopyWithImpl<$Res>
    extends _$EpisodeOfCarePayloadCopyWithImpl<$Res>
    implements _$EpisodeOfCarePayloadCopyWith<$Res> {
  __$EpisodeOfCarePayloadCopyWithImpl(
      _EpisodeOfCarePayload _value, $Res Function(_EpisodeOfCarePayload) _then)
      : super(_value, (v) => _then(v as _EpisodeOfCarePayload));

  @override
  _EpisodeOfCarePayload get _value => super._value as _EpisodeOfCarePayload;

  @override
  $Res call({
    Object? totalVisits = freezed,
    Object? episodeOfCare = freezed,
  }) {
    return _then(_EpisodeOfCarePayload(
      totalVisits: totalVisits == freezed
          ? _value.totalVisits
          : totalVisits // ignore: cast_nullable_to_non_nullable
              as int?,
      episodeOfCare: episodeOfCare == freezed
          ? _value.episodeOfCare
          : episodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeOfCarePayload implements _EpisodeOfCarePayload {
  _$_EpisodeOfCarePayload(
      {@JsonKey(name: 'totalVisits') this.totalVisits,
      @JsonKey(name: 'episodeOfCare') this.episodeOfCare});

  factory _$_EpisodeOfCarePayload.fromJson(Map<String, dynamic> json) =>
      _$_$_EpisodeOfCarePayloadFromJson(json);

  @override
  @JsonKey(name: 'totalVisits')
  final int? totalVisits;
  @override
  @JsonKey(name: 'episodeOfCare')
  final EpisodeOfCare? episodeOfCare;

  @override
  String toString() {
    return 'EpisodeOfCarePayload(totalVisits: $totalVisits, episodeOfCare: $episodeOfCare)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EpisodeOfCarePayload &&
            (identical(other.totalVisits, totalVisits) ||
                const DeepCollectionEquality()
                    .equals(other.totalVisits, totalVisits)) &&
            (identical(other.episodeOfCare, episodeOfCare) ||
                const DeepCollectionEquality()
                    .equals(other.episodeOfCare, episodeOfCare)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalVisits) ^
      const DeepCollectionEquality().hash(episodeOfCare);

  @JsonKey(ignore: true)
  @override
  _$EpisodeOfCarePayloadCopyWith<_EpisodeOfCarePayload> get copyWith =>
      __$EpisodeOfCarePayloadCopyWithImpl<_EpisodeOfCarePayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EpisodeOfCarePayloadToJson(this);
  }
}

abstract class _EpisodeOfCarePayload implements EpisodeOfCarePayload {
  factory _EpisodeOfCarePayload(
          {@JsonKey(name: 'totalVisits') int? totalVisits,
          @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare}) =
      _$_EpisodeOfCarePayload;

  factory _EpisodeOfCarePayload.fromJson(Map<String, dynamic> json) =
      _$_EpisodeOfCarePayload.fromJson;

  @override
  @JsonKey(name: 'totalVisits')
  int? get totalVisits => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'episodeOfCare')
  EpisodeOfCare? get episodeOfCare => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EpisodeOfCarePayloadCopyWith<_EpisodeOfCarePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeOfCare _$EpisodeOfCareFromJson(Map<String, dynamic> json) {
  return _EpisodeOfCare.fromJson(json);
}

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
      _$EpisodeOfCareCopyWithImpl<$Res, EpisodeOfCare>;
  @useResult
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
class _$EpisodeOfCareCopyWithImpl<$Res, $Val extends EpisodeOfCare>
    implements $EpisodeOfCareCopyWith<$Res> {
  _$EpisodeOfCareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
      statusHistory: freezed == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareStatusHistory?>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      diagnosis: freezed == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareDiagnosis?>?,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      managingOrganization: freezed == managingOrganization
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      referralRequest: freezed == referralRequest
          ? _value.referralRequest
          : referralRequest // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      careManager: freezed == careManager
          ? _value.careManager
          : careManager // ignore: cast_nullable_to_non_nullable
              as Reference?,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
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
  $ReferenceCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get managingOrganization {
    if (_value.managingOrganization == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.managingOrganization!, (value) {
      return _then(_value.copyWith(managingOrganization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get careManager {
    if (_value.careManager == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.careManager!, (value) {
      return _then(_value.copyWith(careManager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EpisodeOfCareCopyWith<$Res>
    implements $EpisodeOfCareCopyWith<$Res> {
  factory _$$_EpisodeOfCareCopyWith(
          _$_EpisodeOfCare value, $Res Function(_$_EpisodeOfCare) then) =
      __$$_EpisodeOfCareCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_EpisodeOfCareCopyWithImpl<$Res>
    extends _$EpisodeOfCareCopyWithImpl<$Res, _$_EpisodeOfCare>
    implements _$$_EpisodeOfCareCopyWith<$Res> {
  __$$_EpisodeOfCareCopyWithImpl(
      _$_EpisodeOfCare _value, $Res Function(_$_EpisodeOfCare) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_EpisodeOfCare(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: freezed == identifier
          ? _value._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
      statusHistory: freezed == statusHistory
          ? _value._statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareStatusHistory?>?,
      type: freezed == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      diagnosis: freezed == diagnosis
          ? _value._diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as List<EpisodeofcareDiagnosis?>?,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      managingOrganization: freezed == managingOrganization
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      referralRequest: freezed == referralRequest
          ? _value._referralRequest
          : referralRequest // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      careManager: freezed == careManager
          ? _value.careManager
          : careManager // ignore: cast_nullable_to_non_nullable
              as Reference?,
      team: freezed == team
          ? _value._team
          : team // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      account: freezed == account
          ? _value._account
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
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          this.status,
      @JsonKey(name: 'StatusHistory')
          final List<EpisodeofcareStatusHistory?>? statusHistory,
      @JsonKey(name: 'Type')
          final List<CodeableConcept?>? type,
      @JsonKey(name: 'Diagnosis')
          final List<EpisodeofcareDiagnosis?>? diagnosis,
      @JsonKey(name: 'Patient')
          this.patient,
      @JsonKey(name: 'ManagingOrganization')
          this.managingOrganization,
      @JsonKey(name: 'Period')
          this.period,
      @JsonKey(name: 'ReferralRequest')
          final List<Reference?>? referralRequest,
      @JsonKey(name: 'CareManager')
          this.careManager,
      @JsonKey(name: 'Team')
          final List<Reference?>? team,
      @JsonKey(name: 'Account')
          final List<Reference?>? account})
      : _identifier = identifier,
        _statusHistory = statusHistory,
        _type = type,
        _diagnosis = diagnosis,
        _referralRequest = referralRequest,
        _team = team,
        _account = account;

  factory _$_EpisodeOfCare.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeOfCareFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  ///
  /// The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
  /// Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
  @override
  @JsonKey(name: 'Text')
  final Narrative? text;

  /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
  final List<Identifier?>? _identifier;

  /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  final EpisodeOfCareStatusEnum? status;

  /// The history of statuses that the EpisodeOfCare has been through
  /// without requiring processing the history of the resource
  final List<EpisodeofcareStatusHistory?>? _statusHistory;

  /// The history of statuses that the EpisodeOfCare has been through
  /// without requiring processing the history of the resource
  @override
  @JsonKey(name: 'StatusHistory')
  List<EpisodeofcareStatusHistory?>? get statusHistory {
    final value = _statusHistory;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
  final List<CodeableConcept?>? _type;

  /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
  @override
  @JsonKey(name: 'Type')
  List<CodeableConcept?>? get type {
    final value = _type;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  ///The list of diagnosis relevant to this episode of care.
  final List<EpisodeofcareDiagnosis?>? _diagnosis;

  ///The list of diagnosis relevant to this episode of care.
  @override
  @JsonKey(name: 'Diagnosis')
  List<EpisodeofcareDiagnosis?>? get diagnosis {
    final value = _diagnosis;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The patient who is the focus of this episode of care.
  @override
  @JsonKey(name: 'Patient')
  final Reference? patient;

  /// The organization that has assumed the specific responsibilities for the specified duration.
  @override
  @JsonKey(name: 'ManagingOrganization')
  final Reference? managingOrganization;

  /// The interval during which the managing organization assumes the defined responsibility.
  @override
  @JsonKey(name: 'Period')
  final Period? period;

  /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
  final List<Reference?>? _referralRequest;

  /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
  @override
  @JsonKey(name: 'ReferralRequest')
  List<Reference?>? get referralRequest {
    final value = _referralRequest;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The practitioner that is the care manager/care coordinator for this patient.
  @override
  @JsonKey(name: 'CareManager')
  final Reference? careManager;

  /// The list of practitioners that may be facilitating this episode of care for specific purposes.
  final List<Reference?>? _team;

  /// The list of practitioners that may be facilitating this episode of care for specific purposes.
  @override
  @JsonKey(name: 'Team')
  List<Reference?>? get team {
    final value = _team;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The set of accounts that may be used for billing for this EpisodeOfCare.
  final List<Reference?>? _account;

  /// The set of accounts that may be used for billing for this EpisodeOfCare.
  @override
  @JsonKey(name: 'Account')
  List<Reference?>? get account {
    final value = _account;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EpisodeOfCare(id: $id, text: $text, identifier: $identifier, status: $status, statusHistory: $statusHistory, type: $type, diagnosis: $diagnosis, patient: $patient, managingOrganization: $managingOrganization, period: $period, referralRequest: $referralRequest, careManager: $careManager, team: $team, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeOfCare &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._statusHistory, _statusHistory) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            const DeepCollectionEquality()
                .equals(other._diagnosis, _diagnosis) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.managingOrganization, managingOrganization) ||
                other.managingOrganization == managingOrganization) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._referralRequest, _referralRequest) &&
            (identical(other.careManager, careManager) ||
                other.careManager == careManager) &&
            const DeepCollectionEquality().equals(other._team, _team) &&
            const DeepCollectionEquality().equals(other._account, _account));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      const DeepCollectionEquality().hash(_identifier),
      status,
      const DeepCollectionEquality().hash(_statusHistory),
      const DeepCollectionEquality().hash(_type),
      const DeepCollectionEquality().hash(_diagnosis),
      patient,
      managingOrganization,
      period,
      const DeepCollectionEquality().hash(_referralRequest),
      careManager,
      const DeepCollectionEquality().hash(_team),
      const DeepCollectionEquality().hash(_account));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeOfCareCopyWith<_$_EpisodeOfCare> get copyWith =>
      __$$_EpisodeOfCareCopyWithImpl<_$_EpisodeOfCare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeOfCareToJson(
      this,
    );
  }
}

abstract class _EpisodeOfCare implements EpisodeOfCare {
  factory _EpisodeOfCare(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Text')
          final Narrative? text,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          final EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'StatusHistory')
          final List<EpisodeofcareStatusHistory?>? statusHistory,
      @JsonKey(name: 'Type')
          final List<CodeableConcept?>? type,
      @JsonKey(name: 'Diagnosis')
          final List<EpisodeofcareDiagnosis?>? diagnosis,
      @JsonKey(name: 'Patient')
          final Reference? patient,
      @JsonKey(name: 'ManagingOrganization')
          final Reference? managingOrganization,
      @JsonKey(name: 'Period')
          final Period? period,
      @JsonKey(name: 'ReferralRequest')
          final List<Reference?>? referralRequest,
      @JsonKey(name: 'CareManager')
          final Reference? careManager,
      @JsonKey(name: 'Team')
          final List<Reference?>? team,
      @JsonKey(name: 'Account')
          final List<Reference?>? account}) = _$_EpisodeOfCare;

  factory _EpisodeOfCare.fromJson(Map<String, dynamic> json) =
      _$_EpisodeOfCare.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  ///
  /// The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
  /// Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
  @JsonKey(name: 'Text')
  Narrative? get text;
  @override

  /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  EpisodeOfCareStatusEnum? get status;
  @override

  /// The history of statuses that the EpisodeOfCare has been through
  /// without requiring processing the history of the resource
  @JsonKey(name: 'StatusHistory')
  List<EpisodeofcareStatusHistory?>? get statusHistory;
  @override

  /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
  @JsonKey(name: 'Type')
  List<CodeableConcept?>? get type;
  @override

  ///The list of diagnosis relevant to this episode of care.
  @JsonKey(name: 'Diagnosis')
  List<EpisodeofcareDiagnosis?>? get diagnosis;
  @override

  /// The patient who is the focus of this episode of care.
  @JsonKey(name: 'Patient')
  Reference? get patient;
  @override

  /// The organization that has assumed the specific responsibilities for the specified duration.
  @JsonKey(name: 'ManagingOrganization')
  Reference? get managingOrganization;
  @override

  /// The interval during which the managing organization assumes the defined responsibility.
  @JsonKey(name: 'Period')
  Period? get period;
  @override

  /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
  @JsonKey(name: 'ReferralRequest')
  List<Reference?>? get referralRequest;
  @override

  /// The practitioner that is the care manager/care coordinator for this patient.
  @JsonKey(name: 'CareManager')
  Reference? get careManager;
  @override

  /// The list of practitioners that may be facilitating this episode of care for specific purposes.
  @JsonKey(name: 'Team')
  List<Reference?>? get team;
  @override

  /// The set of accounts that may be used for billing for this EpisodeOfCare.
  @JsonKey(name: 'Account')
  List<Reference?>? get account;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeOfCareCopyWith<_$_EpisodeOfCare> get copyWith =>
      throw _privateConstructorUsedError;
}

EpisodeOfCarePayload _$EpisodeOfCarePayloadFromJson(Map<String, dynamic> json) {
  return _EpisodeOfCarePayload.fromJson(json);
}

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
      _$EpisodeOfCarePayloadCopyWithImpl<$Res, EpisodeOfCarePayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalVisits') int? totalVisits,
      @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare});

  $EpisodeOfCareCopyWith<$Res>? get episodeOfCare;
}

/// @nodoc
class _$EpisodeOfCarePayloadCopyWithImpl<$Res,
        $Val extends EpisodeOfCarePayload>
    implements $EpisodeOfCarePayloadCopyWith<$Res> {
  _$EpisodeOfCarePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVisits = freezed,
    Object? episodeOfCare = freezed,
  }) {
    return _then(_value.copyWith(
      totalVisits: freezed == totalVisits
          ? _value.totalVisits
          : totalVisits // ignore: cast_nullable_to_non_nullable
              as int?,
      episodeOfCare: freezed == episodeOfCare
          ? _value.episodeOfCare
          : episodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EpisodeOfCareCopyWith<$Res>? get episodeOfCare {
    if (_value.episodeOfCare == null) {
      return null;
    }

    return $EpisodeOfCareCopyWith<$Res>(_value.episodeOfCare!, (value) {
      return _then(_value.copyWith(episodeOfCare: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EpisodeOfCarePayloadCopyWith<$Res>
    implements $EpisodeOfCarePayloadCopyWith<$Res> {
  factory _$$_EpisodeOfCarePayloadCopyWith(_$_EpisodeOfCarePayload value,
          $Res Function(_$_EpisodeOfCarePayload) then) =
      __$$_EpisodeOfCarePayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalVisits') int? totalVisits,
      @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare});

  @override
  $EpisodeOfCareCopyWith<$Res>? get episodeOfCare;
}

/// @nodoc
class __$$_EpisodeOfCarePayloadCopyWithImpl<$Res>
    extends _$EpisodeOfCarePayloadCopyWithImpl<$Res, _$_EpisodeOfCarePayload>
    implements _$$_EpisodeOfCarePayloadCopyWith<$Res> {
  __$$_EpisodeOfCarePayloadCopyWithImpl(_$_EpisodeOfCarePayload _value,
      $Res Function(_$_EpisodeOfCarePayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVisits = freezed,
    Object? episodeOfCare = freezed,
  }) {
    return _then(_$_EpisodeOfCarePayload(
      totalVisits: freezed == totalVisits
          ? _value.totalVisits
          : totalVisits // ignore: cast_nullable_to_non_nullable
              as int?,
      episodeOfCare: freezed == episodeOfCare
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
      _$$_EpisodeOfCarePayloadFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeOfCarePayload &&
            (identical(other.totalVisits, totalVisits) ||
                other.totalVisits == totalVisits) &&
            (identical(other.episodeOfCare, episodeOfCare) ||
                other.episodeOfCare == episodeOfCare));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalVisits, episodeOfCare);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeOfCarePayloadCopyWith<_$_EpisodeOfCarePayload> get copyWith =>
      __$$_EpisodeOfCarePayloadCopyWithImpl<_$_EpisodeOfCarePayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeOfCarePayloadToJson(
      this,
    );
  }
}

abstract class _EpisodeOfCarePayload implements EpisodeOfCarePayload {
  factory _EpisodeOfCarePayload(
          {@JsonKey(name: 'totalVisits') final int? totalVisits,
          @JsonKey(name: 'episodeOfCare') final EpisodeOfCare? episodeOfCare}) =
      _$_EpisodeOfCarePayload;

  factory _EpisodeOfCarePayload.fromJson(Map<String, dynamic> json) =
      _$_EpisodeOfCarePayload.fromJson;

  @override
  @JsonKey(name: 'totalVisits')
  int? get totalVisits;
  @override
  @JsonKey(name: 'episodeOfCare')
  EpisodeOfCare? get episodeOfCare;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeOfCarePayloadCopyWith<_$_EpisodeOfCarePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

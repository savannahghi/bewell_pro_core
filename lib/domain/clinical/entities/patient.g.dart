// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$_$_PatientFromJson(Map<String, dynamic> json) {
  return _$_Patient(
    id: json['ID'] as String?,
    text: json['Text'] == null
        ? null
        : Narrative.fromJson(json['Text'] as Map<String, dynamic>),
    identifier: (json['Identifier'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    active: json['Active'] as bool?,
    name: (json['Name'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : HumanName.fromJson(e as Map<String, dynamic>))
        .toList(),
    telecom: (json['Telecom'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : ContactPoint.fromJson(e as Map<String, dynamic>))
        .toList(),
    gender: _$enumDecodeNullable(_$PatientGenderEnumEnumMap, json['Gender'],
        unknownValue: PatientGenderEnum.unknown),
    birthDate: json['BirthDate'] as String?,
    deceasedBool: json['DeceasedBoolean'] as bool?,
    deceasedDateTime: json['DeceasedDateTime'] as String?,
    multipleBirthBoolean: json['MultipleBirthBoolean'] as bool?,
    multipleBirthInteger: json['MultipleBirthInteger'] as int?,
    address: json['Address'] == null
        ? null
        : Address.fromJson(json['Address'] as Map<String, dynamic>),
    maritalStatus: json['MaritalStatus'] == null
        ? null
        : CodeableConcept.fromJson(
            json['MaritalStatus'] as Map<String, dynamic>),
    photo: (json['Photo'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    contact: json['Contact'] == null
        ? null
        : PatientContact.fromJson(json['Contact'] as Map<String, dynamic>),
    communication: (json['Communication'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : Communication.fromJson(e as Map<String, dynamic>))
        .toList(),
    generalPractitioner: (json['GeneralPractitioner'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    managingOrganization: json['ManagingOrganization'] == null
        ? null
        : Reference.fromJson(
            json['ManagingOrganization'] as Map<String, dynamic>),
    link: (json['Link'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : PatientLink.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Text': instance.text?.toJson(),
      'Identifier': instance.identifier?.map((e) => e?.toJson()).toList(),
      'Active': instance.active,
      'Name': instance.name?.map((e) => e?.toJson()).toList(),
      'Telecom': instance.telecom?.map((e) => e?.toJson()).toList(),
      'Gender': _$PatientGenderEnumEnumMap[instance.gender],
      'BirthDate': instance.birthDate,
      'DeceasedBoolean': instance.deceasedBool,
      'DeceasedDateTime': instance.deceasedDateTime,
      'MultipleBirthBoolean': instance.multipleBirthBoolean,
      'MultipleBirthInteger': instance.multipleBirthInteger,
      'Address': instance.address?.toJson(),
      'MaritalStatus': instance.maritalStatus?.toJson(),
      'Photo': instance.photo?.map((e) => e.toJson()).toList(),
      'Contact': instance.contact?.toJson(),
      'Communication': instance.communication?.map((e) => e?.toJson()).toList(),
      'GeneralPractitioner':
          instance.generalPractitioner?.map((e) => e?.toJson()).toList(),
      'ManagingOrganization': instance.managingOrganization?.toJson(),
      'Link': instance.link?.map((e) => e?.toJson()).toList(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PatientGenderEnumEnumMap = {
  PatientGenderEnum.male: 'male',
  PatientGenderEnum.female: 'female',
  PatientGenderEnum.other: null,
  PatientGenderEnum.unknown: 'unknown',
};

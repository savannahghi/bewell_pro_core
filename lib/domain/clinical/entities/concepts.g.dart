// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concepts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConceptName _$_$_ConceptNameFromJson(Map<String, dynamic> json) {
  return _$_ConceptName(
    loading: json['external_id'] as String?,
    locale: json['locale'] as String?,
    name: json['name'] as String?,
    nameType: json['name_type'] as String?,
    type: json['type'] as String?,
    uuid: json['uuid'] as String?,
  );
}

Map<String, dynamic> _$_$_ConceptNameToJson(_$_ConceptName instance) =>
    <String, dynamic>{
      'external_id': instance.loading,
      'locale': instance.locale,
      'name': instance.name,
      'name_type': instance.nameType,
      'type': instance.type,
      'uuid': instance.uuid,
    };

_$_Description _$_$_DescriptionFromJson(Map<String, dynamic> json) {
  return _$_Description(
    description: json['description'] as String?,
    descriptionType: json['description_type'] as String?,
    type: json['type'] as String?,
    uuid: json['uuid'] as String?,
  );
}

Map<String, dynamic> _$_$_DescriptionToJson(_$_Description instance) =>
    <String, dynamic>{
      'description': instance.description,
      'description_type': instance.descriptionType,
      'type': instance.type,
      'uuid': instance.uuid,
    };

_$_Concept _$_$_ConceptFromJson(Map<String, dynamic> json) {
  return _$_Concept(
    conceptClass: json['concept_class'] as String?,
    createdOn: json['created_on'] as String?,
    dataType: json['datatype'] as String?,
    descriptions: (json['descriptions'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Description.fromJson(e as Map<String, dynamic>))
        .toList(),
    displayLocale: json['display_locale'] as String?,
    displayName: json['display_name'] as String?,
    externalID: json['external_id'] as String?,
    id: json['id'] as String?,
    isLatestVersion: json['is_latest_version'] as bool?,
    locale: json['locale'] as String?,
    owner: json['owner'] as String?,
    retired: json['retired'] as bool?,
    uuid: json['uuid'] as String?,
    source: json['source'] as String?,
    sourceURL: json['source_url'] as String?,
    type: json['type'] as String?,
    updatedOn: json['updated_on'] as String?,
    url: json['url'] as String?,
    version: json['version'] as String?,
    names: (json['names'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : ConceptName.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ConceptToJson(_$_Concept instance) =>
    <String, dynamic>{
      'concept_class': instance.conceptClass,
      'created_on': instance.createdOn,
      'datatype': instance.dataType,
      'descriptions': instance.descriptions?.map((e) => e?.toJson()).toList(),
      'display_locale': instance.displayLocale,
      'display_name': instance.displayName,
      'external_id': instance.externalID,
      'id': instance.id,
      'is_latest_version': instance.isLatestVersion,
      'locale': instance.locale,
      'owner': instance.owner,
      'retired': instance.retired,
      'uuid': instance.uuid,
      'source': instance.source,
      'source_url': instance.sourceURL,
      'type': instance.type,
      'updated_on': instance.updatedOn,
      'url': instance.url,
      'version': instance.version,
      'names': instance.names?.map((e) => e?.toJson()).toList(),
    };

_$_ConceptList _$_$_ConceptListFromJson(Map<String, dynamic> json) {
  return _$_ConceptList(
    listConcepts: (json['listConcepts'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Concept.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ConceptListToJson(_$_ConceptList instance) =>
    <String, dynamic>{
      'listConcepts': instance.listConcepts?.map((e) => e?.toJson()).toList(),
    };

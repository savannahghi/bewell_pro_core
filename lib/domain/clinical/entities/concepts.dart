import 'package:freezed_annotation/freezed_annotation.dart';

part 'concepts.freezed.dart';
part 'concepts.g.dart';

@freezed
class ConceptName with _$ConceptName {
  factory ConceptName({
    @JsonKey(name: 'external_id') String? loading,
    @JsonKey(name: 'locale') String? locale,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'name_type') String? nameType,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'uuid') String? uuid,
  }) = _ConceptName;

  factory ConceptName.fromJson(Map<String, dynamic> json) =>
      _$ConceptNameFromJson(json);
}

@freezed
class Description with _$Description {
  factory Description({
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'description_type') String? descriptionType,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'uuid') String? uuid,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}

/// [Concepts] used when listing diagnoses and medication
/// Refer to https://gitlab.slade360emr.com/optimalhealth/healthcloud/-/wikis/Clinical-APIs
@freezed
class Concept with _$Concept {
  factory Concept({
    @JsonKey(name: 'concept_class') String? conceptClass,
    @JsonKey(name: 'created_on') String? createdOn,
    @JsonKey(name: 'datatype') String? dataType,
    @JsonKey(name: 'descriptions') List<Description?>? descriptions,
    @JsonKey(name: 'display_locale') String? displayLocale,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'external_id') String? externalID,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'is_latest_version') bool? isLatestVersion,
    @JsonKey(name: 'locale') String? locale,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'retired') bool? retired,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'source') String? source,
    @JsonKey(name: 'source_url') String? sourceURL,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'updated_on') String? updatedOn,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'version') String? version,
    @JsonKey(name: 'names') List<ConceptName?>? names,
  }) = _Concept;

  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
}

@freezed
class ConceptList with _$ConceptList {
  factory ConceptList({
    @JsonKey(name: 'listConcepts') List<Concept?>? listConcepts,
  }) = _ConceptList;

  factory ConceptList.fromJson(Map<String, dynamic> json) =>
      _$ConceptListFromJson(json);
}

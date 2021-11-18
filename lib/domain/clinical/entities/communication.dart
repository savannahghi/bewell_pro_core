// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';

part 'communication.freezed.dart';
part 'communication.g.dart';

/// FHIRPatientCommunication definition: demographics and other administrative
///  information about an individual or animal receiving care or other
///  health-related services.
///
///
@freezed
class Communication with _$Communication {
  factory Communication({
    @JsonKey(name: 'ID') String? id,

    /// The ISO-639-1 alpha 2 code in lower case for the language, optionally
    ///  followed by a hyphen and the ISO-3166-1 alpha 2 code for the region
    ///  in upper case; e.g. "en" for English, or "en-US"
    ///  for American English versus "en-EN" for England English.
    @JsonKey(name: 'language') CodeableConcept? language,

    /// Indicates whether or not the patient prefers this language
    ///  (over other languages he masters up a certain level).
    @JsonKey(name: 'preferred') bool? preferred,
  }) = _Communication;
  factory Communication.fromJson(Map<String, dynamic> json) =>
      _$CommunicationFromJson(json);
}

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/email_input.dart';
import 'package:bewell_pro_core/domain/core/entities/identification_details.dart';
import 'package:bewell_pro_core/domain/core/entities/name_input.dart';
import 'package:bewell_pro_core/domain/core/entities/payload_input.dart';
import 'package:bewell_pro_core/domain/core/entities/phone_number_input.dart';
import 'package:bewell_pro_core/domain/core/entities/photo_input.dart';
import 'patient_registration_image_data.dart';

class SimplePatientRegistrationInput {
  final String? id;
  final List<NameInput> names;
  final String gender;
  final IdentificationDetails identificationDetails;
  final DateTime birthDate;
  final List<PhoneNumberInput> phoneNumbers;
  final List<PhotoInput>? photos;
  final List<EmailInput>? emails;
  final MaritalStatus? maritalStatus;
  final List<Language>? languages;
  final bool active;
  final bool? replicateUSSD;

  SimplePatientRegistrationInput({
    required this.names,
    required this.gender,
    required this.identificationDetails,
    required this.birthDate,
    required this.phoneNumbers,
    required this.active,
    this.id,
    this.photos,
    this.emails,
    this.maritalStatus,
    this.languages,
    this.replicateUSSD,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'names': names.map(_mapPayloadInputListToMap).toList(),
      'gender': gender,
      'identificationDocuments':
          identificationDetails.images?.map(_mapDocumentsToMap).toList(),
      'birthDate': DateFormat('yyyy-MM-dd').format(birthDate),
      'phoneNumbers': phoneNumbers.map(_mapPayloadInputListToMap).toList(),
      'photos': photos?.map(_mapPayloadInputListToMap).toList(),
      'emails': emails?.map(_mapPayloadInputListToMap).toList(),
      'maritalStatus': maritalStatus?.fhirName,
      'languages': languages
          ?.map((Language language) => language.toStringShort())
          .toList(),
      'active': active,
      'replicateUSSD': replicateUSSD,
    };
  }

  Map<String, dynamic> _mapDocumentsToMap(
      PatientRegistrationImageData imageData) {
    return <String, String>{
      'documentType': identificationDetails.documentType.uploadFormat,
      'documentNumber': identificationDetails.documentNumber,
      'title': imageData.title,
      'imageContentType': imageData.contentType.toStringShort(),
      'imageBase64': imageData.base64Data
    };
  }

  Map<String, dynamic> _mapPayloadInputListToMap(PayloadInput item) =>
      item.toMap();
}

// Package imports:
import 'package:sghi_core/domain_objects/value_objects/enums.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/email_input.dart';
import 'package:bewell_pro_core/domain/core/entities/name_input.dart';
import 'package:bewell_pro_core/domain/core/entities/payload_input.dart';
import 'package:bewell_pro_core/domain/core/entities/phone_number_input.dart';

class SimpleNextOfKinInput with PayloadInput {
  final String patientID;
  final List<NameInput> names;
  final List<PhoneNumberInput> phoneNumbers;
  final List<EmailInput>? emails;
  final Gender gender;
  final DateTime birthDate;
  final NextOfKinRelation relationship;
  final bool active;

  SimpleNextOfKinInput({
    required this.patientID,
    required this.names,
    required this.phoneNumbers,
    required this.gender,
    required this.birthDate,
    required this.relationship,
    required this.active,
    this.emails,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patientID': patientID,
      'names': names.map(_mapPayloadInputListToMap).toList(),
      'phoneNumbers': phoneNumbers.map(_mapPayloadInputListToMap).toList(),
      'emails': emails?.map(_mapPayloadInputListToMap).toList(),
      'gender': gender.name.toLowerCase(),
      'birthDate': DateFormat('yyyy-MM-dd').format(birthDate),
      'relationship': relationship.fhirName,
      'active': active,
    };
  }

  Map<String, dynamic> _mapPayloadInputListToMap(PayloadInput item) =>
      item.toMap();
}

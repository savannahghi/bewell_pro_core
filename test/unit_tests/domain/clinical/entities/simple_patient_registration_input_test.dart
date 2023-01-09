// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_registration_image_data.dart';
import 'package:bewell_pro_core/domain/clinical/entities/simple_patient_registration_input.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/identification_details.dart';
import 'package:bewell_pro_core/domain/core/entities/name_input.dart';
import 'package:bewell_pro_core/domain/core/entities/phone_number_input.dart';
import 'package:sghi_core/domain_objects/value_objects/name.dart';
import 'package:sghi_core/domain_objects/value_objects/phone_number.dart';

void main() {
  test('toMap() function returns a correct map', () {
    final SimplePatientRegistrationInput simplePatientRegistrationInput =
        SimplePatientRegistrationInput(
      names: <NameInput>[
        NameInput(
          firstName: Name.withValue('Bewell'),
          lastName: Name.withValue('Professional'),
        )
      ],
      gender: 'Male',
      identificationDetails: IdentificationDetails(
          documentType: DocumentType.National_ID,
          documentNumber: '123456',
          images: <PatientRegistrationImageData>[
            PatientRegistrationImageData(
              contentType: ImageContentType.PNG,
              fileName: '',
              base64Data: '',
              filePath: './image.jpg',
              title: ImageDocumentType.IDDocumentFront.name,
            ),
          ]),
      birthDate: DateTime(1990, 1, 2),
      phoneNumbers: <PhoneNumberInput>[
        PhoneNumberInput(
          msisdn: PhoneNumber.withValue('0123456789'),
          verificationCode: '1234',
          isUSSD: true,
          communicationOptIn: true,
        )
      ],
      active: true,
      languages: <Language>[Language.en, Language.sw],
    );

    final Map<String, dynamic> simplePatientRegistrationInputMap =
        simplePatientRegistrationInput.toMap();
    expect(simplePatientRegistrationInputMap.containsKey('id'), true);
  });
}

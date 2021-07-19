import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/next_of_kin_data_validator.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('validate next of kin data', () {
    final Map<String, dynamic> findPatientByMSISDN =
        json.decode(findPatientByMSISDNJson) as Map<String, dynamic>;
    final PatientConnection patientConnection = PatientConnection.fromJson(
        findPatientByMSISDN['data']['findPatientsByMSISDN']
            as Map<String, dynamic>);
    test('check self is next of kin', () {
      expect(
          NextOfKinValidation.isSelfNextOfKin(
              '+254712345678', patientConnection),
          true);

      expect(NextOfKinValidation.isSelfNextOfKin('+254712345678', null), false);

      expect(NextOfKinValidation.isSelfNextOfKin('+2547', patientConnection),
          false);

      expect(
          NextOfKinValidation.isSelfNextOfKin(null, patientConnection), false);

      expect(NextOfKinValidation.isSelfNextOfKin('', patientConnection), false);
      expect(NextOfKinValidation.isSelfNextOfKin('', null), false);
    });

    test('check if there is any active record', () {
      expect(NextOfKinValidation.isRecordActive(patientConnection), true);
    });

    test('list of active patient', () {
      expect(
          NextOfKinValidation.activePatientRecords(patientConnection)
              .isNotEmpty,
          true);
    });
  });
}

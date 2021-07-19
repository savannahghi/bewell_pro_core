import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';

void main() {
  test('Patient info should create a valid object from json', () {
    final Map<String, dynamic> _patientInfoData = <String, dynamic>{
      'patientId': 'some id',
      'patientReference': 'some reference',
      'encounterId': 'some encounter id',
    };

    final PatientInfo _serializedPatientInfo =
        PatientInfo.fromJson(_patientInfoData);
    expect(_serializedPatientInfo.patientId, 'some id');
    expect(_serializedPatientInfo.patientReference, 'some reference');
    expect(_serializedPatientInfo.encounterId, 'some encounter id');
  });
}

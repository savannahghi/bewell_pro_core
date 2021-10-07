// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_link.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patientLink_type_enum.dart';

void main() {
  test('PatientLink should create a valid object', () {
    final PatientLink _patientLink =
        PatientLink(id: 'Some id', type: PatientLinkTypeEnum.seealso);

    final Map<String, dynamic> _patientLinkObject = _patientLink.toJson();

    expect(_patientLinkObject.containsKey('ID'), true);
    expect(_patientLinkObject.containsKey('Type'), true);

    final Map<String, dynamic> patientLinkData = <String, dynamic>{
      'ID': 'some id',
      'Type': 'some type'
    };

    final PatientLink _serializedpatientLink =
        PatientLink.fromJson(patientLinkData);

    expect(_serializedpatientLink.id, 'some id');
    expect(_serializedpatientLink.type, PatientLinkTypeEnum.refer);
  });
}

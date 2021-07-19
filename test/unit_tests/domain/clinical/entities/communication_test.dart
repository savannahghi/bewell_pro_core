import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/communication.dart';

void main() {
  test('Communication should create a valid object', () {
    final Communication _communication = Communication(
        id: 'some id',
        language: CodeableConcept(text: 'English'),
        preferred: true);

    final Map<String, dynamic> _communicationObject = _communication.toJson();
    expect(_communicationObject.containsKey('ID'), true);
    expect(_communicationObject.containsKey('language'), true);
    expect(_communicationObject.containsKey('preferred'), true);

    final Map<String, dynamic> _communicationData = <String, dynamic>{
      'ID': 'some id',
      'language': <String, dynamic>{'Text': 'English'},
      'preferred': true,
    };
    final Communication _serializedCommunication =
        Communication.fromJson(_communicationData);
    expect(_serializedCommunication.id, 'some id');
    expect(_serializedCommunication.language!.text, 'English');
    expect(_serializedCommunication.preferred, true);
  });
}

// Package imports:
import 'package:flutter_test/flutter_test.dart';

import 'package:bewell_pro_core/domain/clinical/entities/concepts.dart'
    as entity;

void main() {
  test('ConceptName creates a valid object', () {
    final Map<String, dynamic> conceptMap = <String, dynamic>{
      'name': 'some name',
      'name_type': 'some name type'
    };
    final entity.ConceptName conceptName =
        entity.ConceptName.fromJson(conceptMap);

    expect(conceptName.name, 'some name');
    expect(conceptName.nameType, 'some name type');
  });
  test('Description creates a valid object', () {
    final Map<String, dynamic> dsecriptionMap = <String, dynamic>{
      'description': 'some description',
      'description_type': 'some description type'
    };
    final entity.Description description =
        entity.Description.fromJson(dsecriptionMap);

    expect(description.description, 'some description');
    expect(description.descriptionType, 'some description type');
  });
}

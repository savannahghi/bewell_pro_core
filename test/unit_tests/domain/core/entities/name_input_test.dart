import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/entities/name_input.dart';
import 'package:domain_objects/value_objects.dart';

void main() {
  final Map<String, String> data = <String, String>{
    'firstName': 'John',
    'lastName': 'doe',
    'otherNames': 'coder',
  };

  test('name input type returns a map', () {
    final Name first = Name.withValue('John');
    final Name last = Name.withValue('doe');
    final Name other = Name.withValue('coder');

    expect(
        NameInput(firstName: first, lastName: last, otherNames: other).toMap(),
        data);
  });
}

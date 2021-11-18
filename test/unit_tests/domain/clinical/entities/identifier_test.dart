// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/identifier_use_enum.dart';

void main() {
  test('Identifier should create a valid object', () {
    final Identifier _identifier = Identifier(
        id: 'some id',
        use: IdentifierUseEnum.official,
        system: 'some system',
        value: 'some value');

    final Map<String, dynamic> _identifierObject = _identifier.toJson();
    expect(_identifierObject.containsKey('ID'), true);
    expect(_identifierObject.containsKey('Use'), true);
    expect(_identifierObject.containsKey('System'), true);

    final Map<String, dynamic> _identifierData = <String, dynamic>{
      'ID': 'some id',
      'Use': IdentifierUseEnum.official,
      'System': 'some system',
      'Value': 'some value',
    };
    final Identifier _serializedIdentifier =
        Identifier.fromJson(_identifierData);
    expect(_serializedIdentifier.id, 'some id');
    expect(_serializedIdentifier.use, IdentifierUseEnum.official);
    expect(_serializedIdentifier.system, 'some system');
    expect(_serializedIdentifier.value, 'some value');
  });
}

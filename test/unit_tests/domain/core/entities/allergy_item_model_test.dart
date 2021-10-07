// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/allergy_item.dart';

void main() {
  group('AllergyItem', () {
    test('should return correct instance of AllergyItem', () {
      const Map<String, dynamic> item = <String, dynamic>{
        'reaction': <Map<String, dynamic>>[
          <String, dynamic>{
            'substance': <String, String>{'text': ''},
            'description': '',
            'severity': ''
          }
        ],
        'note': <Map<String, String>>[
          <String, String>{'text': ''}
        ]
      };

      final AllergyItem allergyItem = AllergyItem(item: item);
      expect(allergyItem.substance, '');
      expect(allergyItem.reaction, '');
      expect(allergyItem.severity, '');
      expect(allergyItem.note, '');
    });
  });
}

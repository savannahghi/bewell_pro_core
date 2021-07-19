import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/text_or_html.dart';

void main() {
  group('TextOrHtml creates valid objects', () {
    test('TextOrHtml creates a valid object', () {
      final TextOrHtml textOrHtmlObject = TextOrHtml(left('value'));
      expect(
          textOrHtmlObject.value
              .fold((String value) => 'value', (String error) => null),
          'value');
    });
    test('TextOrHtml should determine whether text is html or not', () {
      final TextOrHtml textWithoutHtml =
          TextOrHtml.withValue('text without html tags');
      textWithoutHtml.value.fold(
          (String textWithoutHtml) => 'text without html tags',
          (String textWithHtml) => null);

      final TextOrHtml textWithHtml =
          TextOrHtml.withValue('text with <html> tags </html>');
      textWithHtml.value.fold((String textWithoutHtml) => null,
          (String textWithHtml) => 'text with <html> tags </html>');
    });
  });
}

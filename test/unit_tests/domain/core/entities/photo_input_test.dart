// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/photo_input.dart';

void main() {
  final Map<String, dynamic> data = <String, String>{
    'photoContentType': 'JPG',
    'photoBase64data': 'photoBase64data',
    'photoFileName': 'photoFilename',
  };

  test('photo input returns map', () {
    const ImageContentType image = ImageContentType.JPG;

    expect(
        PhotoInput(
                photoBase64data: 'photoBase64data',
                photoContentType: image,
                photoFilename: 'photoFilename')
            .toMap(),
        data);
  });
}

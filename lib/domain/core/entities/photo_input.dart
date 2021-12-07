// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/payload_input.dart';

class PhotoInput with PayloadInput {
  final ImageContentType photoContentType;
  final String photoBase64data;
  final String photoFilename;

  PhotoInput({
    required this.photoContentType,
    required this.photoBase64data,
    required this.photoFilename,
  });

  @override
  Map<String, String> toMap() {
    return <String, String>{
      'photoContentType': photoContentType.toStringShort(),
      'photoBase64data': photoBase64data,
      'photoFileName': photoFilename,
    };
  }
}

import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

class PatientRegistrationImageData {
  final ImageContentType contentType;
  final String fileName;
  final String base64Data;

  final String title;
  final String filePath;

  PatientRegistrationImageData({
    required this.contentType,
    required this.fileName,
    required this.base64Data,
    required this.title,
    required this.filePath,
  });
}

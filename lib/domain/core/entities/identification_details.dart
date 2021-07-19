import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_registration_image_data.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

part 'identification_details.freezed.dart';

@freezed
class IdentificationDetails with _$IdentificationDetails {
  const factory IdentificationDetails({
    required DocumentType documentType,
    required String documentNumber,
    List<PatientRegistrationImageData>? images,
  }) = _IdentificationDetails;
}

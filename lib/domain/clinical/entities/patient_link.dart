import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patientLink_type_enum.dart';

part 'patient_link.freezed.dart';
part 'patient_link.g.dart';

/// Demographics and other administrative
///  information about an individual or animal receiving care or other
///  health-related services.
@freezed
class PatientLink with _$PatientLink {
  factory PatientLink({
    @JsonKey(name: 'ID') String? id,

    /// The other patient resource that the link refers to.
    @JsonKey(name: 'Other') Reference? other,

    /// The type of link between this patient resource and another patient
    ///  resource.
    @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
        PatientLinkTypeEnum? type,
  }) = _PatientLink;

  factory PatientLink.fromJson(Map<String, dynamic> json) =>
      _$PatientLinkFromJson(json);
}

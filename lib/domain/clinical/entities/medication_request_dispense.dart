// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_initial_fill.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';

part 'medication_request_dispense.freezed.dart';
part 'medication_request_dispense.g.dart';

///this class is for the provision of a supply of a medication in response to a prescription

@freezed
class MedicationRequestDispense with _$MedicationRequestDispense {
  factory MedicationRequestDispense({
    @JsonKey(name: 'ID') String? id,

    ///first fill details
    @JsonKey(name: 'InitialFill') MedicationRequestInitialFill? initialFill,

    //Minimum period of time between dispenses
    @JsonKey(name: 'DispenseInterval') Duration? dispenseInterval,

    //Time period prescription is authorized for
    @JsonKey(name: 'ValidityPeriod') Period? validityPeriod,

    //Number of refills authorized
    @JsonKey(name: 'NumberOfRepeatsAllowed') int? numberOfRepeatsAllowed,

    //Amount of medication to prescribe per dispense
    @JsonKey(name: 'Quantity') Quantity? quantity,

    //Number of days prescribe per dispense
    @JsonKey(name: 'ExpectedSupplyDuration') Duration? expectedSupplyDuration,

    //Intended dispenser
    @JsonKey(name: 'Performer') Reference? performer,
  }) = _MedicationRequestDispense;

  factory MedicationRequestDispense.fromJson(Map<String, dynamic> json) =>
      _$MedicationRequestDispenseFromJson(json);
}

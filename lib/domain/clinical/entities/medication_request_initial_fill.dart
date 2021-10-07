// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';

part 'medication_request_initial_fill.freezed.dart';
part 'medication_request_initial_fill.g.dart';

///Indicates the quantity or duration for the first dispense of the medication.
///first fill details
@freezed
class MedicationRequestInitialFill with _$MedicationRequestInitialFill {
  factory MedicationRequestInitialFill({
    @JsonKey(name: 'ID') String? id,

    //first medication fill quantity
    @JsonKey(name: 'Quantity') Quantity? quantity,

    //first medication fill duration
    @JsonKey(name: 'Duration') Duration? duration,
  }) = _MedicationRequestInitialFill;

  factory MedicationRequestInitialFill.fromJson(Map<String, dynamic> json) =>
      _$MedicationRequestInitialFillFromJson(json);
}

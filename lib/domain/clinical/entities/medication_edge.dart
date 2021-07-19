import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';

part 'medication_edge.freezed.dart';
part 'medication_edge.g.dart';

//Relay connection for medication
@freezed
class MedicationRelayConnection with _$MedicationRelayConnection {
  factory MedicationRelayConnection({
    @JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
  }) = _MedicationRelayConnection;

  factory MedicationRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$MedicationRelayConnectionFromJson(json);
}

//Relay edge for medication
@freezed
class MedicationEdgeRelay with _$MedicationEdgeRelay {
  factory MedicationEdgeRelay({
    @JsonKey(name: 'cursor') String? cursor,
    @JsonKey(name: 'node') Medication? node,
  }) = _MedicationEdgeRelay;

  factory MedicationEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$MedicationEdgeRelayFromJson(json);
}

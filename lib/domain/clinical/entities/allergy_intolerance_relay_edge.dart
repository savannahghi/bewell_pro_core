import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';

part 'allergy_intolerance_relay_edge.freezed.dart';
part 'allergy_intolerance_relay_edge.g.dart';

/// AllergyIntoleranceRelayEdge is a Relay edge for AllergyIntolerance
@freezed
class AllergyIntoleranceRelayEdge with _$AllergyIntoleranceRelayEdge {
  factory AllergyIntoleranceRelayEdge({
    @JsonKey(name: 'cursor') String? cursor,
    @JsonKey(name: 'node') AllergyIntolerance? node,
  }) = _AllergyIntoleranceRelayEdge;

  factory AllergyIntoleranceRelayEdge.fromJson(Map<String, dynamic> json) =>
      _$AllergyIntoleranceRelayEdgeFromJson(json);
}

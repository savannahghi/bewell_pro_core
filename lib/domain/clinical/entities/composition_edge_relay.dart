// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';

part 'composition_edge_relay.freezed.dart';
part 'composition_edge_relay.g.dart';

@freezed
class CompositionEdgeRelay with _$CompositionEdgeRelay {
  factory CompositionEdgeRelay({
    @JsonKey(name: 'cursor') String? cursor,
    @JsonKey(name: 'node') Composition? node,
  }) = _CompositionEdgeRelay;

  factory CompositionEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$CompositionEdgeRelayFromJson(json);
}

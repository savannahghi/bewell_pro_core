// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';

part 'allergy_intolerance_relay_connection.freezed.dart';
part 'allergy_intolerance_relay_connection.g.dart';

/// Is a Relay connection for AllergyIntolerance
@freezed
class AllergyIntoleranceRelayConnection
    with _$AllergyIntoleranceRelayConnection {
  factory AllergyIntoleranceRelayConnection({
    @JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
  }) = _AllergyIntoleranceRelayConnection;

  factory AllergyIntoleranceRelayConnection.fromJson(
          Map<String, dynamic> json) =>
      _$AllergyIntoleranceRelayConnectionFromJson(json);
}

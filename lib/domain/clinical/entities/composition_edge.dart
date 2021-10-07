// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/composition_edge_relay.dart';
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';

part 'composition_edge.freezed.dart';
part 'composition_edge.g.dart';

@freezed
class CompositionRelayConnection with _$CompositionRelayConnection {
  factory CompositionRelayConnection(
          {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
          @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges}) =
      _CompositionRelayConnection;

  factory CompositionRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$CompositionRelayConnectionFromJson(json);
}

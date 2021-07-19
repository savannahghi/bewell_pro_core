import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'narrative.freezed.dart';
part 'narrative.g.dart';

/// A human-readable summary of the resource conveying the essential clinical
///  and business information for the resource.
@freezed
class Narrative with _$Narrative {
  factory Narrative({
    @JsonKey(name: 'ID') String? id,

    /// The status of the narrative - whether it's entirely generated
    ///  (from just the defined data or the extensions too),
    ///  or whether a human authored it and it may contain additional data.
    @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
        NarrativeStatusEnum? status,

    /// The actual narrative content, a stripped down version of XHTML.
    @JsonKey(name: 'Div') String? div,
  }) = _Narrative;

  factory Narrative.fromJson(Map<String, dynamic> json) =>
      _$NarrativeFromJson(json);
}

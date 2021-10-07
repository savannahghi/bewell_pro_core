// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';

part 'range.freezed.dart';
part 'range.g.dart';

/// A set of ordered quantities defined by a low and high limit.
@freezed
class Range with _$Range {
  factory Range({
    @JsonKey(name: 'ID') String? id,

    /// The low limit. The boundary is inclusive.
    @JsonKey(name: 'Low') Quantity? low,

    /// The high limit. The boundary is inclusive.
    @JsonKey(name: 'High') Quantity? high,
  }) = _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

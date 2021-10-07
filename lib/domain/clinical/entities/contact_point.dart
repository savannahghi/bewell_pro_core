// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_use_enum.dart';

part 'contact_point.freezed.dart';
part 'contact_point.g.dart';

/// Details for all kinds of technology mediated contact points for a person or
///  organization, including telephone, email, etc.
@freezed
class ContactPoint with _$ContactPoint {
  factory ContactPoint({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
        ContactPointSystemEnum? system,

    /// The actual contact point details, in a form that is meaningful to the
    ///  designated communication system (i.e. phone number or email address).
    @JsonKey(name: 'Value') String? value,

    /// Identifies the purpose for the contact point.
    @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
        ContactPointUseEnum? use,

    /// Specifies a preferred order in which to use a set of contacts.
    ///  ContactPoints with lower rank values are more preferred than those with higher rank values.
    @JsonKey(name: 'Rank') int? rank,

    /// Time period when the contact point was/is in use
    @JsonKey(name: 'Period') Period? period,
  }) = _ContactPoint;

  factory ContactPoint.fromJson(Map<String, dynamic> json) =>
      _$ContactPointFromJson(json);
}

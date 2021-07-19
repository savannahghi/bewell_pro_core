import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/human_name_use_enum.dart';

part 'human_name.freezed.dart';
part 'human_name.g.dart';

/// A human's name with the ability to identify parts and usage.
@freezed
class HumanName with _$HumanName {
  factory HumanName({
    @JsonKey(name: 'ID') String? id,

    /// Identifies the purpose for this name
    @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
        HumanNameUseEnum? use,

    /// Specifies the entire name as it should be displayed e.g. on an application UI.
    /// This may be provided instead of or as well as the specific parts
    @JsonKey(name: 'Text') String? text,

    /// The part of a name that links to the genealogy.
    /// In some cultures (e.g. Eritrea) the family name of a son is the
    /// first name of his father.
    @JsonKey(name: 'Family') String? family,

    /// Given name.
    @JsonKey(name: 'Given') List<String?>? given,

    /// Part of the name that is acquired as a title due to academic,
    ///  legal, employment or nobility status, etc. and that appears
    ///  at the start of the name.
    @JsonKey(name: 'Prefix') List<String?>? prefix,

    /// Part of the name that is acquired as a title due to academic,
    ///  legal, employment or nobility status, etc. and that appears
    ///  at the end of the name.
    @JsonKey(name: 'Suffix') List<String?>? suffix,

    /// Indicates the period of time when this name was valid for the named person
    @JsonKey(name: 'Period') Period? period,
  }) = _HumanName;

  factory HumanName.fromJson(Map<String, dynamic> json) =>
      _$HumanNameFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coding.freezed.dart';
part 'coding.g.dart';

/// A reference to a code defined by a terminology system.
@freezed
class Coding with _$Coding {
  factory Coding({
    @JsonKey(name: 'ID') String? id,

    /// The identification of the code system that defines the meaning of the
    ///  symbol in the code.
    @JsonKey(name: 'System') String? system,

    /// The version of the code system which was used when choosing this code.
    ///
    /// Note that a well-maintained code system does not need the version reported,
    ///  because the meaning of codes is consistent across versions. However
    ///  this cannot consistently be assured, and when the meaning is not
    ///  guaranteed to be consistent, the version SHOULD be exchanged
    @JsonKey(name: 'Version') String? version,

    /// A symbol in syntax defined by the system. The symbol may be a
    ///  predefined code or an expression in a syntax defined by the coding
    ///  system (e.g. post-coordination).
    @JsonKey(name: 'Code') String? code,

    /// A representation of the meaning of the code in the system, following
    ///  the rules of the system.
    @JsonKey(name: 'Display') String? display,

    /// Indicates that this coding was chosen by a user directly
    ///
    ///  - e.g. off a pick list of available items (codes or displays).
    @JsonKey(name: 'UserSelected') bool? userSelected,
  }) = _Coding;

  factory Coding.fromJson(Map<String, dynamic> json) => _$CodingFromJson(json);
}

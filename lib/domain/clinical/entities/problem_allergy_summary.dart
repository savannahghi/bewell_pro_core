import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_allergy_summary.freezed.dart';
part 'problem_allergy_summary.g.dart';

/// A clinical condition, problem, diagnosis, or other event, situation, issue,
///  or clinical concept that has risen to a level of concern.
@freezed
class ProblemAllergySummary with _$ProblemAllergySummary {
  factory ProblemAllergySummary({
    @JsonKey(name: 'problemSummary') List<String?>? problemSummary,
    @JsonKey(name: 'allergySummary') List<String?>? allergySummary,
  }) = _ProblemAllergySummary;
  factory ProblemAllergySummary.fromJson(Map<String, dynamic> json) =>
      _$ProblemAllergySummaryFromJson(json);
}

class GenerateProblemAllergySummaryData {
  final String problemOrAllergyString;

  // how many more problems or allergies exist besides the first 2
  final String remainingItemsString;

  GenerateProblemAllergySummaryData({
    required this.problemOrAllergyString,
    required this.remainingItemsString,
  });
}

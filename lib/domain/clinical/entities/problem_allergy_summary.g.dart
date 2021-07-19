// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_allergy_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProblemAllergySummary _$_$_ProblemAllergySummaryFromJson(
    Map<String, dynamic> json) {
  return _$_ProblemAllergySummary(
    problemSummary: (json['problemSummary'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    allergySummary: (json['allergySummary'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
  );
}

Map<String, dynamic> _$_$_ProblemAllergySummaryToJson(
        _$_ProblemAllergySummary instance) =>
    <String, dynamic>{
      'problemSummary': instance.problemSummary,
      'allergySummary': instance.allergySummary,
    };

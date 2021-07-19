import 'package:freezed_annotation/freezed_annotation.dart';

part 'period.freezed.dart';
part 'period.g.dart';

/// A time period defined by a start and end date and optionally time.
@freezed
class Period with _$Period {
  factory Period({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Start') String? start,
    @JsonKey(name: 'End') String? end,
  }) = _Period;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';

part 'annotation.freezed.dart';
part 'annotation.g.dart';

/// A text note which also contains information about who made the statement and when
@freezed
class Annotation with _$Annotation {
  factory Annotation({
    @JsonKey(name: 'ID') String? id,

    /// The individual responsible for making the annotation.
    @JsonKey(name: 'AuthorReference') Reference? authorReference,
    @JsonKey(name: 'AuthorString') String? authorString,
    @JsonKey(name: 'Time') DateTime? time,

    /// The text of the annotation in markdown format.
    @JsonKey(name: 'Text') String? text,
  }) = _Annotation;
  factory Annotation.fromJson(Map<String, dynamic> json) =>
      _$AnnotationFromJson(json);
}

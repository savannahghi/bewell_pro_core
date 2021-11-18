// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

/// For referring to data content defined in other formats.
@freezed
class Attachment with _$Attachment {
  factory Attachment({
    @JsonKey(name: 'ID') String? id,

    /// Identifies the type of the data in the attachment and allows a method
    ///  to be chosen to interpret or render the data. Includes mime type
    ///  parameters such as charset where appropriate.
    @JsonKey(name: 'ContentType') String? contentType,

    /// The human language of the content.
    ///  The value can be any valid value according to BCP 47.
    @JsonKey(name: 'Language') String? language,

    /// The actual data of the attachment - a sequence of bytes, base64 encoded.
    @JsonKey(name: 'Data') String? data,

    /// A location where the data can be accessed.
    @JsonKey(name: 'Url') String? url,

    /// The number of bytes of data that make up this attachment
    ///  (before base64 encoding, if that is done).
    @JsonKey(name: 'Size') int? size,

    /// The calculated hash of the data using SHA-1.
    ///  Represented using base64.
    @JsonKey(name: 'Hash') String? hash,

    /// A label or set of text to display in place of the data.
    @JsonKey(name: 'Title') String? title,

    /// The date that the attachment was first created.
    @JsonKey(name: 'Creation') String? creation,
  }) = _Attachment;
  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

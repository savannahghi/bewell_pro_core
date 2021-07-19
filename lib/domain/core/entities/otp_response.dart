import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_response.freezed.dart';
part 'otp_response.g.dart';

@freezed
class OTPResponse with _$OTPResponse {
  factory OTPResponse({
    @JsonKey(name: 'otp') String? otp,
  }) = _OTPResponse;

  factory OTPResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseFromJson(json);
}

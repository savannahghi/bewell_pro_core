import 'package:freezed_annotation/freezed_annotation.dart';

part 'OTP_episode_creation_input.freezed.dart';
part 'OTP_episode_creation_input.g.dart';

/// Input data to the mutation for starting an episode of care
@freezed
class OTPEpisodeCreationInput with _$OTPEpisodeCreationInput {
  factory OTPEpisodeCreationInput({
    required String? patientID,
    required String? providerCode,
    required String? msisdn,
    required String? otp,
    required bool fullAccess,
  }) = _OTPEpisodeCreationInput;

  factory OTPEpisodeCreationInput.fromJson(Map<String, dynamic> json) =>
      _$OTPEpisodeCreationInputFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'break_glass_episode_creation_input.freezed.dart';
part 'break_glass_episode_creation_input.g.dart';

@freezed
class BreakGlassEpisodeCreationInput with _$BreakGlassEpisodeCreationInput {
  factory BreakGlassEpisodeCreationInput({
    required String? patientID,
    required String? providerCode,
    required String? practitionerUID,
    required String? providerPhone,
    required String? otp,
    required bool? fullAccess,
    required String? patientPhone,
  }) = _BreakGlassEpisodeCreationInput;

  factory BreakGlassEpisodeCreationInput.fromJson(Map<String, dynamic> json) =>
      _$BreakGlassEpisodeCreationInputFromJson(json);
}

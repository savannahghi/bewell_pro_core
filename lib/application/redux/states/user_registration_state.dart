import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_state.freezed.dart';
part 'user_registration_state.g.dart';

@freezed
class UserRegistrationState with _$UserRegistrationState {
  factory UserRegistrationState({
    required String userType,
    required String userRegistrationMutation,
  }) = _UserRegistrationState;

  factory UserRegistrationState.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationStateFromJson(json);

  factory UserRegistrationState.initial() => UserRegistrationState(
      userType: 'Patient', userRegistrationMutation: registerPatientQuery);
}

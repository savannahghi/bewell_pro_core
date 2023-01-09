// Package imports:
import 'package:sghi_core/domain_objects/entities/auth_credential_response.dart';
import 'package:sghi_core/domain_objects/entities/bio_data.dart';
import 'package:sghi_core/domain_objects/entities/communication_settings.dart';
import 'package:sghi_core/domain_objects/entities/customer.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/email_address.dart';
import 'package:sghi_core/domain_objects/value_objects/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/domain_objects/value_objects/name.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    // sourced from the response fo login
    UserProfile? userProfile,
    Customer? customerProfile,
    CommunicationSettings? communicationSettings,
    AuthCredentialResponse? auth,

    // generate from the app
    bool? isSignedIn,
    String? signedInTime,
    String? inActivitySetInTime,
    String? tokenExpiryTime,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        isSignedIn: false,
        inActivitySetInTime: UNKNOWN,
        signedInTime: UNKNOWN,
        tokenExpiryTime: UNKNOWN,
        userProfile: UserProfile(
          id: UNKNOWN,
          username: Name.withValue(UNKNOWN),
          termsAccepted: false,
          suspended: false,
          photoUploadID: UNKNOWN,
          userBioData: BioData(
            firstName: Name.withValue(UNKNOWN),
            lastName: Name.withValue(UNKNOWN),
            dateOfBirth: UNKNOWN,
            gender: Gender.unknown,
          ),
          primaryEmailAddress: EmailAddress.withValue(UNKNOWNEMAIL),
        ),
        auth: AuthCredentialResponse(
          customToken: UNKNOWN,
          idToken: UNKNOWN,
          expiresIn: UNKNOWN,
          refreshToken: UNKNOWN,
          uid: UNKNOWN,
          isAnonymous: true,
          canExperiment: false,
          isAdmin: false,
        ),
        communicationSettings: CommunicationSettings(
          profileID: UNKNOWN,
          allowEmail: false,
          allowPush: false,
          allowText: false,
          allowWhatsApp: false,
        ),
      );
}

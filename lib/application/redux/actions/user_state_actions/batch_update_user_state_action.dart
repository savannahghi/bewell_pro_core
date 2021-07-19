import 'package:async_redux/async_redux.dart';

import 'package:bewell_pro_core/application/redux/states/app_state.dart';

import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

/// [BatchUpdateUserStateAction] is used to update the apps internal state. If a state changes requires
/// for it to be replicated in the backend, a use-case specific action should be created
///
/// Its used to update the following: `userProfile`,  `communicationSettings`, `auth`,
/// `isSignedIn`, `inActivitySetInTime`, `signedInTime`, `tokenExpiryTime`
class BatchUpdateUserStateAction extends ReduxAction<AppState> {
  BatchUpdateUserStateAction({
    this.userProfile,
    this.communicationSettings,
    this.auth,
    this.isSignedIn,
    this.inActivitySetInTime,
    this.signedInTime,
    this.tokenExpiryTime,
  });

  final AuthCredentialResponse? auth;
  final CommunicationSettings? communicationSettings;
  final String? inActivitySetInTime;
  final bool? isSignedIn;
  final String? signedInTime;
  final String? tokenExpiryTime;
  final UserProfile? userProfile;

  @override
  AppState reduce() {
    final AppState newUserState = state.copyWith.userState!.call(
      userProfile: state.userState!.userProfile!.copyWith(
        id: this.userProfile?.id ?? state.userState?.userProfile?.id,
        username: this.userProfile?.username ??
            state.userState!.userProfile!.username,
        primaryPhoneNumber: this.userProfile?.primaryPhoneNumber ??
            state.userState!.userProfile!.primaryPhoneNumber,
        primaryEmailAddress: this.userProfile?.primaryEmailAddress ??
            state.userState!.userProfile!.primaryEmailAddress,
        secondaryPhoneNumbers: deconstructSecondaryPhoneNumber(state),
        secondaryEmailAddresses: deconstructSecondaryEmailAddresses(state),
        termsAccepted: this.userProfile?.termsAccepted ??
            state.userState!.userProfile!.termsAccepted,
        suspended: this.userProfile?.suspended ??
            state.userState!.userProfile!.suspended,
        photoUploadID: this.userProfile?.photoUploadID ??
            state.userState!.userProfile!.photoUploadID,
        userBioData: this.userProfile?.userBioData ??
            state.userState!.userProfile!.userBioData,
      ),
      communicationSettings:
          state.userState!.communicationSettings!.copyWith.call(
        profileID: this.communicationSettings?.profileID ??
            state.userState!.communicationSettings!.profileID,
        allowEmail: this.communicationSettings?.allowEmail ??
            state.userState!.communicationSettings!.allowEmail,
        allowPush: this.communicationSettings?.allowPush ??
            state.userState!.communicationSettings!.allowPush,
        allowText: this.communicationSettings?.allowText ??
            state.userState!.communicationSettings!.allowText,
        allowWhatsApp: this.communicationSettings?.allowWhatsApp ??
            state.userState!.communicationSettings!.allowWhatsApp,
      ),
      isSignedIn: this.isSignedIn ?? state.userState!.isSignedIn,
      tokenExpiryTime: this.tokenExpiryTime ?? state.userState!.tokenExpiryTime,
      inActivitySetInTime:
          this.inActivitySetInTime ?? state.userState!.inActivitySetInTime,
      signedInTime: this.signedInTime ?? state.userState!.signedInTime,
      auth: this.auth != null
          ? AuthCredentialResponse(
              canExperiment: this.auth!.canExperiment ??
                  state.userState!.auth!.canExperiment,
              idToken: this.auth!.idToken ?? state.userState!.auth!.idToken,
              customToken:
                  this.auth!.customToken ?? state.userState!.auth!.customToken,
              expiresIn:
                  this.auth!.expiresIn ?? state.userState!.auth!.expiresIn,
              refreshToken: this.auth!.refreshToken ??
                  state.userState!.auth!.refreshToken,
              isAdmin: this.auth!.isAdmin ?? state.userState!.auth!.isAdmin,
              isChangePin:
                  this.auth!.isChangePin ?? state.userState!.auth!.isChangePin,
              isAnonymous:
                  this.auth!.isAnonymous ?? state.userState!.auth!.isAnonymous,
              uid: this.auth!.uid ?? state.userState!.auth!.uid,
            )
          : state.userState!.auth,
    );

    return newUserState;
  }

  /// Returns a list of secondary phone numbers
  List<PhoneNumber>? deconstructSecondaryPhoneNumber(AppState state) {
    if (this.userProfile?.secondaryPhoneNumbers != null) {
      /// overwrite secondary phones to avoid complex pattern matching
      return this.userProfile?.secondaryPhoneNumbers;
    } else {
      if (state.userState!.userProfile!.secondaryPhoneNumbers != null) {
        return state.userState!.userProfile!.secondaryPhoneNumbers;
      }
    }
    return null;
  }

  /// Returns a list of secondary email addresses
  List<EmailAddress>? deconstructSecondaryEmailAddresses(AppState state) {
    if (this.userProfile?.secondaryEmailAddresses != null) {
      /// overwrite secondary emails to avoid complex pattern matching
      return this.userProfile?.secondaryEmailAddresses;
    } else {
      if (state.userState!.userProfile!.secondaryEmailAddresses != null) {
        return state.userState!.userProfile!.secondaryEmailAddresses;
      }
    }
    return null;
  }
}

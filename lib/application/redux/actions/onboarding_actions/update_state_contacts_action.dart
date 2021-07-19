import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:user_profile/contact_utils.dart';

/// Used in [Profile] to update state when contact details are updated
class UpdateStateContactsAction extends ReduxAction<AppState> {
  UpdateStateContactsAction({required this.type, required this.value});

  final StateContactType type;
  final String value;

  @override
  Future<AppState?> reduce() async {
    final UserProfile? profile = state.userState!.userProfile;

    if (value.isEmpty) return null;

    /// The arrangement of these test cases should match the order in the \
    /// [StateContactType] enum
    switch (type) {
      case StateContactType.primaryEmail:
        dispatch(
          BatchUpdateUserStateAction(
            userProfile: UserProfile(
              primaryEmailAddress: EmailAddress.withValue(value),
            ),
          ),
        );
        break;

      case StateContactType.primaryPhone:
        dispatch(
          BatchUpdateUserStateAction(
            userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(value),
            ),
          ),
        );
        break;

      case StateContactType.secondaryEmails:
        final List<EmailAddress> emails = <EmailAddress>[
          EmailAddress.withValue(value)
        ];

        final List<EmailAddress> secEmails = profile!.secondaryEmailAddresses!
            .where((EmailAddress? el) => el!.isValid())
            .toList();

        emails.addAll(secEmails);

        dispatch(
          BatchUpdateUserStateAction(
            userProfile: UserProfile(secondaryEmailAddresses: emails),
          ),
        );
        break;

      case StateContactType.secondaryPhones:
        final List<PhoneNumber> phones = <PhoneNumber>[
          PhoneNumber.withValue(value)
        ];

        final List<PhoneNumber> secPhones = profile!.secondaryPhoneNumbers!
            .where((PhoneNumber? el) => el!.isValid())
            .toList();

        phones.addAll(secPhones);

        dispatch(
          BatchUpdateUserStateAction(
            userProfile: UserProfile(secondaryPhoneNumbers: phones),
          ),
        );
        break;

      case StateContactType.setPrimaryEmail:
        final List<EmailAddress>? emails = profile!.secondaryEmailAddresses;
        final EmailAddress emailAddressValue = EmailAddress.withValue(value);

        emails!.remove(emailAddressValue);
        emails.add(
            EmailAddress.withValue(profile.primaryEmailAddress!.getValue()));

        dispatch(
          BatchUpdateUserStateAction(
            userProfile: UserProfile(
                primaryEmailAddress: emailAddressValue,
                secondaryEmailAddresses: emails
                    .where((EmailAddress? e) => e != emailAddressValue)
                    .toList()),
          ),
        );
        break;

      case StateContactType.setPrimaryPhone:
        final List<PhoneNumber>? phones = profile!.secondaryPhoneNumbers;
        phones?.add(profile.primaryPhoneNumber!);
        dispatch(
          BatchUpdateUserStateAction(
            userProfile: UserProfile(
                primaryPhoneNumber: PhoneNumber.withValue(value),
                secondaryPhoneNumbers: phones!
                    .where((PhoneNumber? e) => e!.getValue() != value)
                    .toList()),
          ),
        );
        break;

      case StateContactType.retireSecondaryEmail:
        final List<EmailAddress>? emails = profile?.secondaryEmailAddresses;

        dispatch(
          BatchUpdateUserStateAction(
              userProfile: UserProfile(secondaryEmailAddresses: emails)),
        );
        break;

      case StateContactType.retireSecondaryPhone:
        final List<PhoneNumber>? phones = profile!.secondaryPhoneNumbers;

        dispatch(
          BatchUpdateUserStateAction(
              userProfile: UserProfile(secondaryPhoneNumbers: phones)),
        );
        break;
    }
  }
}

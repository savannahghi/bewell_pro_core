// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class ContactViewModel extends Vm {
  final EmailAddress primaryEmail;
  final PhoneNumber primaryPhone;
  final List<EmailAddress> secondaryEmails;
  final List<PhoneNumber> secondaryPhones;
  final Wait wait;

  ContactViewModel({
    required this.primaryEmail,
    required this.primaryPhone,
    required this.secondaryEmails,
    required this.secondaryPhones,
    required this.wait,
  }) : super(equals: <Object>[
          primaryEmail,
          primaryPhone,
          secondaryEmails,
          secondaryPhones,
        ]);

  static ContactViewModel fromStore(Store<CoreState> store) {
    final UserProfile profile = store.state.userState!.userProfile!;

    final EmailAddress primaryEmail =
        profile.primaryEmailAddress ?? EmailAddress.withValue(UNKNOWNEMAIL);

    final List<EmailAddress> secondaryEmailAddresses =
        profile.secondaryEmailAddresses ?? <EmailAddress>[];

    final List<PhoneNumber> secondaryPhoneNumbers =
        profile.secondaryPhoneNumbers ?? <PhoneNumber>[];

    return ContactViewModel(
      primaryPhone: profile.primaryPhoneNumber!,
      primaryEmail: primaryEmail,
      secondaryEmails: secondaryEmailAddresses,
      secondaryPhones: secondaryPhoneNumbers,
      wait: store.state.wait!,
    );
  }
}

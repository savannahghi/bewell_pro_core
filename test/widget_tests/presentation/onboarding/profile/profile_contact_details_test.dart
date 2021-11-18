// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/profile_banner.dart';
import 'package:user_profile/add_contact.dart';
import 'package:user_profile/contact_items_card.dart';
import 'package:user_profile/contacts.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_contact_details.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('ProfileContactDetails', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    setUpAll(() {
      store.dispatch(BatchUpdateUserStateAction(
        userProfile: UserProfile(
          id: UNKNOWN,
          username: Name.withValue('Bewell-test'),
          termsAccepted: true,
          suspended: false,
          photoUploadID: UNKNOWN,
          primaryPhoneNumber: PhoneNumber.withValue('+254798000000'),
          primaryEmailAddress: EmailAddress.withValue('test@example.com'),
          userBioData: BioData(
            firstName: Name.withValue(''),
            lastName: Name.withValue(''),
            dateOfBirth: UNKNOWN,
            gender: Gender.male,
          ),
        ),
        communicationSettings: CommunicationSettings(
            profileID: 'UNKNOWN',
            allowWhatsApp: false,
            allowPush: false,
            allowEmail: false),
      ));
    });

    testWidgets('should render correctly with correct contact details',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            store: store, tester: tester, widget: ProfileContactDetails());
      });

      // verify renders correctly
      expect(find.byType(SILProfileBanner), findsOneWidget);
      expect(find.byType(BuildContactProvider), findsOneWidget);
      expect(find.byType(ContactDetails), findsOneWidget);
      expect(find.byType(ContactItemsCard), findsWidgets);

      // verify displays the correct details
      expect(find.text('+254798000000'), findsWidgets);
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('Primary email address'), findsWidgets);
    });

    testWidgets('should save Contact', (WidgetTester tester) async {
      store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryEmailAddress: EmailAddress.withValue(UNKNOWNEMAIL),
      )));

      await mockNetworkImages(() async {
        await buildTestWidget(
            store: store, tester: tester, widget: ProfileContactDetails());
      });

      expect(find.byType(BuildContactProvider), findsOneWidget);
      expect(find.byType(ContactDetails), findsOneWidget);

      await tester.tap(find.byKey(const Key('Primary email address')));
      await tester.pumpAndSettle();

      expect(find.byType(AddContactWrapper), findsOneWidget);
    });
  });
}

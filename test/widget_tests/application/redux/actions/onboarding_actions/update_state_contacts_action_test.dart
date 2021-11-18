// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_profile/contact_utils.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('UpdateUserPinAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets(
        'should update core state when a primary email address is added',
        (WidgetTester tester) async {
      expect(storeTester.state.userState!.userProfile!.primaryEmailAddress,
          EmailAddress.withValue('unknown@bewell.co.ke'));

      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryEmailAddress: testEmailAddress,
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.primaryEmail,
        value: 'demo@gmail.com',
      );

      // Verify state was updated
      expect(storeTester.state.userState!.userProfile!.primaryEmailAddress,
          testEmailAddress);
    });

    testWidgets('should update core state when a primary phone number is added',
        (WidgetTester tester) async {
      expect(
          storeTester.state.userState!.userProfile!.primaryPhoneNumber, null);

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.primaryPhone,
        value: '+254721123456',
      );

      await tester.pump();

      // Verify state was updated
      expect(storeTester.state.userState!.userProfile!.primaryPhoneNumber,
          testPhoneNumber);
    });

    testWidgets(
        'should update core state when secondary email addresses is added',
        (WidgetTester tester) async {
      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        secondaryEmailAddresses: <EmailAddress>[
          EmailAddress.withValue('test@bewell.co.ke'),
        ],
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.secondaryEmails,
        value: 'test1@bewell.co.ke',
      );

      await tester.pump();

      // Verify state was updated
      expect(
        storeTester.state.userState!.userProfile!.secondaryEmailAddresses,
        <EmailAddress>[
          EmailAddress.withValue('test1@bewell.co.ke'),
          EmailAddress.withValue('test@bewell.co.ke'),
        ],
      );
    });

    testWidgets(
        'should update core state when secondary phone numbers in state',
        (WidgetTester tester) async {
      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        secondaryPhoneNumbers: <PhoneNumber>[
          PhoneNumber.withValue('+2547123455678')
        ],
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.secondaryPhones,
        value: '+254721123456',
      );

      await tester.pump();

      // Verify state was updated
      expect(
        storeTester.state.userState!.userProfile!.secondaryPhoneNumbers,
        <PhoneNumber>[
          PhoneNumber.withValue('+254721123456'),
          PhoneNumber.withValue('+2547123455678')
        ],
      );
    });

    testWidgets('should update core state when a primary email address is set',
        (WidgetTester tester) async {
      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryEmailAddress: testEmailAddress,
        secondaryEmailAddresses: <EmailAddress>[testEmailAddress],
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.setPrimaryEmail,
        value: 'demo@gmail.com',
      );

      // Verify state was updated
      expect(storeTester.state.userState!.userProfile!.primaryEmailAddress,
          testEmailAddress);
    });

    testWidgets('should update core state when a primary phone number is set',
        (WidgetTester tester) async {
      expect(
          storeTester.state.userState!.userProfile!.primaryPhoneNumber, null);

      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryPhoneNumber: testPhoneNumber,
        secondaryPhoneNumbers: <PhoneNumber>[
          PhoneNumber.withValue('+2547123455678')
        ],
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.setPrimaryPhone,
        value: '+254721123456',
      );

      // Verify state was updated
      expect(storeTester.state.userState!.userProfile!.primaryPhoneNumber,
          testPhoneNumber);
    });

    testWidgets(
        'should update core state when a secondary email address is retired',
        (WidgetTester tester) async {
      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        secondaryEmailAddresses: <EmailAddress>[testEmailAddress],
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.retireSecondaryEmail,
        value: 'info@healthcloud.co.ke',
      );

      // Verify state was updated
      expect(storeTester.state.userState!.userProfile!.secondaryEmailAddresses,
          <EmailAddress>[testEmailAddress]);
    });

    testWidgets(
        'should update core state when a secondary phone number is retired',
        (WidgetTester tester) async {
      await storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        secondaryPhoneNumbers: <PhoneNumber>[
          PhoneNumber.withValue('+2547123455678')
        ],
      )));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      updateStateContacts(
        context: context,
        type: StateContactType.retireSecondaryPhone,
        value: '+2547123455678',
      );

      // Verify state was updated
      expect(storeTester.state.userState!.userProfile!.secondaryPhoneNumbers,
          <PhoneNumber>[PhoneNumber.withValue('+2547123455678')]);
    });
  });
}

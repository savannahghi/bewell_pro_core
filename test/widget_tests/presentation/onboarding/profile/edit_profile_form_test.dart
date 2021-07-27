import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/edit_profile_form.dart';
import 'package:http/http.dart';
import 'package:domain_objects/value_objects.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('EditProfileForm', () {
    testWidgets('works correctly', (WidgetTester tester) async {
      final UserState userState = UserState.initial().copyWith(
        userProfile: UserProfile(
          id: UNKNOWN,
          username: Name.withValue('Bewell-test'),
          termsAccepted: true,
          suspended: false,
          photoUploadID: UNKNOWN,
          primaryPhoneNumber: PhoneNumber.withValue('+254798000000'),
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
          allowEmail: false,
        ),
      );

      final CoreState state =
          CoreState.initial().copyWith(userState: userState);
      final Store<CoreState> store = Store<CoreState>(initialState: state);

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EditProfileForm(),
      );

      // verify UI renders correctly
      expect(find.text(updateProfile), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.firstName), findsOneWidget);
      expect(find.text(updateLastName), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.lastName), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.editProfileDetailsButton), findsOneWidget);

      // enter first name details
      await tester.enterText(find.byKey(AppWidgetKeys.firstName), 'Test');
      await tester.pump();

      // enter last name details
      await tester.enterText(find.byKey(AppWidgetKeys.lastName), 'Name');
      await tester.pump();

      // tap save button
      await tester.tap(find.byKey(AppWidgetKeys.editProfileDetailsButton));
      await tester.pump();

      // verify save was successful
      const String expectedFirstName = 'Test';

      final String actualFirstName = store
          .state.userState!.userProfile!.userBioData!.firstName!
          .getValue();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(updateSuccessful), findsOneWidget);
      expect(actualFirstName, expectedFirstName);
      await tester.pump(const Duration(seconds: 6));
    });
    testWidgets(
        'fails to save details and shows snackbar if there is an error in response',
        (WidgetTester tester) async {
      Store<CoreState> store;
      final CoreState state = CoreState(
        wait: Wait(),
        userState: UserState(
          userProfile: UserProfile(
            id: UNKNOWN,
            username: Name.withValue('Bewell-test'),
            termsAccepted: true,
            suspended: false,
            photoUploadID: UNKNOWN,
            primaryPhoneNumber: PhoneNumber.withValue('+254798000000'),
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
            allowEmail: false,
          ),
        ),
      );

      store = Store<CoreState>(initialState: state);
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'error': 'error'}), 400),
      );

      await buildTestWidget(
          store: store,
          tester: tester,
          graphQlClient: mockGraphQlClient,
          widget: EditProfileForm());

      // verify UI renders correctly
      expect(find.text(updateProfile), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.firstName), findsOneWidget);
      expect(find.text(updateLastName), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.lastName), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.editProfileDetailsButton), findsOneWidget);

      // enter first name details
      await tester.enterText(find.byKey(AppWidgetKeys.firstName), 'Test');
      await tester.pump();

      // enter last name details
      await tester.enterText(find.byKey(AppWidgetKeys.lastName), 'Name');
      await tester.pump();

      // tap save button
      await tester.tap(find.byKey(AppWidgetKeys.editProfileDetailsButton));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('fails to save details if data is null',
        (WidgetTester tester) async {
      Store<CoreState> store;
      final CoreState state = CoreState(
        wait: Wait(),
        userState: UserState(
          userProfile: UserProfile(
            id: UNKNOWN,
            username: Name.withValue('Bewell-test'),
            termsAccepted: true,
            suspended: false,
            photoUploadID: UNKNOWN,
            primaryPhoneNumber: PhoneNumber.withValue('+254798000000'),
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
            allowEmail: false,
          ),
        ),
      );

      store = Store<CoreState>(initialState: state);
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'data': null}), 200),
      );

      await buildTestWidget(
          store: store,
          tester: tester,
          graphQlClient: mockGraphQlClient,
          widget: EditProfileForm());

      // verify UI renders correctly
      expect(find.text(updateProfile), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.firstName), findsOneWidget);
      expect(find.text(updateLastName), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.lastName), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.editProfileDetailsButton), findsOneWidget);

      // enter first name details
      await tester.enterText(find.byKey(AppWidgetKeys.firstName), 'Test');
      await tester.pump();

      // enter last name details
      await tester.enterText(find.byKey(AppWidgetKeys.lastName), 'Name');
      await tester.pump();

      // tap save button
      await tester.tap(find.byKey(AppWidgetKeys.editProfileDetailsButton));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should not update with invalid inputs',
        (WidgetTester tester) async {
      Store<CoreState> store;
      final CoreState state = CoreState(
        wait: Wait(),
        userState: UserState(
            userProfile: UserProfile(
              id: UNKNOWN,
              username: Name.withValue('Bewell-test'),
              termsAccepted: true,
              suspended: false,
              photoUploadID: UNKNOWN,
              primaryPhoneNumber: PhoneNumber.withValue('+254798000000'),
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
                allowEmail: false)),
      );

      store = Store<CoreState>(initialState: state);
      await buildTestWidget(
          store: store, tester: tester, widget: EditProfileForm());

      // verify UI renders correctly
      expect(find.text(updateProfile), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.firstName), findsOneWidget);
      expect(find.text(updateLastName), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.lastName), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.editProfileDetailsButton), findsOneWidget);

      // enter first name details
      await tester.enterText(find.byKey(AppWidgetKeys.firstName), '');
      await tester.pump();

      // enter last name details
      await tester.enterText(find.byKey(AppWidgetKeys.lastName), '');
      await tester.pump();

      // tap save button
      await tester.tap(find.byKey(AppWidgetKeys.editProfileDetailsButton));
      await tester.pump();

      // verify save was successful
      const String expectedFirstName = '';

      final String actualFirstName = store
          .state.userState!.userProfile!.userBioData!.firstName!
          .getValue();
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text(updateSuccessful), findsNothing);
      expect(actualFirstName, expectedFirstName);
    });
  });
}

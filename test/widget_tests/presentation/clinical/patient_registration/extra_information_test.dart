// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:sghi_core/shared_themes/constants.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/extra_information.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setupFirebaseAuthMocks();

  group('ExtraInformation', () {
    const String testEmail = 'info@healthcloud.co.ke';
    const String invalidEmail = 'info@healthcloud.';

    late TabController controller;
    late ExtraInformationObject extraInformation;

    setUp(() async {
      await Firebase.initializeApp();

      controller = TabController(length: 6, vsync: const TestVSync());
      extraInformation = ExtraInformationObject();
    });

    testWidgets(
        'should confirm that the entered email address is valid before '
        'saving it', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const ExtraInformation(),
        ),
      );

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.previousBtnKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.finishBtnKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.maritalStatusKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.emailCommunicationsCheckboxKey),
          findsOneWidget);

      // tap marital status field
      await tester.tap(find.byKey(AppWidgetKeys.maritalStatusKey));
      await tester.pump();

      final String married = MaritalStatus.Married.name;
      final Finder marriedOption = find.byKey(ValueKey<String>(married)).last;

      expect(marriedOption, findsOneWidget);

      await tester.tap(marriedOption);
      await tester.pump();

      // confirm marital status is saved
      expect(extraInformation.maritalStatus.value.fhirName, 'M');

      // tap email checkbox & verify option saved
      final Finder emailCheckbox =
          find.byKey(AppWidgetKeys.emailCommunicationsCheckboxKey);
      expect(emailCheckbox, findsOneWidget);
      await tester.tap(emailCheckbox);
      await tester.pump();
      expect(extraInformation.emailOptIn.valueOrNull, true);

      // verify email form field is rendered and add an invalid email
      final Finder emailCommInput =
          find.byKey(AppWidgetKeys.emailCommunicationsFieldKey);
      expect(emailCommInput, findsOneWidget);

      await tester.enterText(emailCommInput, invalidEmail);
      await tester.pump();

      // tap finish button
      await tester.tap(find.byKey(AppWidgetKeys.finishBtnKey));
      await tester.pump();

      // verify validation error is thrown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Please enter a valid email'), findsOneWidget);
      expect(find.text('Kindly provide a valid email address'), findsOneWidget);
    });

    testWidgets('should clear email data value if email opt in is unchecked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const ExtraInformation(),
        ),
      );

      // tap email checkbox & verify option saved
      final Finder emailCheckbox =
          find.byKey(AppWidgetKeys.emailCommunicationsCheckboxKey);
      expect(emailCheckbox, findsOneWidget);
      await tester.tap(emailCheckbox);
      await tester.pump();
      expect(extraInformation.emailOptIn.valueOrNull, true);
      expect(extraInformation.email.valueOrNull, null);

      // verify email form field is rendered and add an invalid email
      final Finder emailCommInput =
          find.byKey(AppWidgetKeys.emailCommunicationsFieldKey);
      expect(emailCommInput, findsOneWidget);

      await tester.enterText(emailCommInput, invalidEmail);
      await tester.pump();
      expect(extraInformation.email.valueOrNull, invalidEmail);

      await tester.tap(emailCheckbox);
      await tester.pump();

      expect(extraInformation.emailOptIn.valueOrNull, false);
      expect(extraInformation.email.valueOrNull, null);
    });

    testWidgets(
        'should validate the entered email address, save and navigate to'
        ' complete registration screen', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const ExtraInformation(),
        ),
      );

      // verify renders correctly
      expect(find.byKey(AppWidgetKeys.previousBtnKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.finishBtnKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.maritalStatusKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.emailCommunicationsCheckboxKey),
          findsOneWidget);

      // tap marital status field
      await tester.tap(find.byKey(AppWidgetKeys.maritalStatusKey));
      await tester.pump();

      final String married = MaritalStatus.Married.name;
      final Finder marriedOption = find.byKey(ValueKey<String>(married)).last;

      expect(marriedOption, findsOneWidget);

      await tester.tap(marriedOption);
      await tester.pump();

      // confirm marital status is saved
      expect(extraInformation.maritalStatus.value.fhirName, 'M');

      // tap email checkbox & verify option saved
      final Finder emailCheckbox =
          find.byKey(AppWidgetKeys.emailCommunicationsCheckboxKey);
      expect(emailCheckbox, findsOneWidget);
      await tester.tap(emailCheckbox);
      await tester.pump();
      expect(extraInformation.emailOptIn.valueOrNull, true);

      // verify email form field is rendered and add an invalid email
      final Finder emailCommInput =
          find.byKey(AppWidgetKeys.emailCommunicationsFieldKey);
      expect(emailCommInput, findsOneWidget);

      // enter valid email
      await tester.enterText(emailCommInput, testEmail);
      await tester.pump();

      expect(extraInformation.email.value, testEmail);

      // tap finish button
      await tester.tap(find.byKey(AppWidgetKeys.finishBtnKey));
      await tester.pumpAndSettle();

      final BuildContext context =
          tester.element(find.byType(PatientRegistrationContainer));

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Extra information saved'), findsOneWidget);
      expect(PatientRegistrationContainer.of(context)!.currentIndex,
          PatientRegistrationContainer.completeRegistrationIndex);
    });

    testWidgets('previous btn works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const ExtraInformation(),
        ),
      );

      //tap previous button
      await tester.tap(find.byKey(AppWidgetKeys.previousBtnKey));
      await tester.pumpAndSettle();
    });

    testWidgets('skip extra info works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const ExtraInformation(),
        ),
      );

      // tap finish btn button
      await tester.tap(find.byKey(AppWidgetKeys.finishBtnKey));
      await tester.pumpAndSettle();

      //confirm extra information is saved
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(skippingExtraInfo), findsOneWidget);
    });

    testWidgets('response error handling works correctly',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(<String, dynamic>{'error': 'some error'}), 201));

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const ExtraInformation(),
        ),
      );

      // tap marital status field
      await tester.tap(find.byKey(AppWidgetKeys.maritalStatusKey));
      await tester.pump();

      final String married = MaritalStatus.Married.name;
      final Finder marriedOption = find.byKey(ValueKey<String>(married)).last;

      expect(marriedOption, findsOneWidget);

      await tester.tap(marriedOption);
      await tester.pump();

      // confirm marital status is saved
      expect(extraInformation.maritalStatus.value.fhirName, 'M');

      // tap finish btn button
      await tester.tap(find.byKey(AppWidgetKeys.finishBtnKey));
      await tester.pumpAndSettle();

      expect(find.text(UserFeedBackTexts.getErrorMessage(extraInfoText)),
          findsOneWidget);
    });
  });
}

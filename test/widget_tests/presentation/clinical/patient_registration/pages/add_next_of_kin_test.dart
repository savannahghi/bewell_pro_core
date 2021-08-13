import 'dart:convert';

import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/add_next_of_kin.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/verify_phone_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/phone_number_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/inputs.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

const String _testPhoneNumber = '798000000';

void main() {
  group('add next of kin', () {
    late TabController controller;

    setUp(() {
      controller = TabController(length: 4, vsync: const TestVSync());
    });

    testWidgets(
        'first name field should show error text when user leaves '
        'field empty', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const AddNextOfKin(),
        ),
      );

      const String testName = 'John';

      final Finder firstNameFieldFinder =
          find.byKey(AppWidgetKeys.addNextOfKinFirstNameKey);
      expect(firstNameFieldFinder, findsOneWidget);

      await tester.enterText(firstNameFieldFinder, testName);
      expect(find.text(testName), findsOneWidget);

      await tester.enterText(firstNameFieldFinder, '');
      await tester.pump();
      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets(
        'last name field should show error text when user leaves '
        'field empty', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const AddNextOfKin(),
        ),
      );

      const String testName = 'Doe';

      final Finder lastNameFieldFinder =
          find.byKey(AppWidgetKeys.addNextOfKinLastNameKey);
      expect(lastNameFieldFinder, findsOneWidget);

      await tester.enterText(lastNameFieldFinder, testName);
      expect(find.text(testName), findsOneWidget);

      await tester.enterText(lastNameFieldFinder, '');
      await tester.pump();
      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('if patient exists form fields prefilled with correct values',
        (WidgetTester tester) async {
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const AddNextOfKin(),
      );

      final PatientPayload patientPayload = PatientPayload.fromJson(
          registeredPatientData['registerPatient'] as Map<String, dynamic>);
      container.registerNextOfKinPayload.updatePatient(patientPayload);

      await buildTestWidget(tester: tester, widget: container);
      await tester.pumpAndSettle();

      final HumanName name = patientPayload.patientRecord!.name!.first!;
      final String firstName = name.given!.first!;
      final String lastName = name.family!;
      final PatientGenderEnum gender = patientPayload.patientRecord!.gender!;

      final Finder firstNameField = find.descendant(
          of: find.byKey(AppWidgetKeys.addNextOfKinFirstNameKey),
          matching: find.byType(TextField));
      final TextField firstNameTextField =
          tester.widget<TextField>(firstNameField);
      expect(firstNameField, findsOneWidget);
      expect(firstNameTextField.controller?.text, firstName.capitalize());
      expect(firstNameTextField.decoration?.fillColor, Colors.grey[200]);

      final Finder lastNameField = find.descendant(
          of: find.byKey(AppWidgetKeys.addNextOfKinLastNameKey),
          matching: find.byType(TextField));
      final TextField lastNameTextField =
          tester.widget<TextField>(lastNameField);
      expect(lastNameField, findsOneWidget);
      expect(lastNameTextField.controller?.text, lastName.capitalize());
      expect(lastNameTextField.decoration?.fillColor, Colors.grey[200]);

      final Finder dobFinder = find.descendant(
        of: find.byKey(AppWidgetKeys.addNextOfKinDobTextFieldKey,
            skipOffstage: false),
        matching: find.byType(TextField),
      );
      expect(dobFinder, findsOneWidget);
      await tester.ensureVisible(dobFinder);
      await tester.pumpAndSettle();

      final TextField dobTextField = tester.widget<TextField>(dobFinder);
      expect(dobTextField.controller?.text, '1 Jan, 2003');
      expect(dobTextField.decoration?.fillColor, Colors.grey[200]);

      final Finder genderPickerFinder =
          find.byKey(AppWidgetKeys.addNextOfKinGenderKey, skipOffstage: false);
      expect(genderPickerFinder, findsOneWidget);
      await tester.ensureVisible(genderPickerFinder);
      await tester.pump();

      final DropdownButton<String> genderPickerDropDown =
          genderPickerFinder.evaluate().first.widget as DropdownButton<String>;
      expect(genderPickerDropDown.value, describeEnum(gender).capitalize());
      expect(genderPickerDropDown.onChanged, null);
    });

    testWidgets(
        'next button disabled until all required form fields are filled',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const AddNextOfKin(),
        ),
      );

      final Finder nextBtn =
          find.byKey(AppWidgetKeys.addNextOfKinRegisterButtonKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(nextBtn, tester);
      _checkColor(nextBtn, healthcloudAccentColor);
    });

    testWidgets('back button navigates to correct page',
        (WidgetTester tester) async {
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const AddNextOfKin(),
      );

      await buildTestWidget(
        tester: tester,
        widget: container,
      );

      final Finder nextBtn =
          find.byKey(AppWidgetKeys.addNextOfKinRegisterButtonKey);
      expect(nextBtn, findsOneWidget);
      await _fillFormFields(nextBtn, tester);

      final Finder backBtn =
          find.byKey(AppWidgetKeys.addNextOfKinCancelButtonKey);
      expect(backBtn, findsOneWidget);
      await tester.ensureVisible(backBtn);
      await tester.tap(backBtn);
      await tester.pumpAndSettle();

      expect(
          container.currentIndex, PatientRegistrationContainer.nextOfKinIndex);
    });

    testWidgets(
        'when all required form fields are filled, next button should '
        'submit form and navigate to next page', (WidgetTester tester) async {
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const AddNextOfKin(),
      );

      final String id = registeredPatientData['registerPatient']
          ['patientRecord']['ID'] as String;
      final PatientPayload patientPayload =
          PatientPayload(patientRecord: Patient(id: id));
      container.registerNextOfKinPayload.updatePatient(patientPayload);
      container.navigate(PatientRegistrationContainer.addNextOfKinIndex);

      await buildTestWidget(
        tester: tester,
        widget: container,
      );

      final Finder nextBtn =
          find.byKey(AppWidgetKeys.addNextOfKinRegisterButtonKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      // Verify button does nothing
      await tester.tap(nextBtn);
      expect(container.currentIndex,
          PatientRegistrationContainer.addNextOfKinIndex);

      await _fillFormFields(nextBtn, tester);
      _checkColor(nextBtn, healthcloudAccentColor);

      await tester.tap(nextBtn);
      await tester.pumpAndSettle();

      expect(container.currentIndex, PatientRegistrationContainer.nhifIndex);
    });

    testWidgets(
        'when next button is tapped and all form fields '
        'are valid, should show error if response contains error',
        (WidgetTester tester) async {
      final CustomClient client = CustomClient(returnRequestError: true);

      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const AddNextOfKin(),
      );

      final String id = registeredPatientData['registerPatient']
          ['patientRecord']['ID'] as String;
      final PatientPayload patientPayload =
          PatientPayload(patientRecord: Patient(id: id));
      container.registerNextOfKinPayload.updatePatient(patientPayload);

      await buildTestWidget(
        graphQlClient: client,
        tester: tester,
        widget: container,
      );

      final Finder nextBtn =
          find.byKey(AppWidgetKeys.addNextOfKinRegisterButtonKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(nextBtn, tester);
      _checkColor(nextBtn, healthcloudAccentColor);

      await tester.tap(nextBtn);
      await tester.pumpAndSettle();

      expect(find.text(UserFeedBackTexts.getErrorMessage(addingNextOfKin)),
          findsOneWidget);
    });

    testWidgets(
        'if patient exists and required form fields are filled, next button '
        'should submit form and navigate to next page',
        (WidgetTester tester) async {
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const AddNextOfKin(),
      );

      final PatientPayload patientPayload = PatientPayload.fromJson(
          registeredPatientData['registerPatient'] as Map<String, dynamic>);
      container.registerNextOfKinPayload.updatePatient(patientPayload);

      await buildTestWidget(
        tester: tester,
        widget: container,
      );
      await tester.pumpAndSettle();

      final Finder nextBtn =
          find.byKey(AppWidgetKeys.addNextOfKinRegisterButtonKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _enterPhoneAndVerify(tester, _testPhoneNumber, nextBtn,
          prefilled: true);
      _checkColor(nextBtn, Colors.grey);

      await _pickRelation(tester);
      _checkColor(nextBtn, healthcloudAccentColor);
    });
  });
}

Future<void> _fillFormFields(Finder nextBtn, WidgetTester tester) async {
  const String testFirstName = 'John';
  const String testLastName = 'Doe';

  // First name
  final Finder firstNameField =
      find.byKey(AppWidgetKeys.addNextOfKinFirstNameKey);
  expect(firstNameField, findsOneWidget);
  await tester.pumpAndSettle();
  await tester.enterText(firstNameField, testFirstName);
  _checkColor(nextBtn, Colors.grey);

  // Last name
  final Finder lastNameField =
      find.byKey(AppWidgetKeys.addNextOfKinLastNameKey);
  expect(lastNameField, findsOneWidget);
  await tester.pumpAndSettle();
  await tester.enterText(lastNameField, testLastName);
  _checkColor(nextBtn, Colors.grey);

  // Phone Number
  await _enterPhoneAndVerify(tester, _testPhoneNumber, nextBtn);
  _checkColor(nextBtn, Colors.grey);

  // Date of birth
  final Finder datePicker = find.text(enterNextOfKinDob, skipOffstage: false);
  expect(datePicker, findsOneWidget);
  await tester.ensureVisible(datePicker);
  await tester.pump();
  await tester.tap(datePicker);
  await tester.pumpAndSettle();

  final DateTime currentDate = DateTime.now();

  final Finder dateYear = find.text(currentDate.year.toString());
  expect(dateYear, findsOneWidget);
  await tester.tap(dateYear);
  await tester.pumpAndSettle();

  final Finder dateDay = find.text(currentDate.day.toString());
  await tester.tap(dateDay);
  await tester.pumpAndSettle();
  await tester.tap(find.text('OK'));
  await tester.pumpAndSettle();
  _checkColor(nextBtn, Colors.grey);

  // Gender
  final Finder genderPicker =
      find.byKey(AppWidgetKeys.addNextOfKinGenderKey, skipOffstage: false);
  expect(genderPicker, findsOneWidget);
  await tester.ensureVisible(genderPicker);
  await tester.pump();
  await tester.tap(genderPicker);
  await tester.pump();

  final String male = Gender.male.name.capitalize();
  final Finder maleOption = find.byKey(ValueKey<String>(male)).at(1);
  expect(maleOption, findsOneWidget);
  await tester.tap(maleOption);
  await tester.pumpAndSettle();
  _checkColor(nextBtn, Colors.grey);

  // // relationship
  await _pickRelation(tester);
}

Future<void> _pickRelation(WidgetTester tester) async {
  final Finder relationPicker = find
      .byKey(AppWidgetKeys.addNextOfKinRelationshipKey, skipOffstage: false);
  expect(relationPicker, findsOneWidget);
  await tester.ensureVisible(relationPicker);
  await tester.pump();
  await tester.tap(relationPicker);
  await tester.pump();

  final String nextOfKinRelation = NextOfKinRelation.Next_of_Kin.name;
  final Finder nextOfKinOption =
      find.byKey(ValueKey<String>(nextOfKinRelation)).at(1);
  expect(nextOfKinOption, findsOneWidget);
  await tester.tap(nextOfKinOption);
  await tester.pumpAndSettle();
}

Future<void> _enterPhoneAndVerify(
    WidgetTester tester, String testPhoneNumber, Finder nextBtn,
    {bool prefilled = false}) async {
  final Finder verifyPhoneBtn =
      find.byKey(AppWidgetKeys.verifyButtonKey, skipOffstage: false);
  if (prefilled) {
    final Finder phoneNumTextField = find.text('+254712345678');
    expect(phoneNumTextField, findsOneWidget);
    expect(verifyPhoneBtn, findsOneWidget);
  } else {
    expect(verifyPhoneBtn, findsNothing);
    final Finder phoneInput = find.byType(SILPhoneInput);
    expect(find.byType(PhoneNumberFieldWidget), findsOneWidget);
    expect(phoneInput, findsOneWidget);
    await tester.pumpAndSettle();
    await tester.enterText(phoneInput, testPhoneNumber);
    await tester.pumpAndSettle();
  }

  _checkColor(nextBtn, Colors.grey);

  // Verify phone
  expect(verifyPhoneBtn, findsOneWidget);
  await tester.ensureVisible(verifyPhoneBtn);
  await tester.pumpAndSettle();
  await tester.tap(verifyPhoneBtn);
  await tester.pumpAndSettle();
  expect(find.byType(VerifyPhoneDialog), findsOneWidget);

  final Finder dialogInput = find.byKey(AppWidgetKeys.otpVerifyInput);
  expect(dialogInput, findsOneWidget);
  // await tester.showKeyboard(dialogInput);
  await tester.pumpAndSettle();
  await tester.enterText(dialogInput, '123456');
  await tester.pumpAndSettle();
  expect(find.text(verifiedText), findsOneWidget);
}

void _checkColor(Finder nextBtn, Color expectedColor) {
  final Color? fillColor =
      (nextBtn.evaluate().first.widget as RawMaterialButton).fillColor;
  expect(fillColor, expectedColor);
}

class CustomClient extends MockGraphQlClient {
  final bool returnRequestError;

  CustomClient({bool? returnRequestError})
      : returnRequestError = returnRequestError ?? false;

  @override
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) {
    if (queryString.contains('addNextOfKin')) {
      if (returnRequestError) {
        response = http.Response(
            json.encode(<String, String>{'error': 'random error'}), 201);
      }

      return Future<http.Response>.value(response);
    }

    return super.query(queryString, variables, contentType);
  }
}

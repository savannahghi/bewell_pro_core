import 'dart:convert';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/basic_details.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/verify_phone_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/phone_number_field.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/inputs.dart';

import '../../../../../mocks/base64_image.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('BasicDetails', () {
    late Store<AppState> store;
    late TabController controller;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      controller = TabController(length: 4, vsync: const TestVSync());
    });

    testWidgets(
        'next button should be disabled if all form fields have not been filled',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const BasicDetailsWidget(),
        ),
      );

      final Finder nextBtn = find.byKey(AppWidgetKeys.basicDetailsNextBtnKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(tester);
      _checkColor(nextBtn, healthcloudPrimaryColor);
    });

    testWidgets(
        'should request camera permissions when app is resumed from background',
        (WidgetTester tester) async {
      final MockPermissionHandlerPlatform platform =
          MockPermissionHandlerPlatform(denied: true);

      PermissionHandlerPlatform.instance = platform;
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientRegistrationContainer(
            tabController: controller,
            child: const BasicDetailsWidget(),
          ),
        );

        expect(platform.permissionRequests, 1);
        tester.binding
            .handleAppLifecycleStateChanged(AppLifecycleState.resumed);

        await tester.pumpAndSettle();
        expect(platform.permissionRequests, 2);
      });
    });

    testWidgets('should show error snack bar if camera permissions denied',
        (WidgetTester tester) async {
      final MockPermissionHandlerPlatform platform =
          MockPermissionHandlerPlatform(denied: true);

      PermissionHandlerPlatform.instance = platform;

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientRegistrationContainer(
            tabController: controller,
            child: const BasicDetailsWidget(),
          ),
        );

        expect(find.byKey(AppWidgetKeys.noProfilePhotKey), findsOneWidget);
        expect(find.text(enableCameraPerm), findsOneWidget);

        final Finder imagePicker =
            find.byKey(AppWidgetKeys.basicDetailsPhotoButtonKey);
        expect(imagePicker, findsOneWidget);
        await tester.tap(imagePicker);
        await tester.pumpAndSettle();

        expect(find.text(allowPermPhotos), findsOneWidget);
      });
    });

    testWidgets('tapping on profile photo should take photo',
        (WidgetTester tester) async {
      final MemoryFileSystem fileSystem = MemoryFileSystem();
      final Uint8List image = base64Decode(mockBase64Image);
      fileSystem.file(mockImagePath).writeAsBytes(image);

      ImagePickerPlatform.instance = MockImagePickerPlatform();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientRegistrationContainer(
            tabController: controller,
            child: BasicDetailsWidget(
              fileSystem: fileSystem,
            ),
          ),
        );

        expect(find.byKey(AppWidgetKeys.noProfilePhotKey), findsOneWidget);

        final Finder imagePicker =
            find.byKey(AppWidgetKeys.basicDetailsPhotoButtonKey);
        expect(imagePicker, findsOneWidget);
        await tester.tap(imagePicker);
        await tester.pumpAndSettle();

        final Finder camera = find.text(cameraText);
        expect(camera, findsOneWidget);
        await tester.tap(camera);
        await tester.pumpAndSettle();

        expect(find.byKey(AppWidgetKeys.basicDetailsPhotoContainerKey),
            findsOneWidget);

        expect(find.byKey(AppWidgetKeys.noProfilePhotKey), findsNothing);
      });
    });

    testWidgets('tapping on ID Document Front should take photo',
        (WidgetTester tester) async {
      final MemoryFileSystem fileSystem = MemoryFileSystem();
      final Uint8List image = base64Decode(mockBase64Image);
      fileSystem.file(mockImagePath).writeAsBytes(image);

      ImagePickerPlatform.instance = MockImagePickerPlatform();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientRegistrationContainer(
            tabController: controller,
            child: BasicDetailsWidget(
              fileSystem: fileSystem,
            ),
          ),
        );

        await _pickIdDocument(tester, AppWidgetKeys.idDocumentFrontKey);

        expect(find.text(retakeIdentificationFront), findsOneWidget);
      });
    });

    testWidgets('tapping on ID Document Back should take photo',
        (WidgetTester tester) async {
      final MemoryFileSystem fileSystem = MemoryFileSystem();
      final Uint8List image = base64Decode(mockBase64Image);
      fileSystem.file(mockImagePath).writeAsBytes(image);

      ImagePickerPlatform.instance = MockImagePickerPlatform();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientRegistrationContainer(
            tabController: controller,
            child: BasicDetailsWidget(
              fileSystem: fileSystem,
            ),
          ),
        );

        await _pickIdDocument(tester, AppWidgetKeys.idDocumentBackKey);

        expect(find.text(retakeIdentificationBack), findsOneWidget);
      });
    });

    testWidgets(
        'next button should navigate to next page if all form fields '
        'are filled', (WidgetTester tester) async {
      final MemoryFileSystem fileSystem = MemoryFileSystem();
      final Uint8List image = base64Decode(mockBase64Image);
      fileSystem.file(mockImagePath).writeAsBytes(image);

      ImagePickerPlatform.instance = MockImagePickerPlatform();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: BasicDetailsWidget(
          fileSystem: fileSystem,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: container,
      );

      final Finder nextBtn = find.byKey(AppWidgetKeys.basicDetailsNextBtnKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(tester);
      _checkColor(nextBtn, healthcloudPrimaryColor);

      await _pickIdDocument(tester, AppWidgetKeys.idDocumentFrontKey);
      await _pickIdDocument(tester, AppWidgetKeys.idDocumentBackKey);

      await tester.tap(nextBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(
          container.currentIndex, PatientRegistrationContainer.nextOfKinIndex);
    });

    testWidgets(
        'when next button is tapped and all form fields '
        'are valid, should show error if patient with same phone number is '
        'already registered', (WidgetTester tester) async {
      final CustomClient graphQlClient = CustomClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: graphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const BasicDetailsWidget(),
        ),
      );

      final Finder nextBtn = find.byKey(AppWidgetKeys.basicDetailsNextBtnKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(tester);
      _checkColor(nextBtn, healthcloudPrimaryColor);

      await tester.tap(nextBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text(phoneNumberExistsText.capitalize()), findsOneWidget);
    });

    testWidgets(
        'when next button is tapped and all form fields '
        'are valid, should show error if response contains error',
        (WidgetTester tester) async {
      final CustomClient graphQlClient = CustomClient(returnRequestError: true);

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: graphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const BasicDetailsWidget(),
        ),
      );

      final Finder nextBtn = find.byKey(AppWidgetKeys.basicDetailsNextBtnKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(tester);
      _checkColor(nextBtn, healthcloudPrimaryColor);

      await tester.tap(nextBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text(UserFeedBackTexts.getErrorMessage(savingBasicDetails)),
          findsOneWidget);
    });

    testWidgets(
        'when next button is tapped and all form fields '
        'are valid, should show error if registerPatient field of response is '
        'null or absent', (WidgetTester tester) async {
      final CustomClient graphQlClient =
          CustomClient(registerPatientNull: true);

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: graphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const BasicDetailsWidget(),
        ),
      );

      final Finder nextBtn = find.byKey(AppWidgetKeys.basicDetailsNextBtnKey);
      expect(nextBtn, findsOneWidget);
      _checkColor(nextBtn, Colors.grey);

      await _fillFormFields(tester);
      _checkColor(nextBtn, healthcloudPrimaryColor);

      await tester.tap(nextBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text(UserFeedBackTexts.getErrorMessage(savingBasicDetails)),
          findsOneWidget);
    });
  });
}

Future<void> _pickIdDocument(WidgetTester tester, Key idDocumentKey) async {
  final Finder documentTypePicker = find
      .byKey(AppWidgetKeys.basicDetailsIdentificationKey, skipOffstage: false);
  await tester.ensureVisible(documentTypePicker);
  await tester.pumpAndSettle();
  expect(documentTypePicker, findsOneWidget);
  await tester.tap(documentTypePicker);
  await tester.pump();

  final String nationalId = DocumentType.National_ID.name;
  final Finder nationalIdOption =
      find.byKey(ValueKey<String>(nationalId)).first;
  expect(nationalIdOption, findsOneWidget);
  await tester.tap(nationalIdOption);
  await tester.pumpAndSettle();

  final Finder imagePicker = find.byKey(idDocumentKey, skipOffstage: false);
  await tester.ensureVisible(imagePicker);
  await tester.pumpAndSettle();
  expect(imagePicker, findsOneWidget);
  await tester.tap(imagePicker);
  await tester.pumpAndSettle();

  final Finder camera = find.text(cameraText);
  expect(camera, findsOneWidget);
  await tester.tap(camera);
  await tester.pumpAndSettle();
}

Future<void> _fillFormFields(WidgetTester tester) async {
  const String testFirstName = 'John';
  const String testLastName = 'Doe';
  const String testPhoneNumber = '798000000';

  final Finder nextBtn = find.byKey(AppWidgetKeys.basicDetailsNextBtnKey);

  // First name
  final Finder firstNameField = find.byKey(AppWidgetKeys.firstNameKey);
  expect(firstNameField, findsOneWidget);
  await tester.enterText(firstNameField, testFirstName);
  await tester.testTextInput.receiveAction(TextInputAction.done);
  _checkColor(nextBtn, Colors.grey);

  // Last name
  final Finder lastNameField = find.byKey(AppWidgetKeys.lastNameKey);
  expect(lastNameField, findsOneWidget);
  await tester.enterText(lastNameField, testLastName);
  await tester.testTextInput.receiveAction(TextInputAction.done);
  _checkColor(nextBtn, Colors.grey);

  // Phone Number
  final Finder verifyPhoneBtn =
      find.byKey(AppWidgetKeys.verifyButtonKey, skipOffstage: false);
  expect(verifyPhoneBtn, findsNothing);
  expect(find.byType(PhoneNumberFieldWidget), findsOneWidget);
  expect(find.byType(SILPhoneInput), findsOneWidget);
  await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
  await tester.pumpAndSettle();
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
  await tester.enterText(dialogInput, '123456');
  await tester.pumpAndSettle();
  expect(find.text(verifiedText), findsOneWidget);
  _checkColor(nextBtn, Colors.grey);

  // Date of birth
  final Finder datePicker = find.text(enterDob, skipOffstage: false);
  expect(datePicker, findsOneWidget);
  await tester.ensureVisible(datePicker);
  await tester.pump();
  await tester.tap(datePicker);
  await tester.pumpAndSettle();

  final DateTime currentDate = DateTime.now();
  final DateTime dateToPick =
      DateTime(currentDate.year - 18, currentDate.month, currentDate.day);

  final Finder dateYear = find.text(dateToPick.year.toString());
  expect(dateYear, findsOneWidget);
  await tester.tap(dateYear);
  await tester.pumpAndSettle();

  final Finder dateDay = find.text(dateToPick.day.toString());
  await tester.tap(dateDay);
  await tester.pumpAndSettle();
  await tester.tap(find.text('OK'));
  await tester.pumpAndSettle();
  _checkColor(nextBtn, Colors.grey);

  // Gender
  final Finder genderPicker =
      find.byKey(AppWidgetKeys.basicDetailsGenderKey, skipOffstage: false);
  expect(genderPicker, findsOneWidget);
  await tester.ensureVisible(genderPicker);
  await tester.pump();
  await tester.tap(genderPicker);
  await tester.pump();

  final String male = Gender.male.name.capitalize();
  final Finder maleOption = find.byKey(ValueKey<String>(male)).first;
  expect(maleOption, findsOneWidget);
  await tester.tap(maleOption);
  await tester.pumpAndSettle();
  _checkColor(nextBtn, Colors.grey);

  // id type
  final Finder idTypePicker = find
      .byKey(AppWidgetKeys.basicDetailsIdentificationKey, skipOffstage: false);
  expect(idTypePicker, findsOneWidget);
  await tester.ensureVisible(idTypePicker);
  await tester.pump();
  await tester.tap(idTypePicker);
  await tester.pump();

  final String nationalId = DocumentType.National_ID.name;
  final Finder nationalIdOption =
      find.byKey(ValueKey<String>(nationalId)).first;
  expect(nationalIdOption, findsOneWidget);
  await tester.tap(nationalIdOption);
  await tester.pumpAndSettle();

  final Finder idNumberField = find.byKey(
      AppWidgetKeys.basicDetailsIdentificationTextField,
      skipOffstage: false);
  expect(idNumberField, findsOneWidget);
  await tester.ensureVisible(idNumberField);
  await tester.pump();
  const String idNumber = '123456';
  await tester.enterText(idNumberField, idNumber);
  await tester.pumpAndSettle();
}

void _checkColor(Finder nextBtn, Color expectedColor) {
  final Color? backGroundColor =
      (nextBtn.evaluate().first.widget as FloatingActionButton).backgroundColor;
  expect(backGroundColor, expectedColor);
}

class CustomClient extends MockSILGraphQlClient {
  final bool returnRequestError;
  final bool registerPatientNull;

  CustomClient({bool? returnRequestError, bool? registerPatientNull})
      : returnRequestError = returnRequestError ?? false,
        registerPatientNull = registerPatientNull ?? false;

  @override
  Future<http.Response> query(
      String queryString, Map<String, dynamic> variables,
      [ContentType contentType = ContentType.json]) {
    if (queryString.contains('registerPatient')) {
      http.Response response;

      if (returnRequestError) {
        response = http.Response(
            json.encode(<String, String>{'error': 'random error'}), 201);
      } else if (registerPatientNull) {
        response = http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'registerPatient': null,
              }
            }),
            201);
      } else {
        response = http.Response(
            json.encode(<String, String>{'error': phoneNumberExistsText}), 201);
      }

      return Future<http.Response>.value(response);
    }

    return super.query(queryString, variables, contentType);
  }
}

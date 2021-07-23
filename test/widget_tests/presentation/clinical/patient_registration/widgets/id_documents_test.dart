import 'dart:convert';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:file/memory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/basic_details_form_manager.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_registration_image_data.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/id_documents.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

import '../../../../../mocks/base64_image.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('IDDocumentsWidget', () {
    late Store<CoreState> store;
    late BasicDetailsFormManager formManager;
    final MemoryFileSystem fileSystem = MemoryFileSystem();

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
      formManager = BasicDetailsFormManager();
    });

    testWidgets(
        'renders the passport number text field when passport is selected from '
        'the dropdown', (WidgetTester tester) async {
      final String hintText =
          "Enter the patient's ${DocumentType.Passport.name} number";

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IDDocumentsWidget(
          fileSystem: fileSystem,
          formManager: formManager,
          takePhotoCallback: (
              {required ImageDocumentType documentType}) async {},
        ),
      );

      // Selecting an option from a dropdown requires 2 separate taps, one to "activate"
      // the dropdown and another to then select the desired dropdown field. Due to the
      // animated nature of switching values from a dropdown, two frames must be pumped
      // twice for a single change in values to take effect.
      // For more information: https://stackoverflow.com/questions/64490039/flutter-widget-test-does-not-trigger-dropdownbutton-onchanged-when-selecting-ano

      await tester
          .tap(find.byKey(ValueKey<String>(DocumentType.National_ID.name)));
      await tester.pump();
      await tester.pump();

      // Here it is necessary to call `.last` as the first widget returned belongs to the
      // index stack and is not the desired one.
      await tester
          .tap(find.byKey(ValueKey<String>(DocumentType.Passport.name)).last);
      await tester.pump();
      await tester.pump();

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is DropdownButton<String> &&
              widget.value == DocumentType.Passport.name),
          findsOneWidget);

      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets(
        'renders document front container if document front is not null',
        (WidgetTester tester) async {
      const String selectedImagePath = './image.jpg';

      formManager.inIdDocumentFront.add(
        PatientRegistrationImageData(
          contentType: ImageContentType.PNG,
          fileName: '',
          base64Data: '',
          filePath: selectedImagePath,
          title: ImageDocumentType.IDDocumentFront.name,
        ),
      );

      final Uint8List image = base64Decode(mockBase64Image);
      fileSystem.file(selectedImagePath).writeAsBytes(image);
      ImagePickerPlatform.instance = MockImagePickerPlatform();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

      int takePhotoCount = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IDDocumentsWidget(
          fileSystem: fileSystem,
          formManager: formManager,
          takePhotoCallback: ({required ImageDocumentType documentType}) =>
              takePhotoCount++,
        ),
      );
      await tester.pump();

      expect(find.text(retakeIdentificationFront), findsOneWidget);
      await tester.tap(find.text(retakeIdentificationFront));
      await tester.pumpAndSettle();

      expect(takePhotoCount, 1);
    });

    testWidgets('renders document back container if document back is not null',
        (WidgetTester tester) async {
      const String selectedImagePath = './image.jpg';

      formManager.inIdDocumentBack.add(
        PatientRegistrationImageData(
          contentType: ImageContentType.PNG,
          fileName: '',
          base64Data: '',
          filePath: selectedImagePath,
          title: ImageDocumentType.IDDocumentBack.name,
        ),
      );

      final Uint8List image = base64Decode(mockBase64Image);
      fileSystem.file(selectedImagePath).writeAsBytes(image);
      ImagePickerPlatform.instance = MockImagePickerPlatform();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

      int takePhotoCount = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IDDocumentsWidget(
          fileSystem: fileSystem,
          formManager: formManager,
          takePhotoCallback: ({required ImageDocumentType documentType}) =>
              takePhotoCount++,
        ),
      );
      await tester.pump();

      expect(find.text(retakeIdentificationBack), findsOneWidget);
      await tester.tap(find.text(retakeIdentificationBack));
      await tester.pumpAndSettle();

      expect(takePhotoCount, 1);
    });

    testWidgets('should show error if id number is invalid',
        (WidgetTester tester) async {
      const String tooLongIdNumber = '0123456789123';
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: IDDocumentsWidget(
            fileSystem: fileSystem,
            formManager: formManager,
            takePhotoCallback: ({required ImageDocumentType documentType}) {}),
      );
      await tester.pump();

      final Finder idNumberTextField =
          find.byKey(AppWidgetKeys.basicDetailsIdentificationTextField);

      expect(idNumberTextField, findsOneWidget);
      await tester.tap(idNumberTextField);
      await tester.enterText(idNumberTextField, tooLongIdNumber);
      await tester.pumpAndSettle();

      expect(find.text('National ID number is invalid'), findsOneWidget);
    });
  });
}

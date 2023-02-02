// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/history_form_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  Store<CoreState> store;

  final CoreState state = CoreState.initial();
  store = Store<CoreState>(initialState: state);

  ExamCompositionObject()
    ..id.add(testPatientID)
    ..recordingDoctor.add('John')
    ..patientHistoryCompositionID.add(testCompositionID)
    ..data.addAll(testCompositionObjectData);

  final PatientHistoryData filledPayload = PatientHistoryData(
      historyOfPresentingIllness: 'presenting illness',
      familyAndSocialHistory: 'family and social',
      medicalAndSurgicalHistory: 'medical and surgical');

  const String title = 'Family & Social history';

  final PatientHistoryData emptyPayload = PatientHistoryData(
      historyOfPresentingIllness: '',
      familyAndSocialHistory: '',
      medicalAndSurgicalHistory: '');

  setUpAll(() {
    startMockVisitAndExam();
  });

  testWidgets('Patient History Form renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      store: store,
      tester: tester,
      widget: PatientHistoryForm(
        patientHistoryPayload: filledPayload,
      ),
    );

    expect(find.byType(PatientHistoryForm), findsOneWidget);
    expect(find.byType(HistoryFormInput), findsWidgets);

    await tester.tap(find.byType(DrawerSaveButton));
    await tester.pumpAndSettle();

    expect(find.text('Patient history updated successfully'), findsOneWidget);
  });

  testWidgets('should enter family history', (WidgetTester tester) async {
    await buildTestWidget(
        store: store,
        tester: tester,
        widget: PatientHistoryForm(patientHistoryPayload: emptyPayload));

    expect(find.byType(PatientHistoryForm), findsOneWidget);
    expect(find.byType(HistoryFormInput), findsWidgets);

    expect(find.text(title), findsOneWidget);

    expect(find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey),
        findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey));
    await tester.pump();
    await tester.showKeyboard(
        find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey));
    await tester.enterText(
        find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey),
        'History of blood pressure');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pump();

    expect(find.text('History of blood pressure'), findsOneWidget);

    await tester.tap(find.byType(DrawerSaveButton));
    await tester.pumpAndSettle();

    expect(find.text('Patient history updated successfully'), findsOneWidget);
  });

  testWidgets('should enter history of presenting illness',
      (WidgetTester tester) async {
    const String title = 'History of presenting illness';

    await buildTestWidget(
      store: store,
      tester: tester,
      widget: PatientHistoryForm(patientHistoryPayload: emptyPayload),
    );

    expect(find.byType(PatientHistoryForm), findsOneWidget);
    expect(find.byType(HistoryFormInput), findsWidgets);

    expect(find.text(title), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
        findsOneWidget);

    await tester
        .tap(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey));
    await tester.pump();

    await tester.enterText(
        find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
        'blood pressure');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pump();
    expect(find.text('blood pressure'), findsOneWidget);
  });

  testWidgets('should validate when history of presenting illness is empty',
      (WidgetTester tester) async {
    const String title = 'History of presenting illness';

    await buildTestWidget(
      store: store,
      tester: tester,
      widget: PatientHistoryForm(patientHistoryPayload: emptyPayload),
    );

    expect(find.byType(PatientHistoryForm), findsOneWidget);
    expect(find.byType(HistoryFormInput), findsWidgets);

    expect(find.text(title), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
        findsOneWidget);

    await tester
        .tap(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey));
    await tester.pump();

    await tester.enterText(
        find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey), '');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.byKey(AppWidgetKeys.medicalHistoryDescriptionTextKey),
        findsOneWidget);

    await tester
        .tap(find.byKey(AppWidgetKeys.medicalHistoryDescriptionTextKey));
    await tester.pump();

    await tester.enterText(
        find.byKey(AppWidgetKeys.medicalHistoryDescriptionTextKey),
        'blood pressure');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.tap(find.byType(DrawerSaveButton));
    await tester.pumpAndSettle();

    expect(find.text('Please enter some text'), findsOneWidget);
  });

  testWidgets(
      'should validate that payload is equal to text entered and save the information',
      (WidgetTester tester) async {
    const String title = 'History of presenting illness';

    await buildTestWidget(
      store: store,
      tester: tester,
      widget: PatientHistoryForm(patientHistoryPayload: emptyPayload),
    );

    expect(find.byType(PatientHistoryForm), findsOneWidget);
    expect(find.byType(HistoryFormInput), findsWidgets);
// expect to find the illness form
    expect(find.text(title), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
        findsOneWidget);

    await tester
        .tap(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey));
    await tester.pump();

    await tester.enterText(
        find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
        'history of pressure');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(find.text('history of pressure'), findsOneWidget);

// expect to find the medical history form
    expect(find.byKey(AppWidgetKeys.medicalHistoryDescriptionTextKey),
        findsOneWidget);

    await tester
        .tap(find.byKey(AppWidgetKeys.medicalHistoryDescriptionTextKey));
    await tester.pump();

    await tester.enterText(
        find.byKey(AppWidgetKeys.medicalHistoryDescriptionTextKey),
        'blood pressure');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(find.text('blood pressure'), findsOneWidget);

// expect to find the family history form
    expect(find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey),
        findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey));
    await tester.pump();

    await tester.enterText(
        find.byKey(AppWidgetKeys.familyHistoryDescriptionTextKey),
        'history of depression');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(find.text('history of depression'), findsOneWidget);

    await tester.tap(find.byType(DrawerSaveButton));
    await tester.pump(Duration.zero);

    expect(find.byType(DrawerSaveButton), findsOneWidget);
  });

  testWidgets(
    'renders snackbar with text patientHistorySuccessMsg after submitting with an empty composition ID',
    (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{
                    'data': <String, dynamic>{
                      'createFHIRComposition': <String, dynamic>{
                        'resource': <String, String>{'ID': ''}
                      }
                    }
                  }),
                  200));

      ExamCompositionObject().patientHistoryCompositionID.add('');

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: graphQlClient,
        widget: PatientHistoryForm(
          patientHistoryPayload: emptyPayload,
        ),
      );

      await tester
          .tap(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey));
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
          'blood pressure');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      await tester.tap(find.byType(DrawerSaveButton));
      await tester.pumpAndSettle();

      expect(find.text(patientHistorySuccessMsg), findsOneWidget);
    },
  );
}

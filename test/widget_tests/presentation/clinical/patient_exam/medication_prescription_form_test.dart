import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/medication_prescription_form.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  const String _doctorsNote = 'doctors note';
  const String _takeEvery = '8';
  const String _period = '4';
  const String _rx = '20';

  group('Medication Prescription Form', () {
    testWidgets(
        'Medication Prescription Form renders correctly and medication can be saved correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final AddMedicationObject addMedicationObject = AddMedicationObject();
      addMedicationObject.medicationName.add('Amoxicillin');

      startMockVisitAndExam();
      await buildTestWidget(
        tester: tester,
        widget: MedicationPrescriptionForm(
          onMedicationCancel: () {},
        ),
      );

      expect(find.text('Selected Medication'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Selected Medication'), findsOneWidget);
      expect(find.text('Prescription'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.rxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.takeEveryKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.periodKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.noteKey), findsOneWidget);

      // enter rx value
      await tester.tap(find.byKey(AppWidgetKeys.rxKey));
      await tester.enterText(find.byKey(AppWidgetKeys.rxKey), _rx);
      await tester.pumpAndSettle();

      // enter takeEveryKey value
      await tester.tap(find.byKey(AppWidgetKeys.takeEveryKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.takeEveryKey), _takeEvery);
      await tester.pumpAndSettle();

      // enter periodKey value
      await tester.tap(find.byKey(AppWidgetKeys.periodKey));
      await tester.enterText(find.byKey(AppWidgetKeys.periodKey), _period);
      await tester.pumpAndSettle();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.noteKey));
      await tester.enterText(find.byKey(AppWidgetKeys.noteKey), _doctorsNote);
      await tester.pumpAndSettle();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      expect(addMedicationObject.note.value, _doctorsNote);
      expect(addMedicationObject.takeEvery.value, _takeEvery);
      expect(addMedicationObject.forValue.value, _period);
      expect(addMedicationObject.rx.value, _rx);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Medication Prescription Form fails to save medication',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final AddMedicationObject addMedicationObject = AddMedicationObject();
      addMedicationObject.medicationName.add('Amoxicillin');

      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
      );

      startMockVisitAndExam();
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: MedicationPrescriptionForm(
          onMedicationCancel: () {},
        ),
      );

      expect(find.text('Selected Medication'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Selected Medication'), findsOneWidget);
      expect(find.text('Prescription'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.rxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.takeEveryKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.periodKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.noteKey), findsOneWidget);

      // enter rx value
      await tester.tap(find.byKey(AppWidgetKeys.rxKey));
      await tester.enterText(find.byKey(AppWidgetKeys.rxKey), _rx);
      await tester.pumpAndSettle();

      // enter takeEveryKey value
      await tester.tap(find.byKey(AppWidgetKeys.takeEveryKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.takeEveryKey), _takeEvery);
      await tester.pumpAndSettle();

      // enter periodKey value
      await tester.tap(find.byKey(AppWidgetKeys.periodKey));
      await tester.enterText(find.byKey(AppWidgetKeys.periodKey), _period);
      await tester.pumpAndSettle();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.noteKey));
      await tester.enterText(find.byKey(AppWidgetKeys.noteKey), _doctorsNote);
      await tester.pumpAndSettle();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      expect(addMedicationObject.rx.value, _rx);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

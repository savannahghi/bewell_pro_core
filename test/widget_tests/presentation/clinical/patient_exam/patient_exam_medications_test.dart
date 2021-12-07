// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/medication_item_large_screen.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/medication_item_small_screen.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_medications.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PatientExamMedications', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('should display a medication item on a small screen',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const PatientExamMedications(
          recordedDiagnosis:
              'Benign Hypertensive Renal Disease With Renal Failure',
          recordedDiagnosisID: '1f852829-9469-4e41-954a-d34dc8074c37',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireMedicationSmallScreen),
          findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byType(MedicationItemSmallScreen), findsOneWidget);
    });

    testWidgets('should display a medication item on a large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        widget: const PatientExamMedications(
          recordedDiagnosis:
              'Benign Hypertensive Renal Disease With Renal Failure',
          recordedDiagnosisID: '1f852829-9469-4e41-954a-d34dc8074c37',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireMedicationsLargeScreen),
          findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byType(MedicationItemLargeScreen), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should retire a medication successfully and show a snackbar',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const PatientExamMedications(
          recordedDiagnosis:
              'Benign Hypertensive Renal Disease With Renal Failure',
          recordedDiagnosisID: '1f852829-9469-4e41-954a-d34dc8074c37',
        ),
      );

      // wait for the data to be fetched
      await tester.pumpAndSettle();

      // Verify the UI is rendered
      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireMedicationSmallScreen),
          findsOneWidget);
      expect(find.byType(MedicationItemSmallScreen), findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsOneWidget);

      // Open the retire dialog
      await tester.tap(find.byKey(AppWidgetKeys.examItemButtonKeyKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.retireMedicationSmallScreen));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      //Enter reason to retire the allergy
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.pump();

      // Tap the confirm button
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(ExamChangeObject().onAddMedicationListener.value, true);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Medications retired successfully'), findsOneWidget);
    });

    testWidgets(
        'should show a GenericZeroStateWidget when there is no '
        'medication data', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRMedicationRequest': <String, dynamic>{
                  'edges': <dynamic>[]
                }
              }
            }),
            201),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: const PatientExamMedications(
          recordedDiagnosis:
              'Benign Hypertensive Renal Disease With Renal Failure',
          recordedDiagnosisID: '1f852829-9469-4e41-954a-d34dc8074c37',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
    });

    testWidgets(
        'should show a loading indicator when medications are being fetched',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            201),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: const PatientExamMedications(
          recordedDiagnosis:
              'Benign Hypertensive Renal Disease With Renal Failure',
          recordedDiagnosisID: '1f852829-9469-4e41-954a-d34dc8074c37',
        ),
      );

      await tester.pump();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('should display medication items on largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        widget: const PatientExamMedications(
          recordedDiagnosis:
              'Benign Hypertensive Renal Disease With Renal Failure',
          recordedDiagnosisID: '1f852829-9469-4e41-954a-d34dc8074c37',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireMedicationsLargeScreen),
          findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byType(MedicationItemLargeScreen), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireMedicationsLargeScreen));
      await tester.pumpAndSettle();

      // verify retire dialog is opened
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(CircleAvatar), findsWidgets);
      expect(find.text(retireText), findsWidgets);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

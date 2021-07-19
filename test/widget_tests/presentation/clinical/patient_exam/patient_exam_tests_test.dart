import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_item_large.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_test_item_small.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_tests.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_test_zero_state.dart';

import 'package:http/http.dart' as http;
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PatientExamTests', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('should display test items on small screen correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          graphQlClient: mockSILGraphQlClient,
          tester: tester,
          widget: const PatientExamTests(
            recordedDiagnosis: 'Diabetes Mellitus',
            recordedDiagnosisID: '9db28c1f-259f-4d74-918e-f84975c33005',
          ));

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.examItemButtonKeyKey), findsOneWidget);
      expect(find.byType(PatientExamTestItemSmall), findsOneWidget);
    });

    testWidgets('should display test items on large screen correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
          graphQlClient: mockSILGraphQlClient,
          tester: tester,
          widget: const PatientExamTests(
            recordedDiagnosis: 'Diabetes Mellitus',
            recordedDiagnosisID: '9db28c1f-259f-4d74-918e-f84975c33005',
          ));

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.examItemButtonKeyKey), findsOneWidget);
      expect(find.byType(PatientExamTestItemLarge), findsOneWidget);

      await tester.tap(
          find.byKey(AppWidgetKeys.patientExamTestsRetireLargeScreenButtonKey));
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

    testWidgets('should retire a test and show a success snackbar',
        (WidgetTester tester) async {
      await buildTestWidget(
          graphQlClient: mockSILGraphQlClient,
          tester: tester,
          widget: const PatientExamTests(
            recordedDiagnosis: 'Diabetes Mellitus',
            recordedDiagnosisID: '9db28c1f-259f-4d74-918e-f84975c33005',
          ));

      // wait for data to be fetched
      await tester.pumpAndSettle();

      // verify the data was rendered
      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.examItemButtonKeyKey), findsOneWidget);
      expect(find.byType(PatientExamTestItemSmall), findsOneWidget);

      // tap the retire button
      await tester.tap(find.byKey(AppWidgetKeys.examItemButtonKeyKey));
      await tester.pumpAndSettle();

      expect(
          find.byKey(AppWidgetKeys.patientExamTestsRetireSmallScreenButtonKey),
          findsOneWidget);
      await tester.tap(
          find.byKey(AppWidgetKeys.patientExamTestsRetireSmallScreenButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      // Enter reason to retire the test
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.pump();

      // Tap the confirm button
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(ExamChangeObject().onAddTestListener.value, true);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Test retired successfully'), findsOneWidget);
    });

    testWidgets('should show PatientTestZeroState when there are no tests',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRServiceRequest': <String, dynamic>{
                  'edges': <dynamic>[]
                }
              }
            }),
            201),
      );

      await buildTestWidget(
          graphQlClient: mockShortSILGraphQlClient,
          tester: tester,
          widget: const PatientExamTests(
            recordedDiagnosis: 'Diabetes Mellitus',
            recordedDiagnosisID: '9db28c1f-259f-4d74-918e-f84975c33005',
          ));

      await tester.pumpAndSettle();

      expect(find.byType(ExamItemAddButton), findsOneWidget);
      expect(find.byType(PatientTestZeroState), findsOneWidget);
    });

    testWidgets('should show loading indicator when fetching tests',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          200,
        ),
      );

      await buildTestWidget(
        graphQlClient: mockShortSILGraphQlClient,
        tester: tester,
        widget: const PatientExamTests(
          recordedDiagnosis: 'Diabetes Mellitus',
          recordedDiagnosisID: '9db28c1f-259f-4d74-918e-f84975c33005',
        ),
      );

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}

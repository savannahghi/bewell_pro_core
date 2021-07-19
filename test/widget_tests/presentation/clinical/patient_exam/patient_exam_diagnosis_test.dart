import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/diagnosis/patient_diagnosis_table.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:shared_themes/constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/quick_access_item_modal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Patient_exam_diagnosis', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    const String recordedDiagnosis = 'Mal de Ojo';

    testWidgets(
        'Patient exam diagnosis exapnsion tile expands and collapses correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: const PatientDiagnosisTable());

      await tester.pump();

      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.text(recordedDiagnosis), findsOneWidget);
      expect(find.text(tapToViewLess), findsOneWidget);

      // tap the expansion tile to close it
      await tester.tap(find.text(recordedDiagnosis));
      await tester.pump();

      // assert it is closed
      expect(find.text(tapToOrderTests), findsOneWidget);

      // tap the expansion tile to open it
      await tester.tap(find.text(recordedDiagnosis));
      await tester.pump();

      // assert it is open
      expect(find.text(tapToViewLess), findsOneWidget);
    });

    testWidgets(
        'patient exam diagnosis renders correctly in smallScreen and isExpanded == false and enter retire reason',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: const PatientDiagnosisTable());

      await tester.pump();

      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.byType(ListBody), findsOneWidget);
      expect(find.byType(ExpansionTile), findsOneWidget);
      expect(find.text(recordedDiagnosis), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retirePatientExamDiagnosisKey),
          findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retirePatientExamDiagnosisKey));
      await tester.pumpAndSettle();

      expect(find.text(recordedDiagnosis), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(diagnosisRetired), findsOneWidget);
    });

    testWidgets(
        'patient exam diagnosis renders correctly in largeScreen and isExpanded == True',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
          tester: tester, store: store, widget: const PatientDiagnosisTable());

      await tester.pumpAndSettle();
      expect(find.byKey(AppWidgetKeys.retirePatientExamDiagnosisKey),
          findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.retirePatientExamDiagnosisKey));
      await tester.pumpAndSettle();
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.pumpAndSettle();

      expect(find.text('Because i am testing'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      expect(find.byType(SnackBar), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should display error snackbar when result and updateFHIR condition are null',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'updateFHIRCondition': null,
              'searchFHIRCondition': <String, dynamic>{
                'edges': <dynamic>[
                  <String, dynamic>{'node': patientExamDiagnosisData}
                ],
              },
            },
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const PatientDiagnosisTable(),
        graphQlClient: mockSILGraphQlClient,
      );

      await tester.pump();

      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.byType(ListBody), findsOneWidget);
      expect(find.byType(ExpansionTile), findsOneWidget);
      expect(find.text(recordedDiagnosis), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retirePatientExamDiagnosisKey),
          findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retirePatientExamDiagnosisKey));
      await tester.pumpAndSettle();

      expect(find.text(recordedDiagnosis), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
    });

    testWidgets(
        'should render zero state widget and quick access items when edges are null ',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRCondition': <String, dynamic>{'edges': null},
            },
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const PatientDiagnosisTable(),
        graphQlClient: mockSILGraphQlClient,
      );

      await tester.pump();
      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      expect(find.byType(QuickAccessItemModal), findsWidgets);
    });

    testWidgets('should render SILLoading when data is null ',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{'data': null}),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const PatientDiagnosisTable(),
        graphQlClient: mockSILGraphQlClient,
      );

      await tester.pump(Duration.zero);
      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
    });

    testWidgets('should render SILLoader when fetching diagnoses',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockSILGraphQlClient =
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
        tester: tester,
        store: store,
        widget: const PatientDiagnosisTable(),
        graphQlClient: mockSILGraphQlClient,
      );

      await tester.pump(Duration.zero);
      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets(
        'should render zero state widget and quick access items when patient diagnosis is null ',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRCondition': <String, dynamic>{
                'edges': <dynamic>[
                  <String, dynamic>{'node': patientDiagnosisEmpty}
                ],
              },
            },
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const PatientDiagnosisTable(),
        graphQlClient: mockSILGraphQlClient,
      );

      await tester.pump(Duration.zero);
      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      expect(find.byType(QuickAccessItemModal), findsWidgets);
    });

    testWidgets('should display tap to order test text when isExpanded== false',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: const PatientDiagnosisTable());

      await tester.pumpAndSettle();
      expect(find.byType(PatientDiagnosisTable), findsOneWidget);

      expect(find.text(tapToViewLess), findsOneWidget);
    });
  });
}

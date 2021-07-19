import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint_item_large.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint_item_small.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint_zero_state.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Chief complaint', () {
    setUpAll(() async {
      startMockVisitAndExam();
    });

    Store<AppState> store;

    final AppState state = AppState.initial();
    store = Store<AppState>(initialState: state);

    const String problem = 'Mal de Ojo';
    const String recorder = 'Jane Doe';
    const String recordedDate = 'Date: 3 Feb, 2021';
    const String clinicalStatus = 'Active';

    /// Small screen interactions
    testWidgets('should add a problem and retire on a small screen device',
        (WidgetTester tester) async {
      await buildTestWidget(
          store: store, tester: tester, widget: ChiefComplaint());
      await tester.pump();

      // Verify that the UI renders correctly
      expect(find.byType(ChiefComplaint), findsOneWidget);
      expect(find.text(chiefComplaint), findsOneWidget);
      expect(find.text(problem), findsOneWidget);
      expect(find.text(recorder), findsOneWidget);
      expect(find.text(recordedDate), findsOneWidget);
      expect(find.text(clinicalStatus), findsOneWidget);

      // The only verification we will have that this is a small screen device
      expect(find.byType(ChiefComplaintItemSmall), findsOneWidget);

      // Tap the retire button
      await tester
          .tap(find.byKey(AppWidgetKeys.retireChiefComplaintSmallButtonKey));
      await tester.pumpAndSettle();

      // Verify the retire dialog is shown
      expect(find.text(problem), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      // Tap the cancel button
      await tester.tap(find.byKey(AppWidgetKeys.retireCancelButtonKey));
      await tester.pumpAndSettle();

      // Verify retire dialog was closed
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);

      // Tap the retire button again
      await tester
          .tap(find.byKey(AppWidgetKeys.retireChiefComplaintSmallButtonKey));
      await tester.pumpAndSettle();

      // Verify the retire dialog is shown
      expect(find.text(problem), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      // Verify retire reason validation
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('A reason is required'), findsOneWidget);

      // Enter retire reason
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'cured');
      await tester.pumpAndSettle();

      // Tap the retire button
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      // Verify the dialog was closed and that the user was notified
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Chief complaint retired successfully'), findsOneWidget);
    });

    /// Large screen interactions
    testWidgets('should add a problem and retire on a large screen device',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
          store: store, tester: tester, widget: ChiefComplaint());
      await tester.pump();

      // Verify that the UI renders correctly
      expect(find.byType(ChiefComplaint), findsOneWidget);
      expect(find.text(chiefComplaint), findsOneWidget);
      expect(find.text(problem), findsOneWidget);
      expect(find.text(recorder), findsOneWidget);
      expect(find.text(recordedDate), findsOneWidget);
      expect(find.text(clinicalStatus), findsOneWidget);

      // The only verification we will have that this is a large screen device
      expect(find.byType(ChiefComplaintItemLarge), findsOneWidget);

      // Tap the retire button
      await tester
          .tap(find.byKey(AppWidgetKeys.retireChiefComplaintLargeButtonKey));
      await tester.pumpAndSettle();

      // Verify the retire dialog is shown
      expect(find.text(problem), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      // Tap the cancel button
      await tester.tap(find.byKey(AppWidgetKeys.retireCancelButtonKey));
      await tester.pumpAndSettle();

      // Verify retire dialog was closed
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);

      // Tap the retire button again
      await tester
          .tap(find.byKey(AppWidgetKeys.retireChiefComplaintLargeButtonKey));
      await tester.pumpAndSettle();

      // Verify the retire dialog is shown
      expect(find.text(problem), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      // Verify retire reason validation
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('A reason is required'), findsOneWidget);

      // Enter retire reason
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'cured');
      await tester.pumpAndSettle();

      // Tap the retire button
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      // Verify the dialog was closed and that the user was notified
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Chief complaint retired successfully'), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should show chief complaint zero state when there are no conditions',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient _mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRCondition': <String, dynamic>{'edges': null}
              },
            }),
            200),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: ChiefComplaint(),
        graphQlClient: _mockSILGraphQlClient,
      );

      await tester.pump();

      expect(find.byType(ChiefComplaintZeroState), findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsOneWidget);
    });

    testWidgets(
        'should display an error message when there is a problem getting the'
        ' chief complaint', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{'error': 'error'},
            ),
            400),
      );

      await buildTestWidget(
          store: store,
          tester: tester,
          widget: ChiefComplaint(),
          graphQlClient: mockShortSILGraphQlClient);
      await tester.pump();

      expect(find.text(errorOccurred), findsOneWidget);
    });

    testWidgets(
        'should show SILPlatformLoader when fetching a chief complaint ',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'loading': true}
              },
            ),
            201),
      );

      await buildTestWidget(
          store: store,
          tester: tester,
          widget: ChiefComplaint(),
          graphQlClient: mockSILGraphQlClient);
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('should only show active chief complaints',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient _mockSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(inactiveChiefComplaintMock), 200),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: ChiefComplaint(),
        graphQlClient: _mockSILGraphQlClient,
      );

      await tester.pump();

      expect(find.byType(ChiefComplaintZeroState), findsOneWidget);
    });
  });
}

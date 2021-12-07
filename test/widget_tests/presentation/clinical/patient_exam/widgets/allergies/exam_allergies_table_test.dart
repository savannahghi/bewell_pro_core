// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/allergies/exam_allergies_table.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());

  const String recordingDoctor = 'L B';
  const String clinicalStatus = 'Active';

  setUpAll(() {
    startMockVisitAndExam();
  });

  group('Patient exam allergies', () {
    testWidgets('renders correctly on a small screen',
        (WidgetTester tester) async {
      ViewSummaryStore().viewSummaryButton.add(true);

      await buildTestWidget(
          tester: tester, store: store, widget: ExamAllergiesTable());

      await tester.pump();

      expect(find.byType(GenericZeroStateWidget), findsNothing);
      expect(find.text(clinicalStatus), findsOneWidget);
      expect(find.text(recordingDoctor), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireAllergySmallScreenButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.retireAllergySmallScreenButtonKey));
      await tester.pumpAndSettle();

      //Find the retire modal
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      //Enter reason to retire the allergy
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);
    });

    testWidgets('renders correctly on a large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      ViewSummaryStore().viewSummaryButton.add(true);
      await buildTestWidget(
          tester: tester, store: store, widget: ExamAllergiesTable());

      await tester.pumpAndSettle();
      expect(find.byType(GenericZeroStateWidget), findsNothing);
      expect(find.text(clinicalStatus), findsOneWidget);
      expect(find.text(recordingDoctor), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireAllergyLargeScreenButtonKey),
          findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.retireAllergyLargeScreenButtonKey));
      await tester.pumpAndSettle();

      //Find the retire modal
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      //Enter reason to retire the allergy
      await tester.enterText(find.byKey(AppWidgetKeys.retireReasonFormField),
          'Because i am testing');
      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('shows a Zero state widget when the data is null',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'searchFHIRAllergyIntolerance': null}
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ExamAllergiesTable(),
        graphQlClient: mockGraphQlClient,
      );
      await tester.pump();

      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
    });

    testWidgets('shows a loading indicator when data is loading',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
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
        widget: ExamAllergiesTable(),
        graphQlClient: mockGraphQlClient,
      );

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}

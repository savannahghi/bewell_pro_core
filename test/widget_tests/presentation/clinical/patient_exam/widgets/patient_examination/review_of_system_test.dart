import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/widgets/quick_access_item_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_system_title_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems_item_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/symptom_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:http/http.dart' as http;

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('ReviewOfSystemWidget', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets(
        'should display quick access items and a zero state widget '
        ' when data is null', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRComposition': <String, dynamic>{}
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const ReviewOfSystems(),
      );

      // verify ZeroState widget is rendered & data == null
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      expect(find.text('Add Review of Systems'), findsOneWidget);
      expect(find.text('Perform a review of systems exam on the patient'),
          findsOneWidget);
    });

    testWidgets('should refresh when refresh controller is triggered',
        (WidgetTester tester) async {
      final ExamChangeObject examChangeObject = ExamChangeObject();
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const ReviewOfSystems(),
      );
      await tester.pumpAndSettle();
      examChangeObject.reviewOfSystemsChangeListener.add(true);
      expect(find.byType(ReviewOfSystems), findsOneWidget);
    });

    testWidgets('should display quick access items and open a drawer',
        (WidgetTester tester) async {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      final Finder respiratoryFinder =
          find.widgetWithText(QuickAccessItemWidget, 'Respiratory');
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) => Scaffold(
            key: scaffoldKey,
            body: const ReviewOfSystems(),
          ),
        ),
      );

      await tester.pump();

      // verify UI renders correctly
      expect(find.byType(ReviewOfSystems), findsOneWidget);
      expect(respiratoryFinder, findsOneWidget);

      //tap the respiratory quick access item
      await tester.tap(respiratoryFinder);
      await tester.pumpAndSettle();

      // verify drawer is opened correctly
      expect(find.text('Cough'), findsOneWidget);
    });
    testWidgets(
        'should display respiratory review section when a composition '
        'with a respiratory review of system present is returned from '
        'the backend', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const ReviewOfSystems(),
      );

      await tester.pump();

      // verify data != null || data is Map
      expect(find.text('Add Review of Systems'), findsNothing);
      expect(find.text('Perform a review of systems exam on the patient'),
          findsNothing);

      // we expect all quick access items to be present
      expect(find.text('Review of Systems'), findsOneWidget);
      expect(find.text('Quick Access'), findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Respiratory'),
          findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Peripheral Vascular'),
          findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Gastrointestinal'),
          findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Urinary'),
          findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Neurologic'),
          findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Hematologic'),
          findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Cardiac'),
          findsOneWidget);
      expect(
          find.widgetWithText(QuickAccessItemWidget, 'HEENT'), findsOneWidget);
      expect(
          find.widgetWithText(QuickAccessItemWidget, 'HEENT2'), findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'GI'), findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'GU'), findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'MS'), findsOneWidget);
      expect(
          find.widgetWithText(QuickAccessItemWidget, 'Skin'), findsOneWidget);
      expect(find.widgetWithText(QuickAccessItemWidget, 'Psychiatric'),
          findsOneWidget);

      // verify the respiratory container is present with all components
      expect(find.byType(ReviewOfSystemsItemWidget), findsOneWidget);
      expect(find.byType(ReviewOfSystemTitleBar), findsOneWidget);

      // verify that the valid symptoms are shown and the rest hidden
      expect(find.byType(SymptomWidget), findsNWidgets(2));

      // the shown symptoms
      expect(find.text('Cough'), findsOneWidget);
      expect(find.text('Congest'), findsOneWidget);

      // the hidden symptoms
      expect(find.text('Sob'), findsNothing);
      expect(find.text('Haemoptysis'), findsNothing);
    });
  });
}

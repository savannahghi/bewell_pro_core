// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_timeline.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/load_more_timeline_records.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_record.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('BeWellPatientTimeline', () {
    late Store<CoreState> store;

    setUp(() {
      startMockVisitAndExam();

      store = Store<CoreState>(initialState: CoreState.initial());
      TimelineInfoObject().reset();
    });

    testWidgets(
        'should display number of visits and patient visits details when showAll is true ',
        (WidgetTester tester) async {
      TimelineInfoObject().showAll.add(true);

      await buildTestWidget(
          widget: BeWellPatientTimeline(), store: store, tester: tester);

      await tester.pumpAndSettle();

      expect(find.text(patientTimelineText), findsOneWidget);
      expect(TimelineInfoObject().visits.value.length, equals(7));

      expect(find.byType(LoadMoreTimelineRecords), findsOneWidget);
      await tester.pump();

      expect(find.text('Showing 7 visits'), findsOneWidget);
      expect(find.byType(BeWellPatientTimeline), findsOneWidget);

      await tester.tap(find.text('Load More'));
    });

    testWidgets('should display zero state widget when data is null',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, dynamic>{'data': null}), 200));

      await buildTestWidget(
        widget: BeWellPatientTimeline(),
        store: store,
        tester: tester,
        graphQlClient: mockGraphQlClient,
      );

      await tester.pump();

      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      expect(find.text(noVisits), findsOneWidget);
    });

    testWidgets('should display SILLoader before data is displayed',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{
                    'data': <String, dynamic>{
                      'loading': true,
                      'patientTimelineWithCount': <dynamic>[],
                    },
                  }),
                  200));

      await buildTestWidget(
          widget: BeWellPatientTimeline(),
          store: store,
          tester: tester,
          graphQlClient: mockGraphQlClient);
      await tester.pump();
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('should display zero state widget when visits are zero ',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'patientTimelineWithCount': <dynamic>[],
              },
            }),
            200),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: BeWellPatientTimeline());

      await tester.pump();

      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
      expect(find.text(noVisits), findsOneWidget);
    });

    testWidgets(
        'should display number of visits when visits are not empty and showAll is false ',
        (WidgetTester tester) async {
      TimelineInfoObject().visits.value.add(testTimelineVisitsData);

      await buildTestWidget(
          widget: BeWellPatientTimeline(), store: store, tester: tester);
      await tester.pump();

      expect(find.text(patientTimelineText), findsOneWidget);
      expect(TimelineInfoObject().visits.value.length, equals(7));
    });

    testWidgets(
        'should display number of visits in largeScreen when visits are not empty and showAll is false ',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      TimelineInfoObject().visits.value.add(testTimelineVisitsData);

      await buildTestWidget(
          widget: BeWellPatientTimeline(), store: store, tester: tester);
      await tester.pump();

      expect(find.text(patientTimelineText), findsOneWidget);
      expect(TimelineInfoObject().visits.value.length, equals(7));

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should display number of visits and patient visits details when visits are not empty and showAll is true ',
        (WidgetTester tester) async {
      TimelineInfoObject().visits.value.add(testTimelineVisitsData);
      TimelineInfoObject().showAll.add(true);

      await buildTestWidget(
          widget: BeWellPatientTimeline(), store: store, tester: tester);
      await tester.pump();

      expect(find.text(patientTimelineText), findsOneWidget);
      expect(TimelineInfoObject().visits.value.length, equals(7));

      expect(find.byType(PatientTimelineRecord), findsWidgets);
      TimelineInfoObject().showAll.add(false);
    });

    testWidgets('should display error message when snapshot has an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{
                    'error': 'not found',
                  }),
                  201));

      await buildTestWidget(
          widget: BeWellPatientTimeline(),
          store: store,
          tester: tester,
          graphQlClient: mockGraphQlClient);
      await tester.pump();

      expect(find.text(errorOccurred), findsOneWidget);
    });

    testWidgets('should display all the items in allergy resource',
        (WidgetTester tester) async {
      TimelineInfoObject().reset();
      const String substance = 'Egg yolk phosphatides';
      const String reaction = 'very bad';
      const String severity = 'Severe';
      const String note = 'very bad';

      await buildTestWidget(
          tester: tester,
          widget: PatientTimelineRecord(visit: testPatientVisitAllergy));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.text(reaction), findsOneWidget);
      expect(find.text(severity), findsOneWidget);
      expect(find.text(note), findsOneWidget);
      expect(find.text(substance), findsOneWidget);
    });

    testWidgets('should display all the items in medication resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';

      const String medication = 'Amoxicillin monosodium salt';
      const String medicationStatus = 'Active';

      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientVisitMedication),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.text(medication), findsOneWidget);
      expect(find.text(medicationStatus), findsOneWidget);
    });

    testWidgets(
        'should display container when medication is null medication resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';

      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientVisitMedication),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets(
        'should display all items in service request in service request item resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';
      const String request = 'Laboratory procedure';
      const String display = 'Fasting glucose [Moles/volume] in Blood';
      const String status = 'Active';

      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientVisitServiceRequest),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.text(request), findsOneWidget);
      expect(find.text(display), findsOneWidget);
      expect(find.text(status), findsOneWidget);
    });

    testWidgets(
        'should display container when display is null service request item resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';

      await buildTestWidget(
          widget: PatientTimelineRecord(
              visit: testPatientVisitServiceRequestNullDisplay),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets(
        'should display all items in observation in observation item resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';

      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientVisitObservation),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.timelineObservationItemsSizedBoxKey),
          findsOneWidget);
    });

    testWidgets(
        'should display all items in condition in condition item resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';
      const String condition = 'Adverse reaction to flu shot';
      const String status = 'Active';

      await buildTestWidget(
          tester: tester,
          widget: PatientTimelineRecord(visit: testPatientVisitCondition));

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.text(condition), findsOneWidget);
      expect(find.text(status), findsOneWidget);
    });

    testWidgets(
        'should display container when display is null condition item resource',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';

      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientVisitNullCondition),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('should display container when an empty response is used',
        (WidgetTester tester) async {
      const String startDate = 'Started on Wed, 3 February, 2021';

      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientEmptyResponses),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.text(startDate), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets(
        'should display a sized box for each resource item when resource items are null or empty',
        (WidgetTester tester) async {
      await buildTestWidget(
          widget: PatientTimelineRecord(visit: testPatientEmptyResponses),
          store: store,
          tester: tester);
      await tester.pump();

      expect(find.byType(PatientTimelineRecord), findsOneWidget);

      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/pages/patient_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_timeline.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/load_more_timeline_records.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_record.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_continue_exam_banner.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('patient_timeline', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(
            clinicalState: ClinicalState(
          patientPayload: PatientPayload(
            patientRecord: Patient(
              name: <HumanName>[HumanName(text: 'Doe John')],
              telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
              gender: PatientGenderEnum.male,
            ),
          ),
        )),
      );
    });

    testWidgets(
        'StartOrContinueExamBanner widget renders correctly when should continue visit is false',
        (WidgetTester tester) async {
      startMockVisitAndExam();

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: const StartOrContinueExamBanner(
            patientName: 'patient name',
            isChecking: false,
            shouldContinueExam: false,
          ),
        );

        expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
            findsOneWidget);
        await tester
            .tap(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(StartOrContinueExamBanner), findsNothing);
        expect(find.byType(PatientExam), findsOneWidget);
      });
    });

    testWidgets(
        'StartOrContinueExamBanner widget renders correctly on a small screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalPhoneScreenSizePortrait;
      startMockVisitAndExam();

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const StartOrContinueExamBanner(
          patientName: 'patient name',
          isChecking: false,
          shouldContinueExam: false,
        ),
      );

      expect(find.byKey(AppWidgetKeys.patientTimelineImageContainer),
          findsNothing);
      expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
          findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'StartOrContinueExamBanner widget renders correctly in large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      startMockVisitAndExam();
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const StartOrContinueExamBanner(
          patientName: 'patient name',
          isChecking: false,
          shouldContinueExam: false,
        ),
      );

      expect(find.byKey(AppWidgetKeys.patientTimelineImageContainer),
          findsOneWidget);
      expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
          findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });

      expect(
          find.text('Start a patient\'s'
              ' exam by tapping on the Start Exam button'),
          findsOneWidget);
    });

    testWidgets(
        'StartContinueExamWrapper widget renders correctly when should continue is == true',
        (WidgetTester tester) async {
      startMockVisitAndExam();
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const StartOrContinueExamBanner(
          patientName: 'patient name',
          isChecking: false,
          shouldContinueExam: true,
        ),
      );

      expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(StartOrContinueExamBanner), findsNothing);
      expect(find.byType(PatientExam), findsOneWidget);
    });

    testWidgets(
        'bewellPatientTimeline widget renders correctly on small screen ',
        (WidgetTester tester) async {
      startMockVisitAndExam();

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: BeWellPatientTimeline());

      TimelineInfoObject()
        ..showAll.add(false)
        ..patientsWithGrantedAccess.add('4b179736-f31a-4c55-986c-0c0785717748')
        ..visits.add(mockPatientVisits);

      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(PatientTimelineRecord), findsOneWidget);
      expect(find.byType(LoadMoreTimelineRecords), findsNothing);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byKey(AppWidgetKeys.toggleExpandRecordKey), findsOneWidget);

      // toggle expand of a record
      await tester.tap(find.byKey(AppWidgetKeys.toggleExpandRecordKey));
      await tester.pump();

      // verify ui renders correctly
      expect(
          find.byKey(AppWidgetKeys.patientTimelineRecordKey), findsOneWidget);
    });

    testWidgets(
        'bewellPatientTimeline widget renders correctly on large screen ',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      startMockVisitAndExam();

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: BeWellPatientTimeline());

      TimelineInfoObject()
        ..showAll.add(false)
        ..patientsWithGrantedAccess.add('4b179736-f31a-4c55-986c-0c0785717748')
        ..visits.add(mockPatientVisits);

      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(PatientTimelineRecord), findsOneWidget);
      expect(find.byType(LoadMoreTimelineRecords), findsNothing);
      expect(find.byType(SingleChildScrollView), findsWidgets);

      // toggle expand of a record
      await tester.tap(find.byKey(AppWidgetKeys.toggleExpandRecordKey));
      await tester.pump();

      // verify ui renders correctly
      expect(
          find.byKey(AppWidgetKeys.patientTimelineRecordKey), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

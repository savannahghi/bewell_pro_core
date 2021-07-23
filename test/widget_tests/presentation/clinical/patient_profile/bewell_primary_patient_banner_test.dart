import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/increment_user_visit_count_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/attachment.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/end_visit_dialogue_content.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_banner_bio_info.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/rating.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'package:shared_ui_components/buttons.dart';
import 'package:http/http.dart' as http;

import '../../../../mocks/base64_image.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('patient banner', () {
    late Store<CoreState> store;

    const String patientName = 'Be Well';
    const String ageSmallScreen = 'Age: 18 yrs';

    final DateTime now = DateTime.now();
    final DateTime eighteenYears = DateTime(now.year - 18, now.month, now.day);
    final Patient patientRecord = Patient(
      name: <HumanName>[HumanName(text: patientName)],
      telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
      gender: PatientGenderEnum.male,
      birthDate: eighteenYears.toIso8601String(),
    );

    setUp(() {
      store = Store<CoreState>(
        initialState: CoreState.initial().copyWith(
          clinicalState: ClinicalState(
            patientPayload: PatientPayload(
              patientRecord: patientRecord,
            ),
          ),
        ),
      );

      startMockVisitAndExam();
    });

    tearDown(() {
      TimelineInfoObject().reset();
    });

    testWidgets(
        'should display error message when endVisit = failed_end_visit on small screen',
        (WidgetTester tester) async {
      PrimaryBannerInfoObject().reset();

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'endEpisode': false,
                  'problemSummary': <String>[
                    'Fish poisoning',
                    'Sea Sickness',
                    'ALLERGY TO PENICILLIN',
                    'Malignant neoplasm of skin',
                    'Skin Sinus'
                  ],
                  'allergySummary': <String>[
                    'CUTTLE FISH INK',
                    'PLACEBO (SUBSTANCE)'
                  ]
                },
              },
            ),
            200),
      );

      TimelineInfoObject().visits.add(testTimelineVisitsData);

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: BeWellPrimaryPatientBanner(),
      );

      await tester.pump();

      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(PatientBannerBioInfo), findsOneWidget);

      expect(find.text(patientName), findsOneWidget);
      expect(find.text(ageSmallScreen), findsOneWidget);
      expect(find.text('Male'), findsOneWidget);

      final Finder button = find.byType(SILPrimaryButton);

      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(SimpleDialog), findsOneWidget);
      expect(find.byType(EndVisitDialogueContent), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.confirmEndVisitKey));
      await tester.pumpAndSettle();
    });

    testWidgets('should display message when end visit is cancelled',
        (WidgetTester tester) async {
      TimelineInfoObject().visits.add(testTimelineVisitsData);

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: BeWellPrimaryPatientBanner(),
      );

      await tester.pump();

      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(PatientBannerBioInfo), findsOneWidget);

      expect(find.text(patientName), findsOneWidget);
      expect(find.text(ageSmallScreen), findsOneWidget);
      expect(find.text('Male'), findsOneWidget);

      final Finder button = find.byType(SILPrimaryButton);

      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(SimpleDialog), findsOneWidget);
      expect(find.byType(EndVisitDialogueContent), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.cancelEndVisitKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'should navigate to patient registration page when visits are less than 10',
        (WidgetTester tester) async {
      PrimaryBannerInfoObject().patientBannerChangeListener.add(true);
      TimelineInfoObject().visits.add(testTimelineVisitsData);

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: BeWellPrimaryPatientBanner(),
        );

        await tester.pump();

        expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
        expect(find.byType(PatientBannerBioInfo), findsOneWidget);

        expect(find.text(patientName), findsOneWidget);
        expect(find.text(ageSmallScreen), findsOneWidget);
        expect(find.text('Male'), findsOneWidget);

        final Finder button = find.byType(SILPrimaryButton);

        expect(button, findsOneWidget);

        await tester.tap(button);
        await tester.pump();

        expect(find.byType(SimpleDialog), findsOneWidget);
        expect(find.byType(EndVisitDialogueContent), findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.confirmEndVisitKey));
        await tester.pumpAndSettle();
      });
    });

    testWidgets(
        'should indicate in the UI when there are no known '
        ' problems and allergies', (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'endEpisode': false,
                'problemSummary': <dynamic>[],
                'allergySummary': <dynamic>[]
              },
            },
          ),
          200,
        ),
      );

      TimelineInfoObject().visits.add(testTimelineVisitsData);

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: BeWellPrimaryPatientBanner(),
      );

      await tester.pump();

      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(PatientBannerBioInfo), findsOneWidget);

      expect(find.text('No known conditions'), findsOneWidget);
      expect(find.text('No known allergies'), findsOneWidget);
    });

    testWidgets('should navigate to survey page when visits = 10',
        (WidgetTester tester) async {
      TimelineInfoObject().visits.add(testTimelineVisitsData);

      final Store<CoreState> localStore = Store<CoreState>(
        initialState: store.state.copyWith(
          userState: UserState(auth: AuthCredentialResponse()),
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              bottomBarSelectedIndex: 0,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData),
          miscState: MiscState(visitCount: '10'),
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: localStore,
          widget: BeWellPrimaryPatientBanner(),
        );

        expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
        expect(find.byType(PatientBannerBioInfo), findsOneWidget);

        expect(find.text(patientName), findsOneWidget);
        expect(find.text(ageSmallScreen), findsOneWidget);
        expect(find.text('Male'), findsOneWidget);

        final Finder button = find.byType(SILPrimaryButton);

        expect(button, findsOneWidget);

        await tester.tap(button);
        await tester.pumpAndSettle();

        expect(find.byType(SimpleDialog), findsOneWidget);
        expect(find.byType(EndVisitDialogueContent), findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.confirmEndVisitKey));
        await tester.pumpAndSettle();

        expect(find.byType(Rating), findsOneWidget);
      });
    });

    testWidgets(
        'HCPatientBanner should render correctly  on large screen and'
        ' navigate to confirm survey page when end visit is confirmed',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        tester.binding.window.physicalSizeTestValue = tabletLandscape;
        TimelineInfoObject().visits.add(testTimelineVisitsData);

        for (int counter = 1; counter <= 10; counter++) {
          store.dispatch(IncrementUserVisitCountAction());
        }

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: BeWellPrimaryPatientBanner(),
        );

        expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.byType(PatientBannerBioInfo), findsOneWidget);

        expect(find.text(patientName), findsOneWidget);

        final Finder button = find.byType(SILPrimaryButton);

        expect(button, findsOneWidget);

        await tester.tap(button);
        await tester.pumpAndSettle();

        expect(find.byType(SimpleDialog), findsOneWidget);
        expect(find.byType(EndVisitDialogueContent), findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.confirmEndVisitKey));
        await tester.pumpAndSettle();

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });

    testWidgets('should show image if image data is not null on a large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final Store<CoreState> localStore = Store<CoreState>(
        initialState: store.state.copyWith(
          clinicalState: store.state.clinicalState?.copyWith(
            patientPayload: PatientPayload(
              patientRecord: patientRecord.copyWith(
                photo: <Attachment>[Attachment(data: mockBase64Image)],
              ),
            ),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: localStore,
        widget: BeWellPrimaryPatientBanner(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CircleAvatar), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

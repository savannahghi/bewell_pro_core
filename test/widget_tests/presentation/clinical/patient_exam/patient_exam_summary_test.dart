// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/patient_exam_summary.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/sign_off_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PatientExamSummary', () {
    late Store<CoreState> store;

    setUp(() {
      final UserState userState = UserState.initial().copyWith(
        userProfile: UserProfile.initial().copyWith(
          primaryEmailAddress: testEmailAddress,
          primaryPhoneNumber: testPhoneNumber,
        ),
      );

      final ClinicalState clinicalState = ClinicalState(
        patientPayload: PatientPayload(
          patientRecord: Patient(
            name: <HumanName>[HumanName(text: 'Doe John')],
            telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
            gender: PatientGenderEnum.male,
          ),
        ),
      );

      store = Store<CoreState>(
        initialState: CoreState.initial().copyWith(
          userState: userState,
          clinicalState: clinicalState,
        ),
      );

      startMockVisitAndExam();
    });

    testWidgets(' renders correctly and works correctly',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientExamSummary(),
        );

        await tester.pump();
        expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
        expect(find.byType(SignOffExam), findsOneWidget);
      });

      AppBrand().appLogo.add('');
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'loading': true,
                },
              },
            ),
            201),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientExamSummary(),
          graphQlClient: mockGraphQlClient);

      await tester.pump();
      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(SignOffExam), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsWidgets);

      AppBrand().appLogo.add('');
    });

    testWidgets('should return serviceRequests', (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              patientExamSummaryMock,
            ),
            201),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientExamSummary(),
          graphQlClient: mockGraphQlClient);

      await tester.pumpAndSettle();

      ExamChangeObject().onAddMedicationListener.add(true);
      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(SignOffExam), findsOneWidget);
      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(find.byType(PatientTimelineDividerWidget), findsOneWidget);

      AppBrand().appLogo.add('');
    });

    testWidgets('should render GenericZeroStateWidget',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              patientExamSummaryEmptyConditionsMock,
            ),
            201),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientExamSummary(),
          graphQlClient: mockGraphQlClient);

      await tester.pumpAndSettle();
      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(SignOffExam), findsOneWidget);
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);

      AppBrand().appLogo.add('');
    });
  });
}

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/send_otp_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/bewell_patient_profile_connector.dart';
import '../../../../mocks/mock_redux_actions.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('BewellPatientProfileConnector', () {
    testWidgets('should start visit on click', (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);
      startMockVisitAndExam();

      const String testPhoneNumber = '+254798000000';

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState.initial().copyWith(
          clinicalState: ClinicalState(
            patientPayload: PatientPayload(
              patientRecord: Patient(
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: testPhoneNumber,
                    system: ContactPointSystemEnum.phone,
                  )
                ],
                name: <HumanName>[HumanName(text: 'Doe John')],
                gender: PatientGenderEnum.male,
              ),
            ),
          ),
        ),
        mocks: <Type, dynamic>{SendOTPAction: MockSendOTPAction()},
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          store: mockStore,
          tester: tester,
          widget: const BewellPatientProfileConnector(),
        );
        await tester.pumpAndSettle();

        expect(
            find.byKey(AppWidgetKeys.requestAccessVisitsKey), findsOneWidget);

        await tester.tap(find.text(requestAccessToPastVisitString));
        await tester.pumpAndSettle();

        final Finder requestAccessBtn =
            find.byKey(AppWidgetKeys.requestAccessKey);
        expect(requestAccessBtn, findsOneWidget);

        await tester.tap(requestAccessBtn);
        await tester.pumpAndSettle();

        expect(mockStore.state.clinicalState?.startVisitType,
            StartVisitType.requestAccess);
        AppBrand().appLogo.add('');
      });
    });
  });
}

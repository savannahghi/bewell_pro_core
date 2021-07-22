import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/save_patient_record_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/send_otp_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/complete_registration_page/complete_registration_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:http/http.dart' as http;
import 'package:domain_objects/src/entities/user_profile.dart';
import 'package:domain_objects/src/value_objects/phone_number.dart';
import 'package:flutter_graphql_client/graph_client.dart';

import '../../../../../mocks/mock_redux_actions.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('CompleteRegistrationConnector', () {
    late MockStore<AppState> mockStore;

    const String phoneNumber = '0712345678';
    const String patientID = 'some_unique_id';
    const String providerPhone = '0787654321';

    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, String>{'data': 'some data'}),
        200,
      ),
    );

    final PatientEdge patientEdge = PatientEdge(
      cursor: 'cursor',
      node: Patient(
        id: patientID,
        telecom: <ContactPoint>[
          ContactPoint(
            value: phoneNumber,
            system: ContactPointSystemEnum.phone,
          ),
        ],
      ),
      hasOpenEpisodes: false,
    );

    final PatientRegistrationContainer patientRegistrationContainer =
        PatientRegistrationContainer(
      tabController: TabController(length: 4, vsync: const TestVSync()),
      child: const CompleteRegistrationPage(),
    );

    setUp(() {
      mockStore = MockStore<AppState>(
        initialState: AppState.initial(),
        mocks: <Type, dynamic>{
          SendOTPAction: MockSendOTPAction(),
        },
      );

      mockStore.dispatch(SavePatientRecordAction(patientEdge: patientEdge));
    });

    testWidgets(
        'should successfully complete registration and start a visit by '
        'request access', (WidgetTester widgetTester) async {
      await buildTestWidget(
        tester: widgetTester,
        widget: patientRegistrationContainer,
        store: mockStore,
        graphQlClient: client,
      );

      final Finder startVisitBtn =
          find.byKey(AppWidgetKeys.completeRegistrationAndStartVisitKey);
      expect(startVisitBtn, findsOneWidget);

      await widgetTester.tap(startVisitBtn);
      await widgetTester.pumpAndSettle();

      final Finder requestAccessBtn =
          find.byKey(AppWidgetKeys.requestAccessKey);
      expect(requestAccessBtn, findsOneWidget);

      await widgetTester.tap(requestAccessBtn);
      await widgetTester.pumpAndSettle();

      expect(mockStore.dispatchCount, 5);

      expect(mockStore.state.clinicalState?.startVisitType,
          StartVisitType.requestAccess);
    });

    testWidgets(
        'successfully complete registration and start visit by request '
        'emergency override', (WidgetTester widgetTester) async {
      mockStore.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(providerPhone))));

      await buildTestWidget(
        tester: widgetTester,
        widget: patientRegistrationContainer,
        store: mockStore,
        graphQlClient: client,
      );

      final Finder startVisitBtn =
          find.byKey(AppWidgetKeys.completeRegistrationAndStartVisitKey);
      expect(startVisitBtn, findsOneWidget);

      await widgetTester.tap(startVisitBtn);
      await widgetTester.pumpAndSettle();

      final Finder requestAccessBtn =
          find.byKey(AppWidgetKeys.emergencyOverrideKey);
      expect(requestAccessBtn, findsOneWidget);

      await widgetTester.tap(requestAccessBtn);
      await widgetTester.pumpAndSettle();

      expect(mockStore.dispatchCount, 6);

      expect(mockStore.state.clinicalState?.startVisitType,
          StartVisitType.emergencyOverride);
    });

    testWidgets('successfully complete registration and save user records',
        (WidgetTester widgetTester) async {
      mockStore.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(providerPhone))));

      final PatientRegistrationContainer patientRegistrationContainer =
          PatientRegistrationContainer(
        tabController: TabController(length: 4, vsync: const TestVSync()),
        child: const CompleteRegistrationPage(),
      );

      final PatientPayload patientPayload = PatientPayload(
        hasOpenEpisodes: false,
        patientRecord: Patient(id: patientID),
      );

      patientRegistrationContainer.currentPatient.updatePatient(patientPayload);

      await buildTestWidget(
        tester: widgetTester,
        widget: patientRegistrationContainer,
        store: mockStore,
        graphQlClient: client,
      );

      final Finder startVisitBtn =
          find.byKey(AppWidgetKeys.completeRegistrationAndStartVisitKey);
      expect(startVisitBtn, findsOneWidget);

      await widgetTester.tap(startVisitBtn);
      await widgetTester.pumpAndSettle();

      final Finder requestAccessBtn =
          find.byKey(AppWidgetKeys.emergencyOverrideKey);
      expect(requestAccessBtn, findsOneWidget);

      await widgetTester.tap(requestAccessBtn);
      await widgetTester.pumpAndSettle();

      expect(mockStore.dispatchCount, 7);

      expect(mockStore.state.clinicalState?.startVisitType,
          StartVisitType.emergencyOverride);

      expect(mockStore.state.clinicalState?.patientPayload?.hasOpenEpisodes,
          false);
      expect(mockStore.state.clinicalState?.patientPayload?.patientRecord?.id,
          patientID);
    });
  });
}

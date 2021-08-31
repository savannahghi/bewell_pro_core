import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/save_patient_record_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_profile_widget.dart';
import 'package:http/http.dart' as http;

import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_continue_visit_connector.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:domain_objects/entities.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('StartContinueVisitConnector', () {
    final PatientEdge patientWithNoEpisodes = PatientEdge(
      cursor: 'cursor',
      node: Patient(
        id: 'some_unique_id_for_patient_record',
        telecom: <ContactPoint>[
          ContactPoint(
            value: testPhoneNumber.toString(),
            system: ContactPointSystemEnum.phone,
          ),
        ],
        name: <HumanName>[
          HumanName(text: 'bewell'),
        ],
        birthDate: '2021-01-01',
        gender: PatientGenderEnum.male,
      ),
      hasOpenEpisodes: false,
    );

    // This mock is used to both send OTPs and continue a visit
    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'generateOTP': '123456',
                'getPatient': <String, dynamic>{
                  'hasOpenEpisodes': true,
                  'openEpisodes': <dynamic>[
                    <String, dynamic>{'ID': 'some id'}
                  ]
                },
                'searchFHIRCondition': <String, dynamic>{'edges': null},
                'searchFHIRAllergyIntolerance': <String, dynamic>{
                  'edges': null
                },
                'patientTimelineWithCount': <dynamic>[],
              }
            },
          ),
          200),
    );

    final PatientEdge patientWithEpisodes =
        patientWithNoEpisodes.copyWith.call(hasOpenEpisodes: true);

    //finders
    final Finder startContButtonFinder = find.byType(SILPrimaryButton);
    final Finder startVisitTextFinder = find.text(startVisitText);
    final Finder continueVisitTextFinder = find.text(continueVisitText);

    final Finder requestAccessFinder = find.text(requestAccess);
    final Finder overrideBtnFinder =
        find.byKey(AppWidgetKeys.emergencyOverrideKey);
    final Finder accessBtnFinder = find.byKey(AppWidgetKeys.requestAccessKey);
    final Finder requestAccessBtnFinder =
        find.byKey(AppWidgetKeys.requestAccessKey);

    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('renders correctly when patient has no open episodes',
        (WidgetTester tester) async {
      store.dispatch(
          SavePatientRecordAction(patientEdge: patientWithNoEpisodes));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: client,
        widget: StartContinueVisitConnector(patientEdge: patientWithNoEpisodes),
      );

      // verify UI renders correctly
      expect(startContButtonFinder, findsOneWidget);
      expect(startVisitTextFinder, findsOneWidget);

      // tap start visit button
      await tester.tap(startContButtonFinder);
      await tester.pump();

      // verify modal is rendered correctly
      expect(requestAccessFinder, findsOneWidget);
      expect(overrideBtnFinder, findsOneWidget);
      expect(accessBtnFinder, findsOneWidget);
      expect(requestAccessBtnFinder, findsOneWidget);

      // tap request access button
      await tester.tap(requestAccessBtnFinder);
      await tester.pump();
    });

    testWidgets(
        'renders correctly when patient has no open episodes with emergency override',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateUserStateAction(
        userProfile: UserProfile(primaryPhoneNumber: testPhoneNumber),
      ));

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        store: store,
        widget: StartContinueVisitConnector(
          patientEdge: patientWithNoEpisodes,
        ),
      );

      // verify UI renders correctly
      expect(startContButtonFinder, findsOneWidget);
      expect(startVisitTextFinder, findsOneWidget);

      // tap start visit button
      await tester.tap(startContButtonFinder);
      await tester.pump();

      // verify modal is rendered correctly
      expect(requestAccessFinder, findsOneWidget);
      expect(overrideBtnFinder, findsOneWidget);
      expect(accessBtnFinder, findsOneWidget);
      expect(requestAccessBtnFinder, findsOneWidget);

      // tap emergency override button
      await tester.tap(overrideBtnFinder);
      await tester.pump();
    });

    testWidgets('continues a visit when patient has open episodes',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      store.dispatch(SavePatientRecordAction(patientEdge: patientWithEpisodes));

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          widget: StartContinueVisitConnector(
            patientEdge: patientWithEpisodes,
          ),
          graphQlClient: client,
        );

        // verify UI renders correctly
        expect(startContButtonFinder, findsOneWidget);
        expect(continueVisitTextFinder, findsOneWidget);

        // tap continue visit button
        await tester.tap(startContButtonFinder);
        await tester.pumpAndSettle();

        expect(find.byType(BewellPatientProfileWidget), findsOneWidget);
        AppBrand().appLogo.add('');
      });
    });
  });
}

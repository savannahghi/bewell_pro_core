import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/no_results_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_guide.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../../mocks/test_helpers.dart';

void main() {
  StoreTester.printDefaultDebugInfo = false;
  group('Patient search connector', () {
    testWidgets('when the state has should show loading indicator',
        (WidgetTester widgetTester) async {
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState.initial(),
      );

      final StoreTester<CoreState> storeTester =
          StoreTester<CoreState>.from(store);

      storeTester.dispatch(
          WaitAction<CoreState>.add(searchingPatientByPhoneNumberIsWaiting));

      await buildTestWidget(
        tester: widgetTester,
        widget: const PatientSearchConnector(),
        store: storeTester.store,
      );

      // check the loading indicator is rendered
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('when the state has should show a patient search card',
        (WidgetTester widgetTester) async {
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            patientSearchFound: true,
            patientSearchNumber: '0712345678',
            patientSearchResult: <PatientEdge>[
              PatientEdge(
                node: Patient(
                  name: <HumanName>[HumanName(text: 'User1')],
                  gender: PatientGenderEnum.male,
                  birthDate: '2005-12-13',
                ),
                hasOpenEpisodes: true,
              ),
            ],
          ),
        ),
      );

      final StoreTester<CoreState> storeTester =
          StoreTester<CoreState>.from(store);

      await buildTestWidget(
        tester: widgetTester,
        widget: const PatientSearchConnector(),
        store: storeTester.store,
      );

      // check the search guide is rendered
      expect(find.byType(PatientSearchCardWidget), findsOneWidget);
    });

    testWidgets('when the state has should show a patient not found',
        (WidgetTester widgetTester) async {
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            patientSearchFound: false,
            patientSearchNumber: '0712345678',
          ),
        ),
      );

      final StoreTester<CoreState> storeTester =
          StoreTester<CoreState>.from(store);

      await buildTestWidget(
        tester: widgetTester,
        widget: const PatientSearchConnector(),
        store: storeTester.store,
      );

      // check the patient not found is rendered
      expect(find.byType(NoPatientFound), findsOneWidget);
    });

    testWidgets('when the state has should show a search guide',
        (WidgetTester widgetTester) async {
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState.initial(),
      );

      final StoreTester<CoreState> storeTester =
          StoreTester<CoreState>.from(store);

      await buildTestWidget(
        tester: widgetTester,
        widget: const PatientSearchConnector(),
        store: storeTester.store,
      );

      // check the patient search card is rendered
      expect(find.byType(SearchGuide), findsOneWidget);
    });
  });
}

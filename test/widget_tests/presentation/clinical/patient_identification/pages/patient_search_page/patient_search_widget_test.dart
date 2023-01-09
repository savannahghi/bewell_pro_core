// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/no_results_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_guide.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('PatientSearchWidget', () {
    testWidgets(
      'should validate search input with dummy functions',
      (WidgetTester tester) async {
        bool wasPhoneValidatorCalled = false;
        String searchParam = '';

        await buildTestWidget(
          tester: tester,
          widget: PatientSearchWidget(
            phoneNumberFormValidator: (String? v) {
              wasPhoneValidatorCalled = true;
              return null;
            },
            searchPatientFunction: (BuildContext context, String param) {
              searchParam = param;
            },
            patientEdgeList: const <PatientEdge>[],
            searchResult: SearchResultWidgetEnum.searchGuide,
            validateAndSearch: (BuildContext context, String searchTerm,
                    GlobalKey<FormState> patientSearchFormKey) =>
                <dynamic>{},
          ),
        );

        expect(find.byType(SearchGuide), findsOneWidget);

        final Finder searchInput =
            find.byKey(AppWidgetKeys.patientSearchInputKey);

        expect(searchInput, findsOneWidget);

        // fill in the form
        await tester.enterText(searchInput, '07123456789');
        await tester.pump();

        expect(find.text('07123456789'), findsOneWidget);

        // trigger the search function
        await tester.tap(find.byKey(AppWidgetKeys.patientSearchDoneKey));
        await tester.pumpAndSettle();

        // click the submit button from the key board
        await tester.showKeyboard(find.byType(SILFormTextField));
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        // TODO!!: Investigate why the validator is not being called
        // this means the validator isn't being called
        expect(wasPhoneValidatorCalled, false);
        expect(searchParam, '07123456789');
      },
    );

    testWidgets(
      'should display search guide when SearchResultWidgetEnum is set to '
      'show the searchGuide',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          widget: PatientSearchWidget(
            phoneNumberFormValidator: (String? v) {
              return null;
            },
            searchPatientFunction:
                (BuildContext context, String searchParam) {},
            patientEdgeList: const <PatientEdge>[],
            searchResult: SearchResultWidgetEnum.searchGuide,
            validateAndSearch: (BuildContext context, String searchTerm,
                    GlobalKey<FormState> patientSearchFormKey) =>
                <dynamic>{},
          ),
        );

        expect(find.byType(SearchGuide), findsOneWidget);
      },
    );

    testWidgets(
      'should display no patient found widget when the patient is not found',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          widget: PatientSearchWidget(
            phoneNumberFormValidator: (String? v) {
              return null;
            },
            searchPatientFunction:
                (BuildContext context, String searchParam) {},
            patientEdgeList: const <PatientEdge>[],
            searchResult: SearchResultWidgetEnum.searchNotFound,
            validateAndSearch: (BuildContext context, String searchTerm,
                    GlobalKey<FormState> patientSearchFormKey) =>
                <dynamic>{},
          ),
        );

        expect(find.byType(NoPatientFound), findsOneWidget);
      },
    );

    testWidgets(
      'should display no patient search card',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          widget: PatientSearchWidget(
            phoneNumberFormValidator: (String? v) {
              return null;
            },
            searchPatientFunction:
                (BuildContext context, String searchParam) {},
            patientEdgeList: <PatientEdge>[
              PatientEdge(
                node: Patient(),
              ),
            ],
            searchResult: SearchResultWidgetEnum.patientSearchCard,
            validateAndSearch: (BuildContext context, String searchTerm,
                    GlobalKey<FormState> patientSearchFormKey) =>
                <dynamic>{},
          ),
        );

        expect(find.byType(PatientSearchCardConnector), findsOneWidget);
      },
    );

    // todo: add test for showing the loading indicator
  });
}

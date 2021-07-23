import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_patient_search_action.dart';

import 'mocked_data.dart';

void main() {
  test('update state after searching a patient by msisdn', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    storeTester.dispatch(UpdatePatientSearchAction(
        activeRecords: PatientMockData.activeRecords));

    final TestInfo<CoreState> info =
        await storeTester.wait(UpdatePatientSearchAction);

    expect(info.state.clinicalState?.patientSearchResult,
        PatientMockData.activeRecords);
  });

  test('update patient search state when result is null', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    storeTester.dispatch(UpdatePatientSearchAction(activeRecords: null));

    final TestInfo<CoreState> info =
        await storeTester.wait(UpdatePatientSearchAction);
    expect(info.state.clinicalState?.patientSearchResult, null);
  });

  test('update state after searching when result is empty list', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    final List<PatientEdge> activeRecords = <PatientEdge>[];

    storeTester
        .dispatch(UpdatePatientSearchAction(activeRecords: activeRecords));

    final TestInfo<CoreState> info =
        await storeTester.wait(UpdatePatientSearchAction);
    expect(info.state.clinicalState?.patientSearchResult, activeRecords);
  });
}

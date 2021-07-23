import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/save_patient_record_action.dart';
import 'package:test/test.dart';

void main() {
  group('save patient record action test: ', () {
    test('happy case', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final PatientEdge patientEdge = PatientEdge(
          cursor: 'cursor',
          node: Patient(id: 'some_unique_id_for_patient_record'),
          hasOpenEpisodes: false);

      storeTester.dispatch(SavePatientRecordAction(patientEdge: patientEdge));
      final TestInfo<CoreState> info =
          await storeTester.wait(SavePatientRecordAction);

      expect(info.state.clinicalState?.patientPayload?.patientRecord,
          patientEdge.node);
      expect(info.state.clinicalState?.patientPayload?.hasOpenEpisodes,
          patientEdge.hasOpenEpisodes);
    });

    test('update to null', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(SavePatientRecordAction(patientEdge: null));
      final TestInfo<CoreState> info =
          await storeTester.wait(SavePatientRecordAction);

      expect(info.state.clinicalState?.patientPayload?.patientRecord, null);
      expect(info.state.clinicalState?.patientPayload?.hasOpenEpisodes, null);
    });
  });
}

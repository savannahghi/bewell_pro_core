import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/clinical_state_actions/update_start_visit_type_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:test/test.dart';

void main() {
  group('update start visit type action', () {
    test('request access', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(UpdateStartVisitTypeAction(
          startVisitType: StartVisitType.requestAccess));

      final TestInfo<CoreState> info =
          await storeTester.wait(UpdateStartVisitTypeAction);

      expect(info.state.clinicalState?.startVisitType,
          StartVisitType.requestAccess);
    });

    test('emergency override', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(UpdateStartVisitTypeAction(
          startVisitType: StartVisitType.emergencyOverride));

      final TestInfo<CoreState> info =
          await storeTester.wait(UpdateStartVisitTypeAction);

      expect(info.state.clinicalState?.startVisitType,
          StartVisitType.emergencyOverride);
    });

    test('reset to null', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(UpdateStartVisitTypeAction(startVisitType: null));

      final TestInfo<CoreState> info =
          await storeTester.wait(UpdateStartVisitTypeAction);

      expect(info.state.clinicalState?.startVisitType, null);
    });
  });
}

import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/patient_exam/end_exam_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('EndExamAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw an exception when encounterID is null', () async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{'error': 'error'}), 408));

      storeTester.dispatch(EndExamAction(client: graphQlClient));

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(EndExamAction);
      expect(info.errors.removeFirst().msg, errorEndingExam);
    });

    test('should dispatch showErrorFlag if api response contains error',
        () async {
      CurrentPatientInEpisode().encounterID.add(testPatientId);

      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{'error': 'error'}), 408));

      storeTester.dispatch(EndExamAction(client: graphQlClient));

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(EndExamAction);
      expect(info.state.wait?.isWaitingFor(showErrorFlag), isTrue);
    });

    test('should dispatch NavigateAction if api response returns true',
        () async {
      CurrentPatientInEpisode().encounterID.add(testPatientId);

      storeTester.dispatch(EndExamAction(client: mockGraphQlClient));

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(NavigateAction);

      expect(info.state.wait?.isWaitingFor(showErrorFlag), isFalse);

      final NavigateAction<CoreState>? action =
          info.action as NavigateAction<CoreState>?;

      expect(action?.details.type, NavigateType.pop);
    });
  });
}

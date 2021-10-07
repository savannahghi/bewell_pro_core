// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_patient_found_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_patient_search_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_search_param_action.dart';
import '../../../../mocks/mocks.dart';
import 'mocked_data.dart';

void main() {
  StoreTester.printDefaultDebugInfo = false;
  test('search a patient by msisdn', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    final PatientConnection patientConnection = PatientConnection(
      edges: PatientMockData.activeRecords,
    );
    final Map<String, dynamic> patientConnectionJson =
        patientConnection.toJson();

    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'findPatientsByMSISDN': patientConnectionJson
              }
            },
          ),
          200),
    );

    storeTester.dispatch(
        PatientSearchByPhoneAction(client: client, searchParam: '0712345678'));

    final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
      PatientSearchByPhoneAction,
      WaitAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      UpdatePatientSearchAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      UpdatePatientSearchAction,
      WaitAction
    ]);

    // test action for updating the searched term
    expect(
        infos
            .get(UpdateSearchParamAction, 1)
            ?.state
            .clinicalState
            ?.patientSearchNumber,
        null);

    expect(
        infos
            .get(UpdateSearchParamAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchNumber,
        '0712345678');

    // test action for updating the search result status, found or notFound

    expect(
        infos
            .get(UpdatePatientPatientFoundAction, 1)
            ?.state
            .clinicalState
            ?.patientSearchFound,
        null);

    // test action for updating the search result
    expect(
        infos
            .get(UpdatePatientPatientFoundAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchFound,
        true);

    expect(
        infos
            .get(UpdatePatientSearchAction, 1)
            ?.state
            .clinicalState
            ?.patientSearchResult,
        null);

    expect(
        infos
            .get(UpdatePatientSearchAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchResult,
        PatientMockData.activeRecords);

    expect(infos.get(WaitAction, 1)?.state.wait?.isWaiting, true);
    expect(infos.get(WaitAction, 2)?.state.wait?.isWaiting, false);

    final TestInfo<CoreState>? info = infos.get(PatientSearchByPhoneAction, 1);

    // test state after the action
    expect(info?.state.clinicalState?.patientSearchResult,
        PatientMockData.activeRecords);
    expect(info?.state.clinicalState?.patientSearchFound, true);
    expect(info?.state.clinicalState?.patientSearchNumber, '0712345678');
  });

  test('patient not found, return inactive records', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    final Patient? patient =
        PatientMockData.activeRecords.first.node?.copyWith(active: false);

    // return inactive records
    final List<PatientEdge> inactiveRecords = <PatientEdge>[
      PatientMockData.activeRecords.first.copyWith(node: patient)
    ];

    final PatientConnection patientConnection = PatientConnection(
      edges: inactiveRecords,
    );

    final Map<String, dynamic> patientConnectionJson =
        patientConnection.toJson();

    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'findPatientsByMSISDN': patientConnectionJson
              }
            },
          ),
          200),
    );

    storeTester.dispatch(
        PatientSearchByPhoneAction(client: client, searchParam: '0712345678'));

    final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
      PatientSearchByPhoneAction,
      WaitAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      UpdatePatientSearchAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      WaitAction
    ]);

    expect(
        infos
            .get(UpdatePatientSearchAction)
            ?.state
            .clinicalState
            ?.patientSearchResult,
        null);

    expect(infos.get(WaitAction, 1)?.state.wait?.isWaiting, true);
    expect(infos.get(WaitAction, 2)?.state.wait?.isWaiting, false);
    expect(
        infos
            .get(UpdateSearchParamAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchNumber,
        '0712345678');

    expect(
        infos
            .get(UpdatePatientPatientFoundAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchFound,
        false);

    final TestInfo<CoreState>? info = infos[PatientSearchByPhoneAction];

    expect(info?.state.clinicalState?.patientSearchResult, null);
  });

  test('patient not found, return null record', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester =
        StoreTester<CoreState>.from(store);

    final PatientConnection patientConnection = PatientConnection();

    final Map<String, dynamic> patientConnectionJson =
        patientConnection.toJson();

    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'findPatientsByMSISDN': patientConnectionJson
              }
            },
          ),
          200),
    );

    storeTester.dispatch(
        PatientSearchByPhoneAction(client: client, searchParam: '0712345678'));

    final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
      PatientSearchByPhoneAction,
      WaitAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      UpdatePatientSearchAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      WaitAction
    ]);

    expect(
        infos
            .get(UpdatePatientSearchAction)
            ?.state
            .clinicalState
            ?.patientSearchResult,
        null);

    expect(infos.get(WaitAction, 1)?.state.wait?.isWaiting, true);
    expect(infos.get(WaitAction, 2)?.state.wait?.isWaiting, false);
    expect(
        infos
            .get(UpdateSearchParamAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchNumber,
        '0712345678');

    expect(
        infos
            .get(UpdatePatientPatientFoundAction, 2)
            ?.state
            .clinicalState
            ?.patientSearchFound,
        false);

    final TestInfo<CoreState>? info = infos[PatientSearchByPhoneAction];

    expect(info?.state.clinicalState?.patientSearchResult, null);
  });

  test('error when searching a patient', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'errors': <dynamic>[
                <String, dynamic>{'message': 'not provided'},
              ]
            },
          ),
          200),
    );

    storeTester.dispatch(
        PatientSearchByPhoneAction(client: client, searchParam: '0712345678'));

    final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
      PatientSearchByPhoneAction,
      WaitAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      UpdatePatientSearchAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      WaitAction
    ]);

    expect(
        infos
            .get(UpdatePatientSearchAction)
            ?.state
            .clinicalState
            ?.patientSearchResult,
        null);

    expect(infos.get(WaitAction, 1)?.state.wait?.isWaiting, true);
    expect(infos.get(WaitAction, 2)?.state.wait?.isWaiting, false);

    final TestInfo<CoreState>? info = infos[PatientSearchByPhoneAction];

    expect(info?.state.clinicalState?.patientSearchResult, null);
  });

  test('patient search 404, no internet connection', () async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
      store,
      // this suppresses the verbose logs in the terminal
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    final IGraphQlClient client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
          json.encode(
            <String, dynamic>{
              'errors': <dynamic>[
                <String, dynamic>{'message': 'not provided'},
              ]
            },
          ),
          404),
    );

    storeTester.dispatch(
        PatientSearchByPhoneAction(client: client, searchParam: '0712345678'));

    final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
      PatientSearchByPhoneAction,
      WaitAction,
      UpdateSearchParamAction,
      UpdatePatientPatientFoundAction,
      UpdatePatientSearchAction,
      WaitAction
    ]);

    expect(
        infos
            .get(UpdatePatientSearchAction)
            ?.state
            .clinicalState
            ?.patientSearchResult,
        null);

    expect(infos.get(WaitAction, 1)?.state.wait?.isWaiting, true);
    expect(infos.get(WaitAction, 2)?.state.wait?.isWaiting, false);

    final TestInfo<CoreState>? info = infos[PatientSearchByPhoneAction];

    expect(info?.state.clinicalState?.patientSearchResult, null);
  });
}

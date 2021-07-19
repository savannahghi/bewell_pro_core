import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';
import 'package:http/http.dart' as http;

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setUpAll(() {
    startMockVisitAndExam();
  });

  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  ExamCompositionObject().patientHistoryCompositionID.add(testPatientId);

  testWidgets('PatientHistory renders correctly', (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      widget: PatientHistory(),
    );

    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(PatientHistory), findsOneWidget);
  });

  testWidgets('displays patient history information when there is data',
      (WidgetTester tester) async {
    await buildTestWidget(
        tester: tester, store: store, widget: PatientHistory());
    await tester.pump();
    expect(find.byType(PatientHistory), findsOneWidget);

    expect(find.byType(StreamBuilder), findsWidgets);
    expect(find.byType(PatientHistoryForm), findsOneWidget);
  });

  testWidgets('should add null to payload when edges is empty ',
      (WidgetTester tester) async {
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            http.Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{
                  'searchFHIRComposition': <String, dynamic>{
                    'edges': <dynamic>[]
                  },
                  'searchFHIRCondition': <String, dynamic>{
                    'edges': <dynamic>[]
                  },
                },
              }),
              201,
            ));

    await buildTestWidget(
        tester: tester,
        store: store,
        widget: PatientHistory(),
        graphQlClient: mockShortSILGraphQlClient);

    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(PatientHistory), findsOneWidget);
    expect(find.byType(StreamBuilder), findsWidgets);
    expect(find.byType(PatientHistoryForm), findsOneWidget);
  });
}

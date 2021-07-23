import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_header.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_title_action.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_header_value.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:http/http.dart' as http;

import '../../../../mocks/mocks.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());
  final MockGraphQlClient mockGraphQlClient = MockGraphQlClient.withResponse(
      'idToken', 'endpoint', http.Response('', 200));

  testWidgets('BeWellTableTitleAction renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: appName,
          graphQLClient: mockGraphQlClient,
          appContexts: testAppContexts,
          child: const MaterialApp(
            home: Scaffold(
                body: BewellTableTitleAction(
              actionWidget: ExamItemAddButton(
                buttonText: 'Add Condition',
                drawerType: DrawerType.problem,
              ),
              title: 'x',
            )),
          ),
        ),
      ),
    );

    expect(find.text('x'), findsOneWidget);
  });

  testWidgets('BewellTableHeader renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: appName,
          graphQLClient: mockGraphQlClient,
          appContexts: testAppContexts,
          child: const MaterialApp(
            home: Scaffold(body: BewellTableHeader(child: SizedBox())),
          ),
        ),
      ),
    );

    expect(find.byType(BewellTableHeader), findsOneWidget);
  });

  testWidgets('BewellTableHeaderValue renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: appName,
          graphQLClient: mockGraphQlClient,
          appContexts: testAppContexts,
          child: MaterialApp(
            home: Scaffold(
                body: ListView(
              children: <Widget>[
                BewellTableHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      BewellTableHeaderValue(flex: 5, value: 'Condition'),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );

    expect(find.byType(BewellTableHeader), findsOneWidget);
    expect(find.byType(BewellTableHeaderValue), findsOneWidget);
    expect(find.text('Condition'), findsOneWidget);
  });
}

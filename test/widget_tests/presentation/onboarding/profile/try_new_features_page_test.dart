import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

import 'package:bewell_pro_core/presentation/onboarding/profile/pages/try_new_features_page.dart';
import 'package:shared_ui_components/try_new_features_widget.dart';

import 'package:http/http.dart' as http;

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());
  final MockShortGraphQlClient mockGraphQlClient =
      MockShortGraphQlClient.withResponse(
    'idToken',
    'endpoint',
    http.Response(
      json.encode(<String, dynamic>{
        'data': <String, dynamic>{'setupAsExperimentParticipant': true},
      }),
      200,
    ),
  );
  testWidgets('Try New Features Page should render correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget: TryNewFeaturesPage(),
      store: store,
      graphQlClient: mockGraphQlClient,
    );

    expect(find.byType(TryNewFeaturesPage), findsOneWidget);
    expect(find.byType(SILTryNewFeaturesWidget), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);

    await tester.tap(find.byType(Switch));

    await tester.pumpAndSettle();
    expect(store.state.userState!.auth!.canExperiment, true);
  });
}

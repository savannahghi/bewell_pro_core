import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/post_visit_survey_page.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_themes/spaces.dart';
import 'package:app_wrapper/app_wrapper.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Survey page', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('Renders the text form Fields', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          StoreProvider<AppState>(
            store: store,
            child: AppWrapper(
              appName: appName,
              graphQLClient: mockSILGraphQlClient,
              appContexts: testAppContexts,
              child: MaterialApp(
                home: Scaffold(body: BeWellPostVisitSurveyPage()),
              ),
            ),
          ),
        );

        final Finder textForm = find.byType(TextFormField);

        expect(textForm, findsNWidgets(2));

        await tester.enterText(find.byKey(const Key('criticism')), 'hello');
        final Finder criticism = find.byKey(const Key('criticism'));
        expect(criticism, findsOneWidget);

        final Finder helloWidget = find.text('hello');
        expect(helloWidget, findsOneWidget);

        await tester.enterText(find.byKey(const Key('suggestion')), 'do this');
        final Finder suggestion = find.byKey(const Key('suggestion'));
        expect(suggestion, findsOneWidget);

        final Finder findSuggestion = find.text('do this');
        expect(findSuggestion, findsOneWidget);
      });
    });

    testWidgets('complete button Works correctly', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: BeWellPostVisitSurveyPage());

      expect(find.byIcon(Icons.star_border), findsNWidgets(5));
      await tester.tap(find.byIcon(Icons.star_border).at(2));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.star_border).at(0));
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.completeButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.completeButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('shows snackbar when an error occurs',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient graphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'error': 'timeout'}), 200),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: BeWellPostVisitSurveyPage(),
        graphQlClient: graphQlClient,
      );

      expect(find.byIcon(Icons.star_border), findsNWidgets(5));
      await tester.tap(find.byIcon(Icons.star_border).at(2));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.star_border).at(0));
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.completeButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.completeButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'complete button Works correctly and higlights red if star is not selected',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: BeWellPostVisitSurveyPage());

      expect(find.byKey(AppWidgetKeys.completeButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.completeButtonKey));
      await tester.pumpAndSettle();

      expect(find.text(ratingText), findsOneWidget);
    });

    testWidgets('Renders the ui correctly when largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      await buildTestWidget(
          tester: tester, store: store, widget: BeWellPostVisitSurveyPage());

      expect(find.byWidget(mediumVerticalSizedBox), findsNWidgets(5));
      expect(find.byWidget(smallVerticalSizedBox), findsNWidgets(5));
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.skipButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.skipButtonKey));
      await tester.pumpAndSettle();

      // navigates to patient identifications page.
      expect(find.byKey(AppWidgetKeys.patientSearchInputKey), findsOneWidget);
      expect(find.text(patientIdentificationTitle), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

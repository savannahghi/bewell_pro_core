// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/patient_exam_problems.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/patient_records_empty.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('PatientProblemTable', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('renders correctly on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
          tester: tester, store: store, widget: PatientProblemTable());

      await tester.pump();

      expect(find.text('Chronic congestive heart failure'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.smallScreenRetireButton), findsNothing);
      expect(find.byKey(AppWidgetKeys.largeScreenRetireButton), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.largeScreenRetireButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.largeScreenRetireButton));

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              Response(
                  json.encode(<String, dynamic>{
                    'data': <String, dynamic>{'loading': true}
                  }),
                  200));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: graphQlClient,
        widget: PatientProblemTable(),
      );

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets(
        'shows EmptyProblemsContainer widget when there are no problems',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRCondition': <String, dynamic>{
                'edges': <dynamic>[
                  <String, dynamic>{
                    'node': <String, dynamic>{
                      'ID': '7bdba5ac-f726-4cec-8064-12328f9032f6',
                      'ClinicalStatus': <String, dynamic>{
                        'Text': 'Retired',
                      },
                      'Category': <dynamic>[
                        <String, dynamic>{
                          'Text': 'problem-list-item',
                        }
                      ],
                    }
                  },
                ],
              }
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: graphQlClient,
        widget: PatientProblemTable(),
      );

      await tester.pump();

      expect(find.byType(EmptyProblemsContainer), findsOneWidget);
    });

    testWidgets('renders correctly on small screen',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: PatientProblemTable());

      await tester.pump();

      expect(find.text('Chronic Congestive Heart Failure'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.smallScreenRetireButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.largeScreenRetireButton), findsNothing);
    });

    testWidgets('retire button works correctly ', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: PatientProblemTable());

      await tester.pump();

      expect(find.text('Chronic Congestive Heart Failure'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.smallScreenRetireButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.largeScreenRetireButton), findsNothing);

      await tester.tap(find.byKey(AppWidgetKeys.smallScreenRetireButton));
      await tester.pumpAndSettle();

      expect(find.byType(CircleAvatar), findsWidgets);
      expect(find.byType(RequiredTextFormHintText), findsWidgets);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), '');
      await tester.pumpAndSettle();

      expect(find.text(''), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));

      expect(find.byType(RequiredTextFormHintText), findsWidgets);

      await tester.tap(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'Wrong Data');
      await tester.pumpAndSettle();
      expect(find.text('Wrong Data'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();
    });
  });
}

import 'dart:convert';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/vitals/vitals.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  setUpAll(() {
    startMockVisitAndExam();
  });

  group('Vitals', () {
    testWidgets('should fetch vitals and display them',
        (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: Vitals());

      await tester.pumpAndSettle();

      expect(find.text('Height and weight'), findsOneWidget);

      expect(find.text('Temperature'), findsOneWidget);
      expect(find.text('37'), findsOneWidget);

      expect(find.text('Pulse'), findsOneWidget);
      expect(find.text('90'), findsNWidgets(2));

      expect(find.text('Blood Pressure'), findsNWidgets(1));

      expect(find.text('Respiratory Rate'), findsOneWidget);

      expect(find.text('Height and weight'), findsOneWidget);
      expect(find.text('SPO2'), findsOneWidget);

      // Trigger a refresh of the UI
      ExamChangeObject().onAddVitalListener.add(true);
      await tester.pumpAndSettle();

      expect(find.text('Height and weight'), findsOneWidget);

      expect(find.text('Temperature'), findsOneWidget);
      expect(find.text('37'), findsOneWidget);
    });

    testWidgets(
        'should display GenericTimeoutWidget when there there is '
        'a timeout error fetching vitals', (WidgetTester tester) async {
      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'error': 'timeout'}), 200),
      );

      await buildTestWidget(
          tester: tester, widget: Vitals(), graphQlClient: client);
      await tester.pumpAndSettle();

      expect(find.byType(GenericTimeoutWidget), findsOneWidget);
    });

    testWidgets(
        'should display GenericTimeoutWidget when there there is '
        'an unknown error while fetching vitals and retry',
        (WidgetTester tester) async {
      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{'error': 'some other error'}), 200),
      );

      await buildTestWidget(
          tester: tester, widget: Vitals(), graphQlClient: client);
      await tester.pumpAndSettle();

      expect(find.byType(GenericTimeoutWidget), findsOneWidget);

      // tap the retry button
      await tester.tap(find.byKey(AppWidgetKeys.genericTimeOutKey));
      await tester.pumpAndSettle();

      expect(find.byType(GenericTimeoutWidget), findsOneWidget);
    });

    testWidgets('should display SILPlatformLoader when fetching vitals',
        (WidgetTester tester) async {
      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            200),
      );

      await buildTestWidget(
          tester: tester, widget: Vitals(), graphQlClient: client);

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets(
        'should display empty vitals container when the vital data edge is null',
        (WidgetTester tester) async {
      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIRObservation': <String, dynamic>{'edges': null}
              }
            }),
            200),
      );

      await buildTestWidget(
          tester: tester, widget: Vitals(), graphQlClient: client);
      await tester.pumpAndSettle();

      expect(find.text('Add'), findsNWidgets(6));
    });
  });
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_continue_exam_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_or_continue_exam_wrapper.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('StartOrContinueExamWrapper renders correctly', () {
    setUpAll(() async {
      startMockVisitAndExam();
    });
    testWidgets(
        'StartOrContinueExamWrapper renders correctly when data is null',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient graphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(
            <String, dynamic>{'data': null},
          ),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: graphQlClient,
        widget: const StartOrContinueExamWrapper(
          patientName: 'Be Well',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StartOrContinueExamBanner), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
    });
    testWidgets(
        'StartOrContinueExamWrapper renders correctly when searchFHIREncounter is null',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient graphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'searchFHIREncounter': null}
            },
          ),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: graphQlClient,
        widget: const StartOrContinueExamWrapper(
          patientName: 'Be Well',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StartOrContinueExamBanner), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
    });
    testWidgets(
        'StartOrContinueExamWrapper renders correctly when edges is null',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient graphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIREncounter': <String, dynamic>{'edges': null}
              }
            },
          ),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: graphQlClient,
        widget: const StartOrContinueExamWrapper(
          patientName: 'Be Well',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StartOrContinueExamBanner), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
    });
    testWidgets(
        'StartOrContinueExamWrapper renders correctly when node is null',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient graphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'searchFHIREncounter': <String, dynamic>{
                  'edges': <dynamic>[
                    <String, dynamic>{'node': null}
                  ]
                }
              }
            },
          ),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: graphQlClient,
        widget: const StartOrContinueExamWrapper(
          patientName: 'Be Well',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StartOrContinueExamBanner), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
    });
  });
}

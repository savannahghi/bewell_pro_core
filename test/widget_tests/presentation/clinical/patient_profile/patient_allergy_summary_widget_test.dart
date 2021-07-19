import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_allergy_summary_widget.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('PatientAllergySummaryWidget displays loading indicator',
      (WidgetTester tester) async {
    final MockShortSILGraphQlClient mockSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'loading': true}
        }),
        200,
      ),
    );
    await buildTestWidget(
      tester: tester,
      graphQlClient: mockSILGraphQlClient,
      widget: PatientAllergySummaryWidget(),
    );
    await tester.pump();
    expect(find.byType(SILPlatformLoader), findsOneWidget);
  });
}

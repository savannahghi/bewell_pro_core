// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_allergy_summary_widget.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('PatientAllergySummaryWidget displays loading indicator',
      (WidgetTester tester) async {
    final MockShortGraphQlClient mockGraphQlClient =
        MockShortGraphQlClient.withResponse(
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
      graphQlClient: mockGraphQlClient,
      widget: PatientAllergySummaryWidget(),
    );
    await tester.pump();
    expect(find.byType(SILPlatformLoader), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/faq_detail_view_page.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/faq_card.dart';

import '../../../../../mocks/test_helpers.dart';

void main() {
  group('FAQ Card', () {
    testWidgets(
        'should render a question card correctly and perform the '
        ' expected interactions', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          widget: const FAQCard(
            question: 'This is a Question',
            answer: 'This is the Answer',
          ));

      await tester.pumpAndSettle();
      final Finder containerWidget =
          find.byKey(AppWidgetKeys.helpCenterContainerKey);
      expect(containerWidget, findsOneWidget);

      expect(find.byType(GestureDetector), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(FAQDetailViewPage), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(containerWidget, findsOneWidget);
    });
  });
}

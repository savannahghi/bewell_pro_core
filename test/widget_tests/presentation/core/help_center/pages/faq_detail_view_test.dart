// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/core/help_center/pages/faq_detail_view_page.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/html_wrapper.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('FAQDetailViewPage', () {
    testWidgets(
        'should render correctly when a question and an answer '
        'are passed into the component', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const FAQDetailViewPage(
          question: 'This is a Question',
          answer: 'This is the Answer',
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(HtmlWrapper), findsOneWidget);
      expect(find.text('This is a Question'), findsOneWidget);
    });
  });
}

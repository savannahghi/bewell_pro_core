// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/core/help_center/widgets/html_wrapper.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('HtmlWrapper', () {
    testWidgets('should render a text widget for normal text without html tags',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const HtmlWrapper(text: 'Text without html tags'),
      );

      expect(find.byType(HtmlWrapper), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text('Text without html tags'), findsOneWidget);
    });

    testWidgets('should render a HTML widget for text with html tags',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const HtmlWrapper(
          text: '''Text with a <a href='#'>link</a>''',
        ),
      );

      expect(find.byType(HtmlWrapper), findsOneWidget);
      expect(find.byType(Html), findsOneWidget);
      expect(find.byType(HtmlWrapper), findsOneWidget);
      expect(find.text('Text with a link'), findsOneWidget);

      bool findTextAndTap(InlineSpan visitor, String text) {
        if (visitor is TextSpan && visitor.text == text) {
          (visitor.recognizer as TapGestureRecognizer?)?.onTap!();
          return false;
        }
        return true;
      }

      bool tapTextSpan(RichText richText, String text) {
        final bool visitChildren = richText.text.visitChildren(
          (InlineSpan visitor) => findTextAndTap(visitor, text),
        );
        final bool isTapped = !visitChildren;
        return isTapped;
      }

      final Finder finder = find.byWidgetPredicate(
        (Widget widget) => widget is RichText && tapTextSpan(widget, 'link'),
      );

      expect(finder, findsOneWidget);
    });
  });
}

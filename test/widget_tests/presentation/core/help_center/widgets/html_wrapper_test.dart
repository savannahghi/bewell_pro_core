import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/html_wrapper.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

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

    testWidgets('should render an image widget from html',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          widget: const HtmlWrapper(
              text:
                  '<figure class="kg-card kg-image-card"><img src="https://uat.ghost.bewell.co.ke/content/images/2021/05/Screenshot_1620652822--1-.png" class="kg-image" alt loading="lazy" width="1078" height="204" srcset="https://uat.ghost.bewell.co.ke/content/images/size/w600/2021/05/Screenshot_1620652822--1-.png 600w, https://uat.ghost.bewell.co.ke/content/images/size/w1000/2021/05/Screenshot_1620652822--1-.png 1000w, https://uat.ghost.bewell.co.ke/content/images/2021/05/Screenshot_1620652822--1-.png 1078w" sizes="(min-width: 720px) 720px"></figure>'),
        );

        expect(find.byType(HtmlWrapper), findsOneWidget);
        expect(find.byKey(AppWidgetKeys.htmlWrapperImageKey), findsOneWidget);
      });
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

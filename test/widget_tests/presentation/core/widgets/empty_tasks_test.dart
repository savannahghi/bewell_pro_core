// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/core/widgets/empty_tasks.dart';

void main() {
  group('Empty tasks', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: EmptyTasks(item: 'FAQS'))));

      expect(find.byType(EmptyTasks), findsOneWidget);
      expect(find.byWidget(mediumVerticalSizedBox), findsOneWidget);
      expect(find.text('You have no faqs. Check back later for more'),
          findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
    });
  });
}

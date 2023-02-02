// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:sghi_core/shared_themes/constants.dart';

void main() {
  testWidgets(
    'should have the slade360 error message',
    (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: UnrecoverableErrorWidget())));

      expect(find.byType(Text), findsOneWidget);
      expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
    },
  );
}

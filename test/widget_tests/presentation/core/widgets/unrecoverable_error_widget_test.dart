import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/core/widgets/unrecoverable_error_widget.dart';

void main() {
  testWidgets(
    'should have the slade360 error message',
    (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: UnrecoverableErrorWidget())));

      expect(find.byType(Text), findsOneWidget);
      expect(
          find.text(
              'Sorry, an error occurred. Please try again, or contact Slade 360 '
              'Be.Well Support support on +254790360360'),
          findsOneWidget);
    },
  );
}

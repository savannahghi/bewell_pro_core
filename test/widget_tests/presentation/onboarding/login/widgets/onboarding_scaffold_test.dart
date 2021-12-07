// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';

void main() {
  testWidgets('OnboardScaffold renders correctly', (WidgetTester tester) async {
    const double numberZero = 0;
    await tester.pumpWidget(const MaterialApp(
      home: OnboardingScaffold(
        title: '',
        icon: Icons.train,
        dimension: numberZero,
        child: Placeholder(),
      ),
    ));

    expect(find.byType(OnboardingScaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}

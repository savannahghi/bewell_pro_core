import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/user_names_form.dart';

import '../../../../../mocks/test_helpers.dart';

void main() {
  group(' User names form', () {
    testWidgets('should test the UserNames page renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: UserNamesForm(),
      );

      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.silTextFieldFNameKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldLNameKey), findsOneWidget);
    });
  });
}

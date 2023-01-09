// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';
import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setupFirebaseAuthMocks();

  setUp(() async {
    await Firebase.initializeApp();
  });

  testWidgets('should test generic timeout page renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
        tester: tester,
        widget: const GenericTimeoutWidget(
          recoverRoute: '/',
          action: 'go back',
        ));

    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.genericErrorTextKey), findsOneWidget);
    expect(find.byType(SILPrimaryButton), findsOneWidget);
    await tester.tap(find.byType(SILPrimaryButton));
  });
}

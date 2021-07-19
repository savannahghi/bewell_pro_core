import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';

import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
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

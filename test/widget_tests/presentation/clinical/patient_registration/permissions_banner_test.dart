// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/permissions_banner.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('PermissionsBanner', () {
    const String message = 'X';
    testWidgets('PermissionsBanner renders correctly smallScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return const PermissionsBanner(message: message);
        }),
      ));

      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();
    });

    testWidgets('PermissionsBanner renders correctly largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return const PermissionsBanner(
            message: message,
          );
        }),
      ));

      expect(find.text(message), findsOneWidget);
      expect(
          Theme.of(tester.element(find.text(message))).textTheme.subtitle2,
          isNot(Theme.of(tester.element(find.text(message)))
              .textTheme
              .bodyText1));

      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));

      await tester.pump();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

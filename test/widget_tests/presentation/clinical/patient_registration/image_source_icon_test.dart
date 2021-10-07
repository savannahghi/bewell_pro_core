// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/image_source_icon.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SourceIcon Widget', () {
    testWidgets('SourceIcon widget renders correctly smallScreen',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return SourceIcon(
              onSourceSelected: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
              imgPath: cameraIconUrl,
              sourceText: 'x',
            );
          },
        ),
      );

      expect(find.text('x'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.imageSourceIconKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.imageSourceIconKey));
      await tester.pumpAndSettle();

      expect(find.byType(SourceIcon), findsNothing);
    });

    testWidgets('SourceIcon widget renders correctly largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return SourceIcon(
              onSourceSelected: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
              imgPath: cameraIconUrl,
              sourceText: 'x',
            );
          },
        ),
      );

      expect(Theme.of(tester.element(find.text('x'))).textTheme,
          isNot(Theme.of(tester.element(find.text('x'))).textTheme.bodyText1));
      expect(find.text('x'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.imageSourceIconKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.imageSourceIconKey));
      await tester.pumpAndSettle();

      expect(find.byType(SourceIcon), findsNothing);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

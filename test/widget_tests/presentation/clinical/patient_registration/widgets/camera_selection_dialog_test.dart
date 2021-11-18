// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/camera_selection_dialog.dart';
import '../../../../../mocks/mocks.dart';

void main() {
  group('CameraSelectionDialog', () {
    testWidgets('should display correctly on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: Center(
              child: ElevatedButton(
                onPressed: null,
                child: Text('Go'),
              ),
            ),
          ),
        ),
      );

      final BuildContext context = tester.element(find.text('Go'));

      showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return CameraSelectionDialog();
        },
      );
      await tester.pumpAndSettle();

      expect(find.text(cameraText), findsOneWidget);
      expect(find.text(galleryText), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should return correct result', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: Center(
              child: ElevatedButton(
                onPressed: null,
                child: Text('Go'),
              ),
            ),
          ),
        ),
      );

      final BuildContext context = tester.element(find.text('Go'));

      Future<ImageSource?> result = showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return CameraSelectionDialog();
        },
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text(cameraText), findsOneWidget);
      await tester.tap(find.text(cameraText));

      expect(await result, equals(ImageSource.camera));

      result = showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return CameraSelectionDialog();
        },
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text(galleryText), findsOneWidget);
      await tester.tap(find.text(galleryText));

      expect(await result, equals(ImageSource.gallery));
    });
  });
}

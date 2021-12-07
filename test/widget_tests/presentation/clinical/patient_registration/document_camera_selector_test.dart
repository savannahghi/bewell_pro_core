// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_registration/document_camera_selector.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('DocumentCameraSelector', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: DocumentCameraSelector(
          description: 'Tap to capture front side',
          documentType: 'ID',
          onTap: () {},
        ),
      );

      expect(find.byType(DocumentCameraSelector), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(DottedBorder), findsOneWidget);
      expect(find.byWidget(mediumVerticalSizedBox), findsOneWidget);
      expect(find.text('Tap to capture front side'), findsOneWidget);
      expect(find.text('of ID card'), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    });
  });
}

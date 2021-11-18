// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/patient_photo.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PatientPhoto widget', () {
    testWidgets('renders image container if profileImage is not null',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientPhoto(
          userType: patientStr,
          profileImage: File(''),
          takePhotoCallback: () {},
        ),
      );

      expect(find.byKey(AppWidgetKeys.basicDetailsPhotoContainerKey),
          findsOneWidget);
      expect(find.byType(CircleAvatar), findsNothing);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/nhif.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:misc_utilities/responsive_widget.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('NHIF', () {
    final NHIFInformationObject nhifInformation = NHIFInformationObject();

    late TabController controller;

    setUp(() {
      controller = TabController(length: 6, vsync: const TestVSync());
    });

    testWidgets('nhif renders correctly', (WidgetTester tester) async {
      nhifInformation
        ..patientID.add(testPatientID)
        ..membershipNumber.add('15285455')
        ..frontImageBase64.add('15285455')
        ..frontImageContentType.add('15285455');

      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NHIF(),
        ),
      );

      expect(find.byKey(AppWidgetKeys.nHIFPreviousKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.nHIFPreviousKey), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      await tester.enterText(
          find.byKey(AppWidgetKeys.memberNoInputKey), '12345678');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.nHIFNextKey));
      await tester.pumpAndSettle();

      expect(find.text(nhifRequiredPrompt), findsNothing);
      expect(find.text(nhifIsShortPrompt), findsNothing);
    });

    testWidgets('nhif previous btn works', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NHIF(),
        ),
      );

      expect(find.byKey(AppWidgetKeys.nHIFPreviousKey), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), '12345678');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.nHIFPreviousKey));
      await tester.pumpAndSettle();
    });

    testWidgets('nhif renders correctly in large screen ',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            final bool isSmallScreen =
                ResponsiveWidget.isSmallScreen(context);
            final bool isLargeScreen =
                ResponsiveWidget.isLargeScreen(context);

            expect(isSmallScreen, isFalse);
            expect(isLargeScreen, isTrue);
            return Scaffold(
              body: PatientRegistrationContainer(
                tabController: controller,
                child: const NHIF(),
              ),
            );
          },
        ),
      );

      expect(find.byKey(AppWidgetKeys.nHIFPreviousKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.nHIFPreviousKey), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

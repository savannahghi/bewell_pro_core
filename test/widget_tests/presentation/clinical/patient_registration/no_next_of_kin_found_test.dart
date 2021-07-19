import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/no_next_of_kin_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/self_next_of_kin_search.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('no next of kin found', () {
    const String searchString = '0712345678';

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const NoNextOfKinFound(
          phoneNumberString: searchString,
        ),
      );

      expect(find.byType(NoNextOfKinFound), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.noNextOfKinContainerKey), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(4));
      expect(find.byType(Image), findsOneWidget);

      bool findTextAndTap(InlineSpan visitor, String text) {
        if (visitor is TextSpan && visitor.text == text) {
          return false;
        }
        return true;
      }

      bool tapTextSpan(RichText richText, String text) {
        final bool isTapped = !richText.text.visitChildren(
          (InlineSpan visitor) => findTextAndTap(visitor, text),
        );
        return isTapped;
      }

      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText && tapTextSpan(widget, foundNoMatches),
          ),
          findsOneWidget);
    });

    testWidgets('taps register kin button', (WidgetTester tester) async {
      final TabController controller =
          TabController(length: 6, vsync: const TestVSync());

      await buildTestWidget(
        tester: tester,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NoNextOfKinFound(
            phoneNumberString: searchString,
          ),
        ),
      );

      expect(find.byType(NoNextOfKinFound), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.noNextOfKinContainerKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.registerKinKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.registerKinKey));
      await tester.pumpAndSettle();
    });

    testWidgets('renders Self next of kin search correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SelfNextOfKinSearch(),
      );

      expect(find.byType(SelfNextOfKinSearch), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.selfNextOfKinContainerKey), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(3));
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(cannotRegisterYourself), findsOneWidget);
      expect(find.text(searchDiffNumber), findsOneWidget);
    });
  });
}

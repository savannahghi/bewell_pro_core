// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/end_visit_dialogue_content.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setUp(() {
    startMockVisitAndExam();
  });

  testWidgets('cancel end visit button dialogue works correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget: const EndVisitDialogueContent(name: 'leo'),
    );

    expect(find.byType(SILSecondaryButton), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.cancelEndVisitKey), findsOneWidget);
    await tester.tap(find.byType(SILSecondaryButton));
    await tester.pumpAndSettle();
  });

  testWidgets(
      'cancel end visit button dialogue works correctly in large screen',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;
    await buildTestWidget(
      tester: tester,
      widget: const EndVisitDialogueContent(name: 'leo'),
    );

    expect(find.byType(SILSecondaryButton), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.cancelEndVisitKey), findsOneWidget);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}

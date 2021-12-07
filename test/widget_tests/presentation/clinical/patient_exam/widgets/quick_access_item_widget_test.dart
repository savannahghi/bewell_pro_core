// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/widgets/quick_access_item_widget.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('quickAccessWidget renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget: QuickAccessItemWidget(
        openPatientExamDrawer: () {},
        reviewName: 'Respiratory',
        drawerType: DrawerType.respiratory,
      ),
    );

    expect(find.text('Respiratory'), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.openPatientExamDrawerKey), findsOneWidget);
  });

  testWidgets(
      'quickAccessWidget opening drawer calls openPatientExamDrawer callback',
      (WidgetTester tester) async {
    int drawerCallbackCalls = 0;

    await buildTestWidget(
      tester: tester,
      widget: QuickAccessItemWidget(
        openPatientExamDrawer: () => drawerCallbackCalls++,
        reviewName: 'Respiratory',
        drawerType: DrawerType.respiratory,
      ),
    );

    final Finder drawer = find.byKey(AppWidgetKeys.openPatientExamDrawerKey);
    expect(drawer, findsOneWidget);
    await tester.tap(drawer);

    expect(drawerCallbackCalls, 1);

    await tester.tap(drawer);
    expect(drawerCallbackCalls, 2);
  });
}

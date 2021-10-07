// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_visit_dialog_widget.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  // finders
  final Finder requestAccessFinder = find.text(requestAccess);
  final Finder overrideBtnFinder =
      find.byKey(AppWidgetKeys.emergencyOverrideKey);
  final Finder accessBtnFinder = find.byKey(AppWidgetKeys.requestAccessKey);
  testWidgets('Request Access functions correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget: StartVisitDialogWidget(),
    );

    // verify modal is rendered correctly
    expect(requestAccessFinder, findsOneWidget);
    expect(overrideBtnFinder, findsOneWidget);
    expect(accessBtnFinder, findsOneWidget);
  });
}

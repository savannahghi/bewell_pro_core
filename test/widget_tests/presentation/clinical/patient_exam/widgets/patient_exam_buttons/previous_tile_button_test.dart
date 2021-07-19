import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/previous_tile_button.dart';
import 'package:shared_ui_components/buttons.dart';

void main() {
  testWidgets('Previous Button renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: PreviousTileButton(callback: () {})),
    ));

    expect(find.byType(SILSecondaryButton), findsOneWidget);
    expect(find.text(previousBtnText), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.previousTileButtonKey), findsOneWidget);
    await tester.tap(find.byKey(AppWidgetKeys.previousTileButtonKey));
  });
}

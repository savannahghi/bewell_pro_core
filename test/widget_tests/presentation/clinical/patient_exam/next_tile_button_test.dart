// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/next_tile_button.dart';

void main() {
  testWidgets('NextTileButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: NextTileButton(
          callback: () {},
        ),
      ),
    ));
    expect(find.byType(SILPrimaryButton), findsOneWidget);
    expect(find.text(nextBtnText), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.nextTileButtonKey), findsOneWidget);
    await tester.tap(find.byKey(AppWidgetKeys.nextTileButtonKey));
  });
}

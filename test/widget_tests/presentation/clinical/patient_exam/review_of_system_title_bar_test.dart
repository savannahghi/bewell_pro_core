import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/retire_composition_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_system_title_bar.dart';
import 'package:shared_ui_components/buttons.dart';

void main() {
  group('ReviewOfSystemTitleBar', () {
    const String compositionTitle = 'general-examination';

    testWidgets('ReviewOfSystemTitleBar renders correctly ',
        (WidgetTester tester) async {
      final StreamController<dynamic> _examsStreamController =
          StreamController<dynamic>();

      await tester.pumpWidget(MaterialApp(
        home: ReviewOfSystemTitleBar(
          compositionTitle: compositionTitle,
          streamController: _examsStreamController,
          title: 'Gastro',
          generalExamCallback: () {},
          isGeneralExam: true,
        ),
      ));

      expect(find.byType(SILSecondaryButton), findsOneWidget);
      expect(find.text('Gastro'), findsOneWidget);
    });

    testWidgets(
        'RetireCompositionButton renders if isGeneralExam == false correctly',
        (WidgetTester tester) async {
      final StreamController<dynamic> _examsStreamController =
          StreamController<dynamic>();

      await tester.pumpWidget(MaterialApp(
        home: ReviewOfSystemTitleBar(
          compositionTitle: compositionTitle,
          streamController: _examsStreamController,
          title: 'Gastro',
          generalExamCallback: () {},
        ),
      ));

      expect(find.byType(RetireCompositionButton), findsOneWidget);
      expect(find.text('Gastro'), findsOneWidget);
    });
  });
}

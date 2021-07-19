import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_column_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_row_data_text.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_sub_title_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_titles.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('patient exam ', () {
    testWidgets('PatientExamCardTitle renders correctly in small devices',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PatientExamCardTitle(title: 'History'),
      ));

      expect(find.text('History'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('PatientExamCardTitle renders correctly in large devices',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await tester.pumpWidget(const MaterialApp(
        home: PatientExamCardTitle(
          title: 'History',
        ),
      ));

      expect(find.text('History'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
    testWidgets('PatientExamSubTitleCardTitle renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PatientExamSubTitleCardTitle(
          title: 'History',
        ),
      ));

      expect(find.text('History'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
    testWidgets('PatientExamRowDataText renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PatientExamRowDataText(
          rowText: 'History is awesome',
        ),
      ));

      expect(find.text('History is awesome'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
    testWidgets('PatientExamColumnTitle renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PatientExamColumnTitle(
          title: 'This is a demo',
        ),
      ));

      expect(find.text('This is a demo'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
    testWidgets('PatientExamTitles renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Flex(
          direction: Axis.horizontal,
          children: const <Widget>[
            PatientExamTitles(
                title: 'This is the titleCase',
                subtitle: 'this is the subtitle'),
          ],
        ),
      ));

      expect(find.text('This is the titleCase'), findsOneWidget);
      expect(find.text('this is the subtitle'), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}

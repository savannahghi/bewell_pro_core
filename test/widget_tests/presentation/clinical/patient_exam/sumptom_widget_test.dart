import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/symptom_widget.dart';

void main() {
  group(
    'SymptomWidget',
    () {
      testWidgets('SymptomWidget renders correctly if isNormal == true',
          (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
            home: SymptomWidget(symptomText: 'pain', isNormal: true)));
        expect(
          tester
              .widget<Padding>(find.ancestor(
                  of: find.text('pain'), matching: find.byType(Padding)))
              .padding,
          const EdgeInsets.symmetric(vertical: 8),
        );
      });

      testWidgets('SymptomWidget renders correctly if isNormal == false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: SymptomWidget(symptomText: 'pain')));

        expect(
          tester
              .widget<Container>(find.ancestor(
                  of: find.text('pain'), matching: find.byType(Container)))
              .padding,
          const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        );

        expect(find.text('pain'), findsOneWidget);
      });
    },
  );
}

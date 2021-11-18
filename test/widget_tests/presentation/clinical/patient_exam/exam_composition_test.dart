// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';

void main() {
  group('CompositionTitle', () {
    testWidgets('enum & extension work correctly', (WidgetTester tester) async {
      expect(CompositionTypeTitle.patientHistory.name, 'patient-history');
      expect(
          CompositionTypeTitle.generalExamination.name, 'general-examination');
      expect(CompositionTypeTitle.reviewOfSystems.name, 'review-of-systems');
    });
  });
}

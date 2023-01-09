// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/result_not_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/medication_search_result_container.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('MedicationSearchResults', () {
    testWidgets(
        'MedicationSearchResults renders correctly when snapshot has error',
        (WidgetTester tester) async {
      final StreamController<dynamic> medicationController =
          StreamController<dynamic>.broadcast();
      final Stream<dynamic> medicationStream;
      medicationStream = medicationController.stream;

      await buildTestWidget(
        tester: tester,
        widget: MedicationSearchResults(
          medicationStream: medicationStream,
          updateMedicationSelectionStatus: () {},
        ),
      );
      medicationController.addError(<String, dynamic>{'error': 'error'});

      await tester.pump();

      expect(find.text(errorOccurred), findsOneWidget);
    });
    testWidgets(
        'MedicationSearchResults shows loading indicator when loading is true',
        (WidgetTester tester) async {
      final StreamController<dynamic> medicationController =
          StreamController<dynamic>.broadcast();
      final Stream<dynamic> medicationStream;
      medicationStream = medicationController.stream;

      await buildTestWidget(
        tester: tester,
        widget: MedicationSearchResults(
          medicationStream: medicationStream,
          updateMedicationSelectionStatus: () {},
        ),
      );
      medicationController.add(
        <String, dynamic>{'loading': true},
      );

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
    testWidgets(
        'MedicationSearchResults renders correctly when medication list is empty',
        (WidgetTester tester) async {
      final StreamController<dynamic> medicationController =
          StreamController<dynamic>.broadcast();
      final Stream<dynamic> medicationStream;
      medicationStream = medicationController.stream;

      await buildTestWidget(
        tester: tester,
        widget: MedicationSearchResults(
          medicationStream: medicationStream,
          updateMedicationSelectionStatus: () {},
        ),
      );

      medicationController
          .add(<String, dynamic>{'listConcepts': <Map<String, dynamic>>[]});

      await tester.pump();
      expect(find.byType(ResultsNotFound), findsOneWidget);
    });
  });
}

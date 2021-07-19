import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/decoded_system.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_system_title_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems_item_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/symptom_widget.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('SystemsWidget', () {
    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial(),
    );

    final StreamController<dynamic> streamController =
        StreamController<dynamic>();

    setUpAll(() {
      startMockVisitAndExam();
    });

    tearDownAll(() {
      streamController.close();
    });

    final DecodedSystem _sampleDecodedSystem = DecodedSystem(
      const <String, dynamic>{
        'description': 'something',
        'symptomNoneKnown': 'false',
        'symptomEdema': 'false',
        'symptomChestPain': 'false',
        'symptomDOE': 'false',
        'symptomPalp': 'false',
        'symptomPND': 'false',
        'symptomDiaphore': 'false',
      },
      'x',
    );

    testWidgets('renders correctly.', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: ReviewOfSystemsItemWidget(
            streamController: streamController,
            decodedSystem: _sampleDecodedSystem,
          ));

      // verify ui renders correctly
      expect(find.text('X'), findsOneWidget);
      expect(find.text('No notes'), findsNothing);
      expect(find.text('Doctor\'s notes'), findsOneWidget);
      expect(find.byType(ReviewOfSystemTitleBar), findsOneWidget);
    });

    testWidgets('works correctly when isNormalSystem is true',
        (WidgetTester tester) async {
      final DecodedSystem noneKnownDecodedSystem = DecodedSystem(
        const <String, dynamic>{
          'description': 'something',
          'symptomNoneKnown': 'true',
          'symptomEdema': 'false',
          'symptomChestPain': 'false',
          'symptomDOE': 'false',
          'symptomPalp': 'false',
          'symptomPND': 'false',
          'symptomDiaphore': 'false',
        },
        'x',
      );
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: ReviewOfSystemsItemWidget(
            streamController: streamController,
            decodedSystem: noneKnownDecodedSystem,
          ));

      // verify ui renders correctly
      expect(find.byType(SymptomWidget), findsOneWidget);
      expect(find.text('X'), findsOneWidget);
      expect(find.text('No notes'), findsNothing);
      expect(find.text('Doctor\'s notes'), findsOneWidget);
      expect(find.byType(ReviewOfSystemTitleBar), findsOneWidget);
    });
  });
}

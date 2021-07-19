import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_results.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets(
    'should show loading indicator when searching for a diagnosis',
    (WidgetTester tester) async {
      final StreamController<dynamic> streamController =
          StreamController<dynamic>.broadcast();

      final Stream<dynamic> _stream =
          streamController.stream.asBroadcastStream();

      _stream.listen((dynamic event) {});

      expectLater(
        _stream,
        emitsInOrder(<dynamic>[
          <String, dynamic>{'loading': true}
        ]),
      );

      await buildTestWidget(
        tester: tester,
        widget: DrawerSearchResults(
          resultsStream: _stream,
          onSelectCallback: () {},
          storeItemID: SidePaneProblemStore().problemID,
          storeItemName: SidePaneProblemStore().problemName,
          storeItemDisplay: null,
          helpWidgetItemName: 'diagnosis',
        ),
      );

      streamController.add(<String, dynamic>{'loading': true});
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);

      addTearDown(() {
        streamController.close();
      });
    },
  );
}

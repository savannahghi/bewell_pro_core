// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_help_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/result_not_found.dart';

void main() {
  group('Drawer Utils', () {
    Store<CoreState> store;
    final CoreState state = CoreState.initial();
    store = Store<CoreState>(initialState: state);

    testWidgets('DrawerHelpWidget renders & works',
        (WidgetTester tester) async {
      const String helpString = 'x';
      final Widget testWidget = StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: AppBrand().appName.value,
          graphQLClient: GraphQlClient('', ''),
          appContexts: testAppContexts,
          child: const MaterialApp(
            home: Scaffold(
                body: DrawerHelpWidget(
              helpString: helpString,
            )),
          ),
        ),
      );
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.byKey(AppWidgetKeys.drawerHelpWidget), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('ResultsNotFound renders', (WidgetTester tester) async {
      final Widget testWidget = StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: AppBrand().appName.value,
          graphQLClient: GraphQlClient('', ''),
          appContexts: testAppContexts,
          child: MaterialApp(
            home: Scaffold(body: ResultsNotFound()),
          ),
        ),
      );
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(ResultsNotFound), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(resultsNotFoundFirstMsg), findsOneWidget);
      expect(find.text(resultsNotFoundSecondMsg), findsOneWidget);
    });
  });
}

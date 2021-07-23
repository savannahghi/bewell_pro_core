import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/widgets/default_error_route.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:shared_ui_components/buttons.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('RouteGeneratoe', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    testWidgets('should navigate to DefaultErrorRoute',
        (WidgetTester tester) async {
      const Route<dynamic>? Function(RouteSettings settings) routeGenerator =
          RouteGenerator.generateRoute;

      const RouteSettings settings = RouteSettings(
        name: '',
      );

      final MaterialPageRoute<DefaultErrorRoute> defaultErrorRoute =
          routeGenerator(settings)! as MaterialPageRoute<DefaultErrorRoute>;

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            text: 'press',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                '',
              );
            },
          );
        }),
      );
      await tester.pump();
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(defaultErrorRoute, isA<MaterialPageRoute<DefaultErrorRoute>>());
      expect(find.text(errorOccurred), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.goBackButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.goBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(phoneLoginTitle), findsOneWidget);
    });
  });
}

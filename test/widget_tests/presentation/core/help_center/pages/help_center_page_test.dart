import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('HelpCenter test', () {
    late Store<CoreState> store;

    setUpAll(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('Call button should navigate when pressed',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: const HelpCenterPage(),
        );

        expect(find.byType(ListView), findsOneWidget);

        await tester.pumpAndSettle();
        final Finder callWidget = find.byKey(AppWidgetKeys.helpCenterCallKey);
        expect(callWidget, findsOneWidget);

        await tester.tap(callWidget);
      });
    });

    testWidgets('WhatsApp button should navigate when pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const HelpCenterPage(),
      );

      final Finder whatsAppWidget =
          find.byKey(AppWidgetKeys.helpCenterWhatsAppKey);
      expect(whatsAppWidget, findsOneWidget);

      await tester.tap(whatsAppWidget);
    });

    testWidgets('should render correctly on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const HelpCenterPage(),
      );

      final Finder whatsAppWidget =
          find.byKey(AppWidgetKeys.helpCenterWhatsAppKey);
      expect(whatsAppWidget, findsOneWidget);

      await tester.tap(whatsAppWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}

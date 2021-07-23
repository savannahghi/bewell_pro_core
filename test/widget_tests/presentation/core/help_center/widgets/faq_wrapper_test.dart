import 'dart:convert';

import 'package:async_redux/async_redux.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/faq_card.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/faq_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('FAQWrapper', () {
    late Store<CoreState> store;

    setUpAll(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('should render faqs when they exist',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: FAQWrapper(),
      );

      await tester.pump();
      expect(find.byType(FAQCard), findsOneWidget);
    });

    testWidgets(
        'GenericEmptyData should render GenericEmptyData'
        ' when faqs are empty', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'getFaqsContent': <dynamic>[]}
              },
            ),
            200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pumpAndSettle();
      final Finder genericEmptyDataWidget = find.byType(GenericEmptyData);
      expect(genericEmptyDataWidget, findsOneWidget);
    });

    testWidgets('shows a loading indicator when fetching FAQs from the backend',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'loading': true}
              },
            ),
            200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pump();
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets(
        'should show generic empty data widget when there is an '
        ' error while fetching FAQs', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{'error': 'no faqs for you'}), 200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      expect(find.byType(GenericEmptyData), findsOneWidget);
    });

    testWidgets(
        'shows a loading indicator when fetching FAQs from the backend on a '
        ' large screen', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'loading': true}
              },
            ),
            200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pump();
      expect(find.byType(SILPlatformLoader), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should show timeout widget when there is a timeout while'
        ' fetching FAQs', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pumpAndSettle();
      final Finder genericTimeoutWidget = find.byType(GenericTimeoutWidget);
      expect(genericTimeoutWidget, findsOneWidget);
    });

    testWidgets(
        'should retry FAQ fetch when there is a timeout while fetching FAQs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pump();
      final Finder genericNoDataWidget = find.byType(GenericTimeoutWidget);
      expect(genericNoDataWidget, findsOneWidget);

      final Finder retryWidget = find.text('Retry');
      expect(retryWidget, findsOneWidget);

      await tester.tap(retryWidget);
      await tester.pumpAndSettle();

      expect(genericNoDataWidget, findsOneWidget);
    });
  });
}

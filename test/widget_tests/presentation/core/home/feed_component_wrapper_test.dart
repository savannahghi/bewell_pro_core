// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sghi_core/user_feed/src/presentation/preloaders/feed_preloaders.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/feed_component_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('FeedComponentWrapper', () {
    testWidgets(
      'renders GenericTimeoutWidget if response error is timeout',
      (WidgetTester tester) async {
        await mockNetworkImages(() async {
          final MockShortGraphQlClient graphQlClient =
              MockShortGraphQlClient.withResponse(
                  'idToken',
                  'endpoint',
                  http.Response(
                      json.encode(<String, String>{'error': 'timeout'}), 200));
          await buildTestWidget(
            tester: tester,
            graphQlClient: graphQlClient,
            widget: const SingleChildScrollView(
                child: FeedComponentWrapper(
              feedContentCallbacks: <String, Function>{},
            )),
          );

          // This additional pump is used to ensure that the broadcast updates the subscribed widget
          await tester.pump();

          expect(find.byType(GenericTimeoutWidget), findsOneWidget);
          expect(find.byKey(AppWidgetKeys.genericTimeOutKey), findsOneWidget);

          await tester.tap(find.byKey(AppWidgetKeys.genericTimeOutKey));
          await tester.pump();

          expect(find.byType(GenericTimeoutWidget), findsOneWidget);
          expect(find.byKey(AppWidgetKeys.genericTimeOutKey), findsOneWidget);
        });
      },
    );

    testWidgets(
      'renders FeedLoadingShimmer when fetching the feed',
      (WidgetTester tester) async {
        await mockNetworkImages(() async {
          final MockShortGraphQlClient graphQlClient =
              MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            http.Response(
                json.encode(<String, dynamic>{
                  'data': <String, dynamic>{'loading': true}
                }),
                200),
          );
          await buildTestWidget(
            tester: tester,
            graphQlClient: graphQlClient,
            widget: const SingleChildScrollView(
              child: FeedComponentWrapper(
                feedContentCallbacks: <String, Function>{},
              ),
            ),
          );

          await tester.pump();

          expect(find.byType(FeedLoadingShimmer), findsOneWidget);
        });
      },
    );
  });
}

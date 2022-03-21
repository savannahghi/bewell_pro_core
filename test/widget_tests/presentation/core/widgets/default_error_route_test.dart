// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/core/widgets/default_error_route.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('sil 404 widget', (WidgetTester tester) async {
    AppBrand()
      ..appLogo.add(beWellWhiteIconUrl)
      ..appLogo2.add(beWellWhiteIconUrl);

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        widget: const Scaffold(
          body:
              DefaultErrorRoute(whereToUrl: homePageRoute, whereToText: 'home'),
        ),
      );

      /// Verify UI renders
      expect(find.text(errorFindingResults), findsOneWidget);
      expect(find.text(errorOccurred), findsOneWidget);
      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(SILSecondaryButton), findsOneWidget);

      /// Tap Go back Button
      await tester.tap(find.byKey(AppWidgetKeys.goBackButtonKey));
      await tester.pumpAndSettle();

      /// Verify navigates
      expect(find.byType(DefaultErrorRoute), findsNothing);
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}

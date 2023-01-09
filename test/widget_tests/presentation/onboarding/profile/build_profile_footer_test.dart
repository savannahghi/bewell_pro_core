// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/build_profile_footer.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('BuildProfileFooter', () {
    Store<CoreState> store;
    final CoreState state = CoreState.initial();
    store = Store<CoreState>(initialState: state);

    testWidgets('should log out the user correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const BuildProfileFooter(),
      );

      expect(find.text(bewellCopyrightString), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.userProfileLogoutBtn), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.userProfileLogoutBtn));
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
      expect(find.byType(BuildProfileFooter), findsNothing);
    });

    testWidgets('should show AfyaMoja copyright correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        appContexts: <AppContext>[AppContext.AfyaMoja, AppContext.AppTest],
        widget: const BuildProfileFooter(),
      );

      expect(find.text(afyaMojaCopyrightString), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.userProfileLogoutBtn), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.userProfileLogoutBtn));
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
      expect(find.byType(BuildProfileFooter), findsNothing);
    });
  });
}

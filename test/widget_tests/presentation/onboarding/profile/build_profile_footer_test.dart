import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/build_profile_footer.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  Store<AppState> store;
  final AppState state = AppState.initial();
  store = Store<AppState>(initialState: state);

  testWidgets('BuildProfileFooter logs out user correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
        store: store, tester: tester, widget: BuildProfileFooter());

    expect(find.byKey(AppWidgetKeys.userProfileLogoutBtn), findsOneWidget);
    await tester.tap(find.byKey(AppWidgetKeys.userProfileLogoutBtn));
    await tester.pumpAndSettle();

    expect(find.byType(PhoneLoginPage), findsOneWidget);
    expect(find.byType(BuildProfileFooter), findsNothing);
  });
}

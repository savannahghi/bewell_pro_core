// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_user_names_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/user_names_form.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group(' SetUserNames page', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    const String update_names_flag = 'update_names_flag';

    testWidgets('should test the SetUserNames page renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetUserNamesPage(),
      );

      expect(find.text(tellUsWhoYouAreString), findsOneWidget);
      expect(find.text(tellUsWhoYouAreMessage), findsOneWidget);
      expect(find.byType(UserNamesForm), findsOneWidget);
    });

    testWidgets('displays error message when value is empty',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetUserNamesPage(),
      );

      expect(find.byType(UserNamesForm), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldFNameKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldLNameKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();

      expect(find.text(firstNameRequired), findsOneWidget);
      expect(find.text(lastNameRequired), findsOneWidget);
    });

    testWidgets('saves text when text is changed', (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.remove(
        update_names_flag,
        ref: '${update_names_flag}_ref',
      ));

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetUserNamesPage(),
      );

      expect(find.byType(UserNamesForm), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldFNameKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldLNameKey), findsOneWidget);

      await tester.enterText(
          find.byKey(AppWidgetKeys.silTextFieldFNameKey), 'firstName');
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.silTextFieldLNameKey), 'lastName');
      await tester.pump();
    });

    testWidgets('displays loader when prefix is waiting',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.add(
        update_names_flag,
        ref: '${update_names_flag}_ref',
      ));

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetUserNamesPage(),
      );

      expect(find.byType(UserNamesForm), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldFNameKey), findsOneWidget);

      expect(find.byWidget(largeVerticalSizedBox), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('saves when prefix is not waiting',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      store.dispatch(WaitAction<CoreState>.remove(
        update_names_flag,
        ref: '${update_names_flag}_ref',
      ));

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetUserNamesPage(),
      );

      expect(find.byType(UserNamesForm), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silTextFieldFNameKey), findsOneWidget);

      await tester.enterText(
          find.byKey(AppWidgetKeys.silTextFieldFNameKey), 'firstName');
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.silTextFieldLNameKey), 'lastName');
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();
    });
  });
}

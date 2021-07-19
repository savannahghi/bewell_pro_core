import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/profile_detail.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('ProfileDetail', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('should render coming soon loader',
        (WidgetTester tester) async {
      final ProfileSubject profileSubject = ProfileSubject();
      profileSubject.selection.add(
        ValueNotifier<ProfileItem>(
          const ProfileItem(
              text: 'SOMETHING',
              section: ProfileItemType.account,
              onTapRoute: profileContactDetailsRoute,
              isComingSoon: true),
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: Row(
          children: <Widget>[
            ProfileDetail(
              selection: profileSubject.selection.value,
            ),
          ],
        ),
        store: store,
      );

      expect(find.text(comingSoonText), findsOneWidget);
    });

    testWidgets('should render sizedbox', (WidgetTester tester) async {
      final ProfileSubject profileSubject = ProfileSubject();
      profileSubject.selection.add(
        ValueNotifier<ProfileItem>(
          const ProfileItem(
              text: 'SOMETHING',
              section: ProfileItemType.account,
              onTapRoute: profileContactDetailsRoute),
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: Row(
          children: <Widget>[
            ProfileDetail(
              selection: profileSubject.selection.value,
            ),
          ],
        ),
        store: store,
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should render tabletWidget', (WidgetTester tester) async {
      final ProfileSubject profileSubject = ProfileSubject();
      profileSubject.selection.add(
        ValueNotifier<ProfileItem>(
          const ProfileItem(
            text: 'SOMETHING',
            section: ProfileItemType.account,
            onTapRoute: profileContactDetailsRoute,
            tabletWidget: Text('tabletwidget'),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: Row(
          children: <Widget>[
            ProfileDetail(
              selection: profileSubject.selection.value,
            ),
          ],
        ),
        store: store,
      );

      expect(find.text('tabletwidget'), findsOneWidget);
    });
  });
}

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';

void main() {
  group('ProfileContactDetails', () {
    const String exampleRoute = 'exampleRoute';

    test('Profile Items are correctly', () {
      const ProfileItem myItem = ProfileItem(
          onTapRoute: exampleRoute,
          text: 'Test',
          section: ProfileItemType.account,
          isComingSoon: true);
      expect(myItem.section, isNotNull);
      expect(myItem.onTapRoute, exampleRoute);
      expect(myItem.text, isA<String>());
      expect(myItem.text, 'Test');
      expect(myItem.isComingSoon, true);
    });

    test('Profile Items should load non flagged items', () {
      const ProfileItem myItem = ProfileItem(
        onTapRoute: exampleRoute,
        text: 'Test',
        section: ProfileItemType.account,
      );
      expect(myItem.isComingSoon, false);
    });
  });
}

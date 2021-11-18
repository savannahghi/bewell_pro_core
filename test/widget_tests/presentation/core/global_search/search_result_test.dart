// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/core/global_search/models/search_result.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

void main() {
  test('search result is correct', () {
    final SearchResult result = SearchResult(
      name: userProfile,
      route: userProfileRoute,
      image: SvgPicture.asset(userProfileIconUrl, height: 80, width: 80),
      aliases: <String>[
        'profile',
        'prof',
        'my profile',
        'user profile',
        'profile info',
        'profile information'
      ],
      onTap: (BuildContext context) {
        const Text('tapped');
      },
    );
    expect(result.aliases, isNotNull);
    expect(result.name, userProfile);
    expect(result.route, userProfileRoute);
    expect(result.onTap, isNotNull);
  });
}

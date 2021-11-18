// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/core/global_search/models/search_suggestion.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

void main() {
  test('search suggestion is correct', () {
    final SearchSuggestion result = SearchSuggestion(
      name: helpCenter,
      route: helpCenterPageRoute,
      image: SvgPicture.asset(userProfileIconUrl, height: 80, width: 80),
      aliases: <String>[
        'help',
        'help center',
        'center',
        'need help',
        'FAQS',
        'faqs',
        'FAQ',
        'faq'
      ],
      onTap: (BuildContext context) {
        const Text('Tapped');
      },
    );
    expect(result.aliases, isNotNull);
    expect(result.name, helpCenter);
    expect(result.route, helpCenterPageRoute);
    expect(result.onTap, isNotNull);
  });
}

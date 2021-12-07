// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class SearchSuggestion {
  String name;
  String? route;
  String? role;
  SvgPicture image;
  List<String> aliases;
  NavigateToSearchResult onTap;

  SearchSuggestion({
    required this.name,
    required this.route,
    required this.image,
    required this.aliases,
    required this.onTap,
    this.role,
  });
}

List<SearchSuggestion> recentSearches = <SearchSuggestion>[
  SearchSuggestion(
    name: helpCenter,
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
    image: SvgPicture.asset(helpTabIconUrl, color: Colors.grey),
    onTap: (BuildContext context) async {
      triggerNavigationEvent(context: context, route: helpCenterPageRoute);
    },
    route: helpCenterPageRoute,
  ),
  SearchSuggestion(
    name: userProfile,
    aliases: <String>[
      'profile',
      'prof',
      'my profile',
      'user profile',
      'profile info',
      'profile information'
    ],
    image: SvgPicture.asset(patientsTabIconUrl, color: Colors.grey),
    onTap: (BuildContext context) async {
      triggerNavigationEvent(context: context, route: userProfileRoute);
    },
    route: userProfileRoute,
  ),
];

List<SearchSuggestion> searchSuggestions = <SearchSuggestion>[
  //help
  SearchSuggestion(
    name: helpCenter,
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
    image: SvgPicture.asset(helpTabIconUrl, color: Colors.grey),
    onTap: (BuildContext context) async {
      triggerNavigationEvent(context: context, route: helpCenterPageRoute);
    },
    route: helpCenterPageRoute,
  ),

  //profile
  SearchSuggestion(
    name: userProfile,
    aliases: <String>[
      'profile',
      'prof',
      'my profile',
      'user profile',
      'profile info',
      'profile information'
    ],
    image: SvgPicture.asset(patientsTabIconUrl, color: Colors.grey),
    onTap: (BuildContext context) async {
      triggerNavigationEvent(context: context, route: userProfileRoute);
    },
    route: userProfileRoute,
  ),

  //find patient
  SearchSuggestion(
    name: patientFind,
    role: patientRole,
    aliases: <String>[
      'find a patient',
      'find patient',
      'find my patient',
      'patient find',
      'search patient',
      'search for a patient',
      'search a patient',
      'patient search'
    ],
    image: SvgPicture.asset(patientsTabIconUrl, color: Colors.grey),
    onTap: (BuildContext context) async =>
        triggerNavigationEvent(context: context, route: patientsPageRoute),
    route: patientsPageRoute,
  ),

  // add patient
  SearchSuggestion(
    name: patientAdd,
    role: patientRole,
    route: addPatientRoute,
    aliases: <String>[
      'add a patient',
      'add patient',
      'add my patient',
      'patient add',
      'register patient',
      'patient registration',
      'register a patient',
      'patient register'
    ],
    image: SvgPicture.asset(editIcon, color: Colors.grey),
    onTap: (BuildContext context) async =>
        triggerNavigationEvent(context: context, route: addPatientRoute),
  ),
];

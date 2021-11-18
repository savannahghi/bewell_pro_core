// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class SearchResult {
  SearchResult({
    required this.name,
    required this.route,
    required this.image,
    required this.aliases,
    required this.onTap,
    this.role,
  });

  List<String> aliases;
  SvgPicture image;
  String name;
  NavigateToSearchResult onTap;
  String? route;
  String? role;
}

double searchIconHeight = 80.0;

final String appName = AppBrand().appName.value;

List<SearchResult> searchResults = <SearchResult>[
  SearchResult(
    name: '$appName $helpCenter',
    route: helpCenterPageRoute,
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
    image: SvgPicture.asset(helpSearchIcon,
        height: searchIconHeight, width: searchIconHeight),
    onTap: (BuildContext context) async {
      await Navigator.of(context, rootNavigator: true)
          .pushNamed(helpCenterPageRoute);
    },
  ),

  //profile
  SearchResult(
    name: userProfile,
    // route: profileRoute,
    aliases: <String>[
      'profile',
      'prof',
      'my profile',
      'user profile',
      'profile info',
      'profile information'
    ],
    image: SvgPicture.asset(userProfileIconUrl,
        height: searchIconHeight, width: searchIconHeight),
    onTap: (BuildContext context) async {
      await Navigator.of(context, rootNavigator: true)
          .pushNamed(userProfileRoute);
    },
    route: '',
  ),

  //find patient
  SearchResult(
    name: patientFind,
    route: patientsPageRoute,
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
    image: SvgPicture.asset(findPatientIconUrl,
        height: searchIconHeight, width: searchIconHeight),
    onTap: (BuildContext context) =>
        triggerNavigationEvent(context: context, route: patientsPageRoute),
  ),

  // add patient
  SearchResult(
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
      image: SvgPicture.asset(addPatientIconUrl,
          height: searchIconHeight, width: searchIconHeight),
      onTap: (BuildContext context) =>
          triggerNavigationEvent(context: context, route: addPatientRoute)),
];

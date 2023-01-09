// Package imports:
import 'package:sghi_core/domain_objects/entities/navigation_icon.dart';
import 'package:sghi_core/domain_objects/entities/navigation_item.dart';
import 'package:sghi_core/domain_objects/entities/navigation_nested_item.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

List<NavigationItem> navigationItems() => <NavigationItem>[
      NavigationItem(
          icon: NavigationIcon(iconUrl: patientNavDrawerIconUrl),
          title: navDrawerPatientText,
          isFavourite: false,
          nestedItems: <NavigationNestedItem>[
            NavigationNestedItem(
              title: navDrawerPatientRegistrationText,
              route: addPatientRoute,
            ),
            NavigationNestedItem(
              title: navDrawerPatientIdentificationText,
              route: patientsPageRoute,
            )
          ]),
      NavigationItem(
          icon: NavigationIcon(iconUrl: helpNavDrawerIconUrl),
          title: navDrawerGetHelpText,
          isFavourite: false,
          route: helpCenterPageRoute),
    ];

import 'package:domain_objects/entities.dart';
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

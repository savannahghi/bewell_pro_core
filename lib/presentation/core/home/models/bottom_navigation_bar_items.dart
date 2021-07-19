import 'package:domain_objects/entities.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

final List<NavigationItem> defaultNavItems = <NavigationItem>[
  NavigationItem(
      icon: NavigationIcon(
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/home_navaction.png',
          iconTitle: navHomeText,
          iconDescription: homeIconDescription),
      title: navHomeText,
      isFavourite: false,
      route: homePageRoute),
  NavigationItem(
      title: navGetHelpText,
      route: helpCenterRoute,
      icon: NavigationIcon(
        iconUrl: 'https://assets.healthcloud.co.ke/actions//help_navaction.png',
      ),
      isFavourite: true),
];

List<NavigationItem> defaultSecondaryNavItems = <NavigationItem>[
  NavigationItem(
      title: navDrawerPatientText,
      route: '',
      icon: NavigationIcon(
        iconUrl:
            'https://assets.healthcloud.co.ke/actions/patient_navaction.png',
      ),
      nestedItems: <NavigationNestedItem>[
        NavigationNestedItem(
          title: patientRegistrationStep,
          route: addPatientRoute,
        ),
        NavigationNestedItem(
          title: patientIdentificationTitle,
          route: patientsPageRoute,
        ),
      ]),
];

/// the organization in this enum must march that of [bottomNavigationItems]
/// above for this to work
enum BottomNavIndex {
  home,
  patients,
  messages,
  schedule,
  screening,
  help,
  patient_reg,
}

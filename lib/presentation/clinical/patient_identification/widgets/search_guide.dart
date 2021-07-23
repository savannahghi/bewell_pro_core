import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/guide_box.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [EmptySearchScreen] is used to display the search guide, which
/// is used to help practitioners search for patients

class SearchGuide extends StatelessWidget {
  List<Widget> vertical(BuildContext context) {
    double padding = ResponsiveWidget.preferredPaddingOnStretchedScreens(
        context: context);
    final List<NavigationItem> secondaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions!;
    if (ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile &&
        secondaryActions.isNotEmpty) {
      padding = number20;
    }

    return <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: const SizedBox(
          height: 200,
          child: GuideBox(
            title: searchTitle,
            iconData: Icons.search,
            description: searchDescription,
          ),
        ),
      ),
      smallVerticalSizedBox,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: const SizedBox(
          height: 200,
          child: GuideBox(
            title: selectPatient,
            iconData: Icons.list,
            description: pickPatientFromResult,
          ),
        ),
      ),
      smallVerticalSizedBox,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: const SizedBox(
          height: 200,
          child: GuideBox(
            title: startVisitTitle,
            iconData: Icons.lock_open,
            description: startWithOTP,
          ),
        ),
      ),
    ];
  }

  List<Widget> horizontal() {
    return <Widget>[
      const Expanded(
        child: GuideBox(
          title: searchTitle,
          iconData: Icons.search,
          description: searchDescription,
        ),
      ),
      mediumHorizontalSizedBox,
      const Expanded(
        child: GuideBox(
          title: selectPatient,
          iconData: Icons.list,
          description: pickPatientFromResult,
        ),
      ),
      mediumHorizontalSizedBox,
      const Expanded(
        child: GuideBox(
          title: startVisitTitle,
          iconData: Icons.lock_open,
          description: startWithOTP,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<NavigationItem> secondaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions!;
    final bool isSmall =
        ResponsiveWidget.deviceType(context) == DeviceScreensType.Mobile;
    final bool isTabletWithDrawer =
        ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile &&
            secondaryActions.isNotEmpty;

    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            mediumVerticalSizedBox,
            Divider(color: grey.withOpacity(0.8)),
            verySmallVerticalSizedBox,
            Text(
              findPatientGuide,
              style: TextThemes.boldSize16Text(),
            ),
            verySmallVerticalSizedBox,
            Text(
              startVisitPrompt,
              style: TextThemes.normalSize14Text(Colors.black87),
              textAlign: TextAlign.center,
            ),
            mediumVerticalSizedBox,
            if (isSmall || isTabletWithDrawer) ...vertical(context),
            if (!isSmall && !isTabletWithDrawer)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: horizontal(),
              ),
          ],
        ),
      ],
    );
  }
}

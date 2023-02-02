// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/theme/colors.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/brand_logo.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/landing_actions.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/landing_page_image.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

/// [LandingPage] for Bewell pro app.
///
/// Renders the following:
/// - [LandingActions] which provides navigation buttons to user that lead to:
///   - 1 => phoneSignupRoute
///   - 2 => phoneLoginRoute
///
/// - Renders BeWell's [termsAndConditions] from `user_profile`
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    /// Sends Initial event
    final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
    firebaseAnalytics.logAppOpen();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ...circles(context),
            Positioned(
              top: dimension,
              left: dimension,
              right: dimension,
              bottom: dimension,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveWidget.preferredPaddingOnStretchedScreens(
                                context: context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          spacing: 30,
                          runSpacing: 40,
                          children: <Widget>[
                            if (!ResponsiveWidget.isSmallScreenAndOnLandscape(
                                context: context))
                              LandingPageImage()
                            else
                              smallVerticalSizedBox,
                            Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      landingPageTitle,
                                      textAlign: TextAlign.center,
                                      style:
                                          TextThemes.heavySize24Text().copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    mediumVerticalSizedBox,
                                    Text(
                                      landingPageSubtitle,
                                      textAlign: TextAlign.center,
                                      style:
                                          TextThemes.boldSize18Text().copyWith(
                                        color: greyTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                veryLargeVerticalSizedBox,
                                LandingActions(),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              key: AppWidgetKeys.termsAndConditionsKey,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: isLargeScreen
                    ? const EdgeInsets.symmetric(horizontal: 30, vertical: 5)
                    : const EdgeInsets.all(0),
                child: termsAndConditions(context),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: BrandLogo(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget termsAndConditions(BuildContext context,
    [TextAlign align = TextAlign.center]) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: landingTerms,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.grey),
          ),
          TextSpan(
            text: landingTAndC,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontStyle: FontStyle.normal,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                final List<AppContext> appContext =
                    AppWrapperBase.of(context)!.appContexts;

                String? termsUrl;
                if (appContext.contains(AppContext.AfyaMoja)) {
                  termsUrl = afyaMojaTermsUrl;
                }

                triggerNavigationEvent(
                    context: context,
                    route: termsAndConditionsRoute,
                    args: termsUrl);
              },
          ),
        ],
      ),
      textAlign: align,
    ),
  );
}

List<Widget> circles(BuildContext context) {
  const double circleSize = 1000;
  const double circleOffscreenSize = -500;
  return <Widget>[
    Positioned(
      top: circleOffscreenSize,
      left: circleOffscreenSize,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.04),
        ),
      ),
    ),
    Positioned(
      top: circleOffscreenSize - 120,
      left: circleOffscreenSize + 100,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(onboardingBackgroundImage),
            ),
          ),
        ),
      ),
    ),
  ];
}

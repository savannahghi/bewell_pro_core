import 'package:flutter/material.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/landing_page.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// Generic Class used in various pages.
///
/// This Widget acts as a wrapper for most of the pages in onboarding.
/// It is used to provide a customized look, as an initial scaffold when rendering the pages.
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    Key? key,
    required this.dimension,
    required this.title,
    this.msg,
    required this.icon,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final double dimension;
  final IconData icon;
  final String? msg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ...circles(context),
        Positioned(
          top: dimension,
          left: dimension,
          right: dimension,
          bottom: dimension,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 400,
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: <Widget>[
                    size40VerticalSizedBox,
                    if (!SILResponsiveWidget.isSmallScreenAndOnLandscape(
                        context: context)) ...<Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 250,
                        height: MediaQuery.of(context).size.width - 250,
                        constraints:
                            const BoxConstraints(maxWidth: 200, maxHeight: 200),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.3),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Theme.of(context).primaryColor.withOpacity(0.3),
                              Theme.of(context).primaryColor.withOpacity(0.3)
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            icon,
                            size: 80,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                      mediumVerticalSizedBox,
                    ],
                    Text(
                      title,
                      style: TextThemes.boldSize22Text(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    if (msg != null) ...<Widget>[
                      mediumVerticalSizedBox,
                      Text(
                        msg!,
                        textAlign: TextAlign.center,
                        style:
                            TextThemes.normalSize16Text().copyWith(height: 1.5),
                      ),
                    ],
                    size40VerticalSizedBox,
                    child,
                    if (!Navigator.canPop(context)) mediumVerticalSizedBox
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

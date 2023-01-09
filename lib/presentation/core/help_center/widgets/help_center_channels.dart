// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/constants.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/circular_background_icons.dart';

class HelpCenterChannels extends StatelessWidget {
  const HelpCenterChannels();

  @override
  Widget build(BuildContext context) {
    final double contactSectionWidth = ResponsiveWidget.isLargeScreen(context)
        ? MediaQuery.of(context).size.width * 0.5
        : double.infinity;

    return SizedBox(
      width: contactSectionWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
              key: AppWidgetKeys.helpCenterCallKey,
              onTap: () {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: silPhoneNumber,
                );
                launchUrl(launchUri);
              },
              child: Column(
                children: <Widget>[
                  const CircularBackGroundIcons(
                    backgroundColor: healthcloudPrimaryColor,
                    iconBackgroundPadding: 16,
                    loadIcon: UniconsLine.phone,
                  ),
                  smallVerticalSizedBox,
                  Text(
                    helpCenterCallText,
                    style: TextThemes.veryBoldSize16Text(
                      Colors.black,
                    ),
                  )
                ],
              )),
          GestureDetector(
            key: AppWidgetKeys.helpCenterWhatsAppKey,
            onTap: () => launchWhatsApp(
              message: '',
              phone: kWhatsAppNumber,
              launch: launchUrl(
                Uri.parse('https://wa.me/$kWhatsAppNumber?text=Hello'),
                mode: LaunchMode.externalApplication,
              ),
            ),
            child: Column(
              children: <Widget>[
                const CircularBackGroundIcons(
                  backgroundColor: healthcloudPrimaryColor,
                  iconBackgroundPadding: 16,
                  loadIcon: UniconsLine.whatsapp,
                ),
                smallVerticalSizedBox,
                Text(
                  helpCenterWhatsAppText,
                  style: TextThemes.veryBoldSize16Text(
                    Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

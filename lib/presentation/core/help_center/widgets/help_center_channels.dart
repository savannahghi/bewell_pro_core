import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/circular_background_icons.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:misc_utilities/string_constant.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterChannels extends StatelessWidget {
  const HelpCenterChannels();

  @override
  Widget build(BuildContext context) {
    final double contactSectionWidth =
        SILResponsiveWidget.isLargeScreen(context)
            ? MediaQuery.of(context).size.width * 0.5
            : double.infinity;

    return SizedBox(
      width: contactSectionWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
              key: AppWidgetKeys.helpCenterCallKey,
              onTap: () => launch(silPhoneNumber),
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
                launch:
                    launch(whatsAppUrl(phone: kWhatsAppNumber, message: ''))),
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

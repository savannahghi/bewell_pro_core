// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
// Package imports:
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/colors.dart';

class DrawerAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            /// [DrawerHeader]
            //closes navigation drawer
            if (ResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: number10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      AppBrand().appLogo2.value,
                      height: number50,
                      width: number50,
                    ),
                    IconButton(
                      key: AppWidgetKeys.navDrawerCloseKey,
                      splashColor: healthcloudPrimaryColor,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white70,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white38,
              tabs: <Widget>[
                Tab(text: allItemsText),
                Tab(text: favoritesText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

class DrawerAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                    SvgPicture.asset(
                      bewellLogo,
                      height: number50,
                      width: number50,
                    ),
                    IconButton(
                      key: AppWidgetKeys.navDrawerCloseKey,
                      splashColor: healthcloudPrimaryColor,
                      icon: const Icon(Icons.close, color: Colors.black54),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            smallVerticalSizedBox,
            const TabBar(
              indicatorColor: Colors.transparent,
              labelColor: healthcloudPrimaryColor,
              unselectedLabelColor: Colors.black54,
              tabs: <Widget>[
                Tab(text: 'All Items'),
                Tab(text: 'Favorite'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// This class is the [profile footer]
/// It holds the widgets for copyright declaration and current year
class BuildProfileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () => logoutUser(context),
            key: AppWidgetKeys.userProfileLogoutBtn,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        logoutText,
                        style: TextThemes.boldSize14Text(Colors.red),
                      ),
                    ],
                  ),
                  const Icon(CupertinoIcons.chevron_right, size: 20),
                ],
              ),
            ),
          );
        }),
        Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  copyrightString,
                  style: TextThemes.normalSize10Text(Colors.grey),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Center(
                child: Text(
                  '$appVersionString $APPVERSION',
                  style: TextThemes.normalSize9Text(Colors.grey),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

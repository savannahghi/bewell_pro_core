import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

class SelfNextOfKinSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: AppWidgetKeys.selfNextOfKinContainerKey,
      width: double.infinity,
      height: 400,
      decoration:
          BoxDecoration(border: Border.all(color: black.withOpacity(0.16))),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: <Widget>[
          largeVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage(medicalRecordIconUrl),
                    height: 100.0,
                    width: 100.0,
                    color: healthcloudAccentColor,
                  ),
                  size15VerticalSizedBox,
                  Column(
                    children: <Widget>[
                      Text(cannotRegisterYourself,
                          style: Theme.of(context).textTheme.subtitle1),
                      smallVerticalSizedBox,
                      Text(searchDiffNumber,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: black.withOpacity(0.6))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

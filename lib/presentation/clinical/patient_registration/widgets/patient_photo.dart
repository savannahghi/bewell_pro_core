import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

class PatientPhoto extends StatelessWidget {
  final File? profileImage;
  final Function? takePhotoCallback;

  final String? userType;

  const PatientPhoto({
    this.userType,
    this.profileImage,
    this.takePhotoCallback,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Row(
      children: <Widget>[
        Container(
          child: profileImage != null
              ? Container(
                  key: AppWidgetKeys.basicDetailsPhotoContainerKey,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(profileImage!),
                    ),
                  ),
                )
              : const CircleAvatar(
                  key: AppWidgetKeys.noProfilePhotKey,
                  radius: 56,
                  backgroundColor: white,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 54,
                  ),
                ),
        ),
        size15HorizontalSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: isSmallScreen ? 180 : null,
              child: Text(capturePhoto(userType!)),
            ),
            smallVerticalSizedBox,
            SILSecondaryButton(
              buttonKey: AppWidgetKeys.basicDetailsPhotoButtonKey,
              buttonColor: Colors.grey[100],
              onPressed: takePhotoCallback,
              text: profileImage == null ? takePhotoText : retakePhotoText,
              textColor: grey,
              borderColor: grey,
              customChild: Row(
                children: <Widget>[
                  const Icon(Icons.camera_alt, color: grey),
                  smallHorizontalSizedBox,
                  Text(
                    profileImage == null ? takePhotoText : retakePhotoText,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

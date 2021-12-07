// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import 'image_source_icon.dart';

class CameraSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        width: isSmallScreen
            ? MediaQuery.of(context).size.width * 0.2
            : MediaQuery.of(context).size.width * 0.35,
        child: Padding(
          padding: isSmallScreen
              ? const EdgeInsets.symmetric(vertical: 15, horizontal: 15)
              : const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text(selectSource, style: PatientStyles.textFormHintText),
              if (isSmallScreen)
                size15VerticalSizedBox
              else
                largeVerticalSizedBox,
              Row(
                children: <Widget>[
                  SourceIcon(
                    onSourceSelected: () {
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                    imgPath: cameraIconUrl,
                    sourceText: cameraText,
                  ),
                  size15HorizontalSizedBox,
                  SourceIcon(
                    onSourceSelected: () {
                      Navigator.of(context).pop(ImageSource.gallery);
                    },
                    imgPath: galleryIconUrl,
                    sourceText: galleryText,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

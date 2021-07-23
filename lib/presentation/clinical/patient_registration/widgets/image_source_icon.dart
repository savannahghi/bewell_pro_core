import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/colors.dart';

class SourceIcon extends StatelessWidget {
  final VoidCallback onSourceSelected;
  final String imgPath;
  final String sourceText;

  const SourceIcon({
    required this.onSourceSelected,
    required this.imgPath,
    required this.sourceText,
  });
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    final Size cardDimensions =
        isSmallScreen ? const Size(100, 100) : const Size(140, 160);
    final Size sourceIconDimensions =
        isSmallScreen ? const Size(40, 40) : const Size(80, 80);

    return GestureDetector(
      key: AppWidgetKeys.imageSourceIconKey,
      onTap: onSourceSelected,
      child: Container(
        width: cardDimensions.width,
        height: cardDimensions.height,
        padding:
            isSmallScreen ? const EdgeInsets.all(2) : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: black54, width: 0.5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: const Offset(0, 3),
                color: black.withOpacity(0.07),
                blurRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              // source image icon
              Expanded(
                child: Image(
                  color: black54,
                  image: AssetImage(imgPath),
                  height: sourceIconDimensions.height,
                  width: sourceIconDimensions.width,
                ),
              ),

              // source text
              smallVerticalSizedBox,
              Expanded(
                child: Text(sourceText,
                    style: isSmallScreen
                        ? Theme.of(context).textTheme.bodyText1
                        : PatientStyles.patientRegistrationBody),
              )
            ],
          ),
        ),
      ),
    );
  }
}

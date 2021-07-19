import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/decoded_system.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils.dart';

import 'package:intl/intl.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_system_title_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/symptom_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/healthcloud_styles.dart';
import 'package:shared_themes/text_themes.dart';

class ReviewOfSystemsItemWidget extends StatelessWidget {
  final DecodedSystem decodedSystem;
  final StreamController<dynamic> streamController;

  const ReviewOfSystemsItemWidget(
      {required this.streamController, required this.decodedSystem});
  @override
  Widget build(BuildContext context) {
    final bool isNormalSystem =
        decodedSystem.decodedJson['symptomNoneKnown'] == 'true';
    final bool isLargeScreen = SILResponsiveWidget.isLargeScreen(context);

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 38 : 10, vertical: 10),
      padding: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 40 : 15, vertical: 30),
      decoration: BoxDecoration(
        color:
            isNormalSystem ? healthcloudPrimaryColor.withOpacity(0.1) : white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isNormalSystem ? transparent : grey.withOpacity(0.5),
            width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ReviewOfSystemTitleBar(
            title: toBeginningOfSentenceCase(decodedSystem.title) ?? noNotes,
            streamController: streamController,
            compositionTitle: decodedSystem.title.toLowerCase(),
          ),
          size15VerticalSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (isNormalSystem)
                SymptomWidget(
                  symptomText: noAbnormalitiesCheckbox,
                  isNormal: isNormalSystem,
                )
              else
                Wrap(
                  children: <Widget>[
                    /// loop through the list of symptoms and only show the
                    /// ones that are available
                    /// {"hasNausea": "true"}

                    ...decodedSystem.decodedJson.keys
                        .where((dynamic e) =>
                            decodedSystem.decodedJson[e] == 'true')
                        .map(
                          (dynamic e) => SymptomWidget(
                            symptomText: toBeginningOfSentenceCase(
                              reviewOfSystemsSymptoms[e]
                                  .toString()
                                  .toLowerCase(),
                            )!,
                          ),
                        ),
                  ],
                ),
              verySmallVerticalSizedBox,
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Text('Doctor\'s notes', style: HCStyles.titleStyle),
              ),
              smallVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  toBeginningOfSentenceCase(decodedSystem
                          .decodedJson['description']
                          ?.toString()) ??
                      noNotes,
                  style: decodedSystem.decodedJson['description'] != null
                      ? TextThemes.boldSize16Text(titleBlack)
                      : TextThemes.normalSize14Text(Colors.black45),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_vital.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/vital_not_recorded_indicator.dart';
import 'package:intl/intl.dart';

import 'package:rxdart/subjects.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/spaces.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/vital_constants.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

/// Patient Vital cards
///
/// Used to render various patient vitals or add patient vital prompts
class BeWellVitalCard extends StatelessWidget {
  BeWellVitalCard({
    required this.imgPath,
    required this.patientVital,
    required this.vitalText,
    required this.unit,
  });

  final String imgPath;
  final PatientVital? patientVital;
  final BehaviorSubject<DrawerType> selectedDrawer =
      BehaviorSubject<DrawerType>();

  final BehaviorSubject<dynamic> selectedReading = BehaviorSubject<dynamic>();
  final String unit;
  final String vitalText;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);
    final double imageDimension = isSmallScreen ? 15 : 25;

    final String interpretation = patientVital?.interpretation ?? 'NORMAL';

    /// The actual DateTime Value.
    /// Returns an ISO-8601 full-precision extended format representation
    final DateTime issueDate = DateTime.parse(
        patientVital?.issueDate ?? DateTime.now().toIso8601String());

    /// Formats [issueDate] into a human readable Date in 12hr System
    final String parsedIssueDate = DateFormat('h:mma').format(issueDate);

    final String? evaluatedVitalValue =
        vitalText == VitalType.systolicBloodPressure.fullName
            ? AddVitalsObject().evaluatedBloodPressure
            : patientVital?.vitalValue;

    final String vitalValue = evaluatedVitalValue ?? '';

    /// The correct vital to add
    final VitalType currentVital = VitalType.values.singleWhere(
        (VitalType value) =>
            value.fullName.toLowerCase() !=
                VitalType.diastolicBloodPressure.fullName.toLowerCase() &&
            vitalText.toLowerCase() == value.fullName.toLowerCase());

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: isSmallScreen
            ? MediaQuery.of(context).size.width
            : (MediaQuery.of(context).size.width / 3.5),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: const Offset(0, 1),
                color: black.withOpacity(0.05),
                blurRadius: 8),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Vital icon bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage(imgPath),
                    height: imageDimension,
                    width: imageDimension,
                  ),
                  smallHorizontalSizedBox,
                  Text(vitalText, style: TextThemes.boldSize16Text()),
                ],
              ),
            ),
            Divider(color: grey.withOpacity(0.5), thickness: 0.6),

            /// vital value container
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (vitalValue.isEmpty)
                    ExamItemAddButton(
                      buttonText: addText,
                      drawerType: currentVital.drawerType,
                    )
                  else ...<Widget>[
                    Text(
                      vitalValue,
                      style: isSmallScreen
                          ? TextThemes.veryBoldSize32Text(getVitalColor(
                              vitalText: interpretation, context: context))
                          : TextThemes.veryBoldSize32Text(getVitalColor(
                              vitalText: interpretation, context: context)),
                    ),
                    Text(
                      unit,
                      style: TextThemes.boldSize15Text(grey),
                    ),
                  ],
                ],
              ),
            ),

            Divider(color: grey.withOpacity(0.5), thickness: 0.6),

            /// Bottom bar that indicates if a vital is recorded or not
            Padding(
              padding: isSmallScreen
                  ? const EdgeInsets.all(10)
                  : const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: vitalValue.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(Icons.timer, color: grey),
                            verySmallHorizontalSizedBox,
                            Text(parsedIssueDate,
                                style: TextThemes.boldSize15Text(grey)),
                          ],
                        ),
                        Text(
                          interpretation,
                          style: isSmallScreen
                              ? TextThemes.boldSize16Text(
                                  getVitalColor(
                                      vitalText: interpretation,
                                      context: context),
                                )
                              : TextThemes.boldSize16Text(
                                  getVitalColor(
                                      vitalText: interpretation,
                                      context: context),
                                ),
                        )
                      ],
                    )
                  : NotRecordedIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

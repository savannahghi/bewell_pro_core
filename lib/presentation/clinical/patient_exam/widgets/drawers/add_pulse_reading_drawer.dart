// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_bottom_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/large_device_divider.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/large_device_reading.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/vertical_spacer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/vital_legend_column.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/vital_constants.dart';

class AddPulseReading extends StatefulWidget {
  @override
  _AddPulseReadingState createState() => _AddPulseReadingState();
}

class _AddPulseReadingState extends State<AddPulseReading> {
  AddPulseObject addPulseObject = AddPulseObject();

  final GlobalKey<FormState> _pulseReadingFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // clear all vital values before populating them
    addPulseObject.reset();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addPulseReadingTitle),
        mediumVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Read from device
                    if (!isSmallScreen)
                      Row(
                        children: <Widget>[
                          LargeDeviceReading(
                            value: addPulseObject.selectedReading.value!,
                            readingImage: const AssetImage(pulseIconUrl),
                          ),
                          largeHorizontalSizedBox,
                          // divider
                          LargeDeviceDivider(textTheme: textTheme),
                          largeHorizontalSizedBox,
                        ],
                      ),

                    // Capture manually
                    Form(
                      key: _pulseReadingFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(captureManuallyText, style: textTheme.headline6),
                          size15VerticalSizedBox,
                          Text(pulseUnit,
                              style:
                                  textTheme.headline6!.copyWith(color: grey)),
                          smallVerticalSizedBox,
                          SizedBox(
                            height: 100,
                            width: 170,
                            child: SILFormTextField(
                              key: AppWidgetKeys.pulseValueKey,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              validator: (String? v) =>
                                  InputValidators.validatePulse(v),
                              onChanged: (String v) {
                                if (v.isNotEmpty) {
                                  addPulseObject.selectedReading.add(v);
                                  checkVitals(
                                    value:
                                        addPulseObject.selectedReading.value!,
                                    vitalType: VitalType.pulse,
                                    updateValue:
                                        addPulseObject.evaluatedReading,
                                  );
                                }
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        mediumVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: grey)),
              padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
              child: Row(
                children: <Widget>[
                  VitalLegendColumn(
                    title: pulseRateTitle,
                    vitalValue: addPulseObject.selectedReading.value,
                    unit: pulseUnit,
                  ),
                  size15HorizontalSizedBox,
                  VerticalSpacer(),
                  size15HorizontalSizedBox,
                  Text(
                    addPulseObject.evaluatedReading.value ?? notRecordedText,
                    style: textTheme.headline5!.copyWith(
                      color: getVitalColor(
                          vitalText: addPulseObject.evaluatedReading.value,
                          context: context),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        veryLargeVerticalSizedBox,
        DrawerBottomBar(
          saveButtonCallback: () async {
            if (_pulseReadingFormKey.currentState!.validate() == true) {
              final PatientInfo _patientInfo = getPatientInfo();

              this.addPulseObject
                ..patientRef.add(_patientInfo.patientReference)
                ..patientName.add(_patientInfo.patientName)
                ..encounterRef.add(_patientInfo.encounterReference)
                ..dateRecorded.add('${DateTime.now().toIso8601String()}Z');

              // handle form validation and saving of the vitals
              /// Save diastolic blood pressure
              await saveVital(
                  context: context,
                  data: addPulseVariables(this.addPulseObject.data),
                  successMsg: 'Pulse reading added');
            } else {
              ExamChangeObject().onAddVitalListener.add(false);
            }
          },
        )
      ],
    );
  }
}

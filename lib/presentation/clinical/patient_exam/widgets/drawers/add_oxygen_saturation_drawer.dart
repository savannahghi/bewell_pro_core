// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';

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

/// [common] and [shared]

class AddOxygenSaturation extends StatefulWidget {
  @override
  _AddOxygenSaturationState createState() => _AddOxygenSaturationState();
}

class _AddOxygenSaturationState extends State<AddOxygenSaturation> {
  AddOxygenSaturationObject addOxygenSaturationObject =
      AddOxygenSaturationObject();
  final GlobalKey<FormState> _spo2FormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // clear vital object
    addOxygenSaturationObject.reset();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addOxygenTitle),
        mediumVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Read from device
                    if (isLargeScreen)
                      Row(
                        children: <Widget>[
                          LargeDeviceReading(
                            value: addOxygenSaturationObject
                                .oxygenSaturation.value!,
                            readingImage:
                                const AssetImage(bloodOxygenSaturationIcon),
                          ),
                          largeHorizontalSizedBox,
                          // divider
                          LargeDeviceDivider(textTheme: textTheme),
                          largeHorizontalSizedBox,
                        ],
                      )
                    else
                      const SizedBox(),
                    // Capture manually
                    Form(
                      key: _spo2FormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(captureManuallyText, style: textTheme.headline6),
                          size15VerticalSizedBox,
                          Text(
                            '%',
                            style: textTheme.headline6!
                                .copyWith(color: grey, fontSize: 12),
                          ),
                          smallVerticalSizedBox,
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: SILFormTextField(
                              key: AppWidgetKeys.oxygenSPO2ValueKey,
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              validator: (String? v) =>
                                  InputValidators.validateBloodOxygen(v),
                              onChanged: (String v) {
                                if (v.isNotEmpty) {
                                  addOxygenSaturationObject.oxygenSaturation
                                      .add(v);
                                  checkVitals(
                                    value: addOxygenSaturationObject
                                        .oxygenSaturation.value!,
                                    vitalType: VitalType.bloodOxygen,
                                    updateValue: addOxygenSaturationObject
                                        .evaluatedReading,
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
              padding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  VitalLegendColumn(
                    title: spo2Title,
                    vitalValue:
                        addOxygenSaturationObject.oxygenSaturation.value,
                    unit: '%',
                  ),
                  size15HorizontalSizedBox,
                  VerticalSpacer(),
                  size15HorizontalSizedBox,
                  Text(
                    addOxygenSaturationObject.evaluatedReading.value ??
                        notRecordedText,
                    style: textTheme.headline5!.copyWith(
                        color: getVitalColor(
                            context: context,
                            vitalText: addOxygenSaturationObject
                                    .evaluatedReading.value ??
                                '')),
                  )
                ],
              ),
            ),
          ],
        ),
        veryLargeVerticalSizedBox,
        DrawerBottomBar(
          saveButtonCallback: () async {
            if (_spo2FormKey.currentState!.validate()) {
              final PatientInfo _patientInfo = getPatientInfo();
              this.addOxygenSaturationObject
                ..patientRef.add(_patientInfo.patientReference)
                ..patientName.add(_patientInfo.patientName)
                ..encounterRef.add(_patientInfo.encounterReference)
                ..dateRecorded.add('${DateTime.now().toIso8601String()}Z');

              // handle form validation and saving of the vitals
              await saveVital(
                  context: context,
                  data: addOxygenSaturationVariables(
                      this.addOxygenSaturationObject.data),
                  successMsg: addOxygenSuccessMsg);
            }
          },
        ),
      ],
    );
  }
}

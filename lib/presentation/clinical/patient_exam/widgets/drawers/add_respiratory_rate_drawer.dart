import 'package:flutter/material.dart';
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

import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class AddRespiratoryRate extends StatefulWidget {
  @override
  _AddRespiratoryRateState createState() => _AddRespiratoryRateState();
}

class _AddRespiratoryRateState extends State<AddRespiratoryRate> {
  AddRespiratoryRateObject addRespiratoryRateObject =
      AddRespiratoryRateObject();
  final GlobalKey<FormState> _respiratoryRateFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    //clear the vital data object
    addRespiratoryRateObject.reset();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = SILResponsiveWidget.isLargeScreen(context);

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addRespiratoryTitle),
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
                              value: addRespiratoryRateObject
                                  .selectedReading.value
                                  .toString(),
                              readingImage:
                                  const AssetImage(respiratoryRateIcon)),
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
                      key: _respiratoryRateFormKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(captureManuallyText, style: textTheme.headline6),
                          size15VerticalSizedBox,
                          Text(
                            'BPM',
                            style: textTheme.headline6!.copyWith(color: grey),
                          ),
                          smallVerticalSizedBox,
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: SILFormTextField(
                              key: AppWidgetKeys.bmpValueKey,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              validator: (String? value) =>
                                  InputValidators.validateRespiratoryRate(
                                      value),
                              onChanged: (String v) {
                                addRespiratoryRateObject.selectedReading.add(v);
                                if (v.isNotEmpty &&
                                    addRespiratoryRateObject
                                            .selectedReading.value !=
                                        null) {
                                  checkVitals(
                                    value: addRespiratoryRateObject
                                        .selectedReading.value
                                        .toString(),
                                    vitalType: VitalType.respiratoryRate,
                                    updateValue: addRespiratoryRateObject
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
                    title: respiratoryRateTitle,
                    vitalValue: addRespiratoryRateObject.selectedReading.value
                        ?.toString(),
                    unit: 'BPM',
                  ),
                  size15HorizontalSizedBox,
                  VerticalSpacer(),
                  size15HorizontalSizedBox,
                  Text(
                    addRespiratoryRateObject.evaluatedReading.value ??
                        notRecordedText,
                    style: textTheme.headline5!.copyWith(
                        color: getVitalColor(
                            vitalText:
                                addRespiratoryRateObject.evaluatedReading.value,
                            context: context)),
                  )
                ],
              ),
            ),
          ],
        ),
        veryLargeVerticalSizedBox,
        DrawerBottomBar(
          saveButtonCallback: () async {
            if (_respiratoryRateFormKey.currentState!.validate()) {
              final PatientInfo _patientInfo = getPatientInfo();
              this.addRespiratoryRateObject
                ..patientRef.add(_patientInfo.patientReference)
                ..patientName.add(_patientInfo.patientName)
                ..encounterRef.add(_patientInfo.encounterReference)
                ..dateRecorded.add('${DateTime.now().toIso8601String()}Z');

              await saveVital(
                  context: context,
                  data: addRespiratoryRateVariables(
                      this.addRespiratoryRateObject.data),
                  successMsg: addRespiratorySuccessMsg);
            }
          },
        ),
      ],
    );
  }
}

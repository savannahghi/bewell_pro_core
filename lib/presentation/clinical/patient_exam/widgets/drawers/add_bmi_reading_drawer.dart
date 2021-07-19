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

/// [common] and [shared]
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/inputs.dart';

class AddBMI extends StatefulWidget {
  @override
  _AddBMIState createState() => _AddBMIState();
}

class _AddBMIState extends State<AddBMI> {
  AddBMIObject addBMIObject = AddBMIObject();
  final GlobalKey<FormState> _bmiFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // clear vitals object
    addBMIObject.reset();
  }

  Future<void> saveBMI() async {
    if (_bmiFormKey.currentState!.validate()) {
      final PatientInfo patientInfo = getPatientInfo();
      this.addBMIObject
        ..patientRef.add(patientInfo.patientReference)
        ..patientName.add(patientInfo.patientName)
        ..encounterRef.add(patientInfo.encounterReference)
        ..dateRecorded.add('${DateTime.now().toIso8601String()}Z');

      // handle form validation and saving of the vitals
      //
      await saveVital(
          context: context,
          data: addHeightVitals(this.addBMIObject.data),
          successMsg: addBMISuccessMsg,
          shouldPop: false);

      await saveVital(
          context: context,
          data: addWeightVitalMutationVariables(this.addBMIObject.data),
          successMsg: addBMISuccessMsg,
          shouldPop: false);

      await saveVital(
          context: context,
          data: addBMIVitalMutationVariables(this.addBMIObject.data),
          successMsg: addBMISuccessMsg);

      ExamChangeObject().onAddVitalListener.add(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addBMITitle),
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
                              value: addBMIObject.bmi.value!,
                              readingImage: const AssetImage(bmiIconUrl)),
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
                      key: _bmiFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(captureManuallyText, style: textTheme.headline6),
                          size15VerticalSizedBox,
                          Text(
                            heightText,
                            style: textTheme.headline6!.copyWith(color: grey),
                          ),
                          smallVerticalSizedBox,
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                                width: 150,
                                child: SILFormTextField(
                                  key: AppWidgetKeys.heightValueKey,
                                  maxLength: 5,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  validator: (String? v) =>
                                      InputValidators.validateHeight(v),
                                  onChanged: (String v) {
                                    if (v.isNotEmpty) {
                                      setState(() {
                                        addBMIObject.height.add(v);
                                      });
                                    }
                                  },
                                ),
                              ),
                              verySmallHorizontalSizedBox,
                              Text(
                                heightUnits,
                                style:
                                    textTheme.headline6!.copyWith(color: grey),
                              )
                            ],
                          ),
                          smallVerticalSizedBox,
                          Text(
                            weightTitle,
                            style: textTheme.headline6!.copyWith(color: grey),
                          ),
                          smallVerticalSizedBox,
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                                width: 150,
                                child: SILFormTextField(
                                  key: AppWidgetKeys.weightValueKey,
                                  maxLength: 5,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  validator: (String? v) =>
                                      InputValidators.validateWeight(v),
                                  onChanged: (String v) {
                                    setState(() {
                                      if (v.isNotEmpty) {
                                        addBMIObject.weight.add(v);
                                        this.addBMIObject.calculateBMI();
                                        checkVitals(
                                          value: addBMIObject.bmi.value!,
                                          vitalType: VitalType.bmi,
                                          updateValue:
                                              addBMIObject.evaluatedReading,
                                        );
                                      }
                                    });
                                  },
                                ),
                              ),
                              verySmallHorizontalSizedBox,
                              Text(
                                weightUnits,
                                style:
                                    textTheme.headline6!.copyWith(color: grey),
                              ),
                            ],
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

        // legend
        if (isSmallScreen)
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: grey)),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            VitalLegendColumn(
                              title: heightText,
                              vitalValue: addBMIObject.height.value,
                              unit: 'cm',
                            ),
                            size15HorizontalSizedBox,
                            VerticalSpacer(),
                            size15HorizontalSizedBox,
                            VitalLegendColumn(
                              title: weightTitle,
                              vitalValue: addBMIObject.weight.value,
                              unit: weightUnits,
                            ),
                            size15HorizontalSizedBox,
                            VerticalSpacer(),
                            size15HorizontalSizedBox,
                            VitalLegendColumn(
                              title: 'BMI',
                              vitalValue: addBMIObject.bmi.value,
                              unit: 'Kg/m2',
                            ),
                          ],
                        ),

                        ///
                        // vitals legend
                        size15VerticalSizedBox,
                        Container(
                            width: 250,
                            height: 0.8,
                            color: grey.withOpacity(0.8)),
                        size15VerticalSizedBox,
                        Text(
                          addBMIObject.evaluatedReading.value ??
                              notRecordedText,
                          style: textTheme.headline6!.copyWith(
                            color: getVitalColor(
                                vitalText: addBMIObject.evaluatedReading.value,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        else
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
                      title: heightText,
                      vitalValue: addBMIObject.height.value,
                      unit: heightUnits,
                    ),
                    size15HorizontalSizedBox,
                    VerticalSpacer(),
                    size15HorizontalSizedBox,
                    VitalLegendColumn(
                      title: weightTitle,
                      vitalValue: addBMIObject.weight.value,
                      unit: weightUnits,
                    ),
                    size15HorizontalSizedBox,
                    VerticalSpacer(),
                    size15HorizontalSizedBox,
                    VitalLegendColumn(
                      title: 'BMI',
                      vitalValue: addBMIObject.bmi.value,
                      unit: 'Kg/m2',
                    ),
                    size15HorizontalSizedBox,
                    VerticalSpacer(),
                    size15HorizontalSizedBox,
                    Text(
                      addBMIObject.evaluatedReading.value ?? notRecordedText,
                      style: textTheme.headline6!.copyWith(
                        color: getVitalColor(
                            vitalText: addBMIObject.evaluatedReading.value,
                            context: context),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        veryLargeVerticalSizedBox,
        DrawerBottomBar(saveButtonCallback: () async => saveBMI()),
      ],
    );
  }
}

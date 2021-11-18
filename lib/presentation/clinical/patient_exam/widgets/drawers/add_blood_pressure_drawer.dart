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

/// [common] and [shared]

/// End drawer used to add blood pressure vitals on Patient Exam
///
/// Used to enter [Systole] and [Diastole] values either by reading from a device or capturing manually
class AddBloodPressure extends StatefulWidget {
  @override
  _AddBloodPressureState createState() => _AddBloodPressureState();
}

class _AddBloodPressureState extends State<AddBloodPressure> {
  AddBloodPressureObject addBloodPressureObject = AddBloodPressureObject();
  final GlobalKey<FormState> _bloodPressureFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    addBloodPressureObject.reset();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addBloodPressureTitle),
        mediumVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    /// Read from device
                    if (isSmallScreen)
                      const SizedBox()
                    else
                      Row(
                        children: <Widget>[
                          LargeDeviceReading(
                              value: addBloodPressureObject.systole.value!,
                              readingImage:
                                  const AssetImage(bloodPressureIconUrl)),
                          largeHorizontalSizedBox,

                          /// Divider
                          LargeDeviceDivider(textTheme: textTheme),
                          largeHorizontalSizedBox,
                        ],
                      ),

                    /// Capture manually
                    Form(
                      key: _bloodPressureFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(captureManuallyText, style: textTheme.headline6),
                          size15VerticalSizedBox,
                          Text(
                            systoleTitle,
                            style: textTheme.headline6!.copyWith(color: grey),
                          ),
                          smallVerticalSizedBox,
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: SILFormTextField(
                              key: AppWidgetKeys.systoleValueKey,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              validator: (String? v) =>
                                  InputValidators.validateSystoleBloodPressure(
                                      v.toString()),
                              onChanged: (String v) {
                                addBloodPressureObject.systole
                                    .add(v.toString());
                                if (v != '') {
                                  checkVitals(
                                    value:
                                        addBloodPressureObject.systole.value!,
                                    vitalType: VitalType.systolicBloodPressure,
                                    updateValue:
                                        addBloodPressureObject.evaluatedReading,
                                  );
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            diastoleTitle,
                            style: textTheme.headline6!.copyWith(color: grey),
                          ),
                          smallVerticalSizedBox,
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: SILFormTextField(
                              key: AppWidgetKeys.diastoleValueKey,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              validator: (String? v) =>
                                  InputValidators.validateDiastoleBloodPressure(
                                      v.toString()),
                              onChanged: (String v) {
                                if (v != '') {
                                  addBloodPressureObject.diastole.add(v);
                                  checkVitals(
                                    value:
                                        addBloodPressureObject.systole.value!,
                                    vitalType: VitalType.diastolicBloodPressure,
                                    updateValue:
                                        addBloodPressureObject.evaluatedReading,
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

        /// Legend
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(smallScreenBPTitle),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      addBloodPressureObject
                                              .evaluatedBloodPressure ??
                                          '',
                                      style: textTheme.headline4!.copyWith(
                                          color: healthcloudPrimaryColor),
                                    ),
                                    Text(
                                      bpUnits,
                                      style: textTheme.headline6!
                                          .copyWith(color: grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            mediumHorizontalSizedBox,
                            VerticalSpacer(),
                            mediumHorizontalSizedBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Sys'),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      addBloodPressureObject.systole.value ??
                                          '0',
                                      style: textTheme.headline4!.copyWith(
                                          color: healthcloudPrimaryColor),
                                    ),
                                    Text(
                                      bpUnits,
                                      style: textTheme.headline6!
                                          .copyWith(color: grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            size15HorizontalSizedBox,
                            VerticalSpacer(),
                            size15HorizontalSizedBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Dia'),
                                Column(
                                  children: <Widget>[
                                    Text(
                                        addBloodPressureObject.diastole.value ??
                                            '0',
                                        style: textTheme.headline4!.copyWith(
                                            color: healthcloudPrimaryColor)),
                                    Text(
                                      bpUnits,
                                      style: textTheme.headline6!
                                          .copyWith(color: grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        /// Vitals legend
                        size15VerticalSizedBox,
                        Container(
                            width: 250,
                            height: 0.8,
                            color: grey.withOpacity(0.8)),
                        size15VerticalSizedBox,
                        Text(
                          addBloodPressureObject.evaluatedReading.value ??
                              notRecordedText,
                          style: textTheme.headline5!.copyWith(
                            color: getVitalColor(
                                vitalText: addBloodPressureObject
                                    .evaluatedReading.value,
                                context: context),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      title: 'Sys',
                      vitalValue: addBloodPressureObject.systole.value,
                      unit: bpUnits,
                    ),
                    size15HorizontalSizedBox,
                    VerticalSpacer(),
                    size15HorizontalSizedBox,
                    VitalLegendColumn(
                      title: 'Dia',
                      vitalValue: addBloodPressureObject.diastole.value,
                      unit: bpUnits,
                    ),
                    size15HorizontalSizedBox,
                    VerticalSpacer(),
                    size15HorizontalSizedBox,
                    VitalLegendColumn(
                      title: largeScreenBPTitle,
                      vitalValue:
                          addBloodPressureObject.evaluatedBloodPressure ?? '',
                      unit: bpUnits,
                    ),
                    size15HorizontalSizedBox,
                    VerticalSpacer(),
                    size15HorizontalSizedBox,
                    Text(
                      addBloodPressureObject.evaluatedReading.value ??
                          notRecordedText,
                      style: textTheme.headline5!.copyWith(
                        color: getVitalColor(
                            vitalText:
                                addBloodPressureObject.evaluatedReading.value,
                            context: context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        /// Save and cancel button banner
        veryLargeVerticalSizedBox,
        DrawerBottomBar(
          saveButtonCallback: () async {
            if (_bloodPressureFormKey.currentState!.validate()) {
              final PatientInfo _patientInfo = getPatientInfo();

              this.addBloodPressureObject
                ..patientRef.add(_patientInfo.patientReference)
                ..patientName.add(_patientInfo.patientName)
                ..encounterRef.add(_patientInfo.encounterReference)
                ..dateRecorded.add('${DateTime.now().toIso8601String()}Z');

              /// Save systolic blood pressure
              await saveVital(
                  context: context,
                  data: addSystoleBloodPressureVitalMutationVariables(
                      this.addBloodPressureObject.data),
                  shouldPop: false,
                  successMsg: addBloodSuccessMsg);

              /// Save diastolic blood pressure
              await saveVital(
                  context: context,
                  data: addDiastolicBloodPressureVitalMutationVariables(
                      this.addBloodPressureObject.data),
                  successMsg: addBloodSuccessMsg);
            } else {
              ExamChangeObject().onAddVitalListener.add(false);
            }
          },
        ),
      ],
    );
  }
}

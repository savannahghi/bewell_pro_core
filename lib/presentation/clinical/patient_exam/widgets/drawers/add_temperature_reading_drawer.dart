// Dart imports:
import 'dart:ui';

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
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/vital_constants.dart';

class AddTemperature extends StatefulWidget {
  @override
  _AddTemperatureState createState() => _AddTemperatureState();
}

class _AddTemperatureState extends State<AddTemperature> {
  AddTemperatureReadingObject addTemperatureReadingObject =
      AddTemperatureReadingObject();
  final GlobalKey<FormState> _temperatureFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    // clear vitals object
    addTemperatureReadingObject.reset();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const Color primaryColor = healthcloudPrimaryColor;
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addTemperatureTitle),
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
                            value: addTemperatureReadingObject
                                .selectedReading.value
                                .toString(),
                            readingImage: const AssetImage(temperatureIconUrl),
                          ),
                          largeHorizontalSizedBox,
                          // divide
                          LargeDeviceDivider(textTheme: textTheme),
                          largeHorizontalSizedBox
                        ],
                      )
                    else
                      const SizedBox(),
                    // Capture manually
                    Form(
                      key: _temperatureFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(captureManuallyText, style: textTheme.headline6),
                          size15VerticalSizedBox,
                          Row(
                            children: <Widget>[
                              Text(
                                '°',
                                style: textTheme.headline6!.copyWith(
                                    color: grey,
                                    fontSize: 12,
                                    fontFeatures: <FontFeature>[
                                      const FontFeature.enable('sups')
                                    ]),
                              ),
                              Text(
                                'C',
                                style: textTheme.headline6!
                                    .copyWith(color: grey, fontSize: 12),
                              ),
                            ],
                          ),
                          smallVerticalSizedBox,
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: SILFormTextField(
                              key: AppWidgetKeys.temperatureValueKey,
                              maxLength: 4,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              validator: (String? v) =>
                                  InputValidators.validateTemperature(v),
                              onChanged: (String v) {
                                if (v.isNotEmpty) {
                                  addTemperatureReadingObject.selectedReading
                                      .add(v);
                                  checkVitals(
                                    value: v,
                                    vitalType: VitalType.temperature,
                                    updateValue: addTemperatureReadingObject
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

        // legend
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Temperature'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            (addTemperatureReadingObject.selectedReading.value
                                        .toString() ==
                                    ''
                                ? '0'
                                : addTemperatureReadingObject
                                    .selectedReading.value
                                    ?.toString())!,
                            style: textTheme.headline3!
                                .copyWith(color: primaryColor),
                          ),
                          Text(
                            '°',
                            style: textTheme.headline6!.copyWith(
                                color: grey,
                                fontSize: 12,
                                fontFeatures: <FontFeature>[
                                  const FontFeature.enable('sups')
                                ]),
                          ),
                          Text(
                            'C',
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
                  Text(
                    addTemperatureReadingObject.evaluatedReading.value ??
                        notRecordedText,
                    style: textTheme.headline5!.copyWith(
                      color: getVitalColor(
                          context: context,
                          vitalText: addTemperatureReadingObject
                              .evaluatedReading.value),
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
            if (_temperatureFormKey.currentState!.validate()) {
              final PatientInfo _patientInfo = getPatientInfo();
              this.addTemperatureReadingObject
                ..patientRef.add(_patientInfo.patientReference)
                ..patientName.add(_patientInfo.patientName)
                ..encounterRef.add(_patientInfo.encounterReference)
                ..dateRecorded.add('${DateTime.now().toIso8601String()}Z');

              await saveVital(
                  context: context,
                  data: addTemperatureReadingVariables(
                      this.addTemperatureReadingObject.data),
                  successMsg: addTemperatureSuccessMsg);
            }
          },
        ),
      ],
    );
  }
}

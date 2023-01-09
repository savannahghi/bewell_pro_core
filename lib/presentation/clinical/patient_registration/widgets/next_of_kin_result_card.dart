// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/domain_objects/value_objects/phone_number.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';

class NextOfKinResultCard extends StatefulWidget {
  const NextOfKinResultCard({required this.patient});

  final Patient patient;

  @override
  _NextOfKinResultCardState createState() => _NextOfKinResultCardState();
}

class _NextOfKinResultCardState extends State<NextOfKinResultCard> {
  void addNextOfKinFunction() {
    final PatientPayload patientPayload =
        PatientPayload(patientRecord: widget.patient);

    final PatientRegistrationContainer container =
        PatientRegistrationContainer.of(context)!;

    container.registerNextOfKinPayload.updatePatient(patientPayload);
    container.navigate(PatientRegistrationContainer.addNextOfKinIndex);
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final String? phoneNumberString = widget.patient.telecom?.first?.value;
    PhoneNumber? phoneNumber;

    if (phoneNumberString != null) {
      phoneNumber = PhoneNumber.withValue(phoneNumberString);
    }

    final String? givenName = widget.patient.name?.first?.given?.first;
    final String nameToDisplay =
        givenName != null ? titleCase(givenName) : noName;

    if (isSmallScreen) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          key: AppWidgetKeys.smallScreenCard,
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: patientIDLightCyan,
                      backgroundImage: AssetImage(userLightIconUrl),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(nameToDisplay,
                          style: TextThemes.veryBoldSize18Text(titleBlack)),
                      verySmallVerticalSizedBox,

                      // Phone number
                      Row(
                        children: <Widget>[
                          //patient search card title
                          Text(
                            phoneNumberField,
                            style: TextThemes.normalSize13Text(subtitleGrey),
                          ),
                          //patient search card data
                          Text(
                            phoneNumber?.getValue() ?? 'No Phone Number Found',
                            style: TextThemes.normalSize13Text(subtitleGrey),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SILPrimaryButton(
                  buttonKey: AppWidgetKeys.addNextOfKinSmallDeviceKey,
                  onPressed: () => addNextOfKinFunction(),
                  text: addNextOfKin,
                ),
              ),
              smallVerticalSizedBox
            ],
          ),
        ),
      );
    } else {
      return Card(
        key: AppWidgetKeys.largeScreenCard,
        elevation: 0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: patientIDResultCardColor,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const CircleAvatar(
                      radius: 38,
                      backgroundColor: patientIDLightCyan,
                      backgroundImage: AssetImage(userLightIconUrl),
                    ),
                  ),
                  smallHorizontalSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(nameToDisplay,
                          style: TextThemes.veryBoldSize18Text(titleBlack)),
                      verySmallHorizontalSizedBox,

                      //Phone number
                      Row(
                        children: <Widget>[
                          Text(
                            phoneNumberField,
                            style: TextThemes.normalSize13Text(subtitleGrey),
                          ),
                          //patient search card data
                          Text(
                            phoneNumber?.getValue() ?? 'No Phone Number found',
                            style: TextThemes.normalSize13Text(subtitleGrey),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SILPrimaryButton(
                buttonKey: AppWidgetKeys.addNextOfKinLargeDeviceKey,
                onPressed: () => addNextOfKinFunction(),
                text: addNextOfKin,
              ),
            ],
          ),
        ),
      );
    }
  }
}

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/patient_payload_helper.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/presentation/clinical/common/helpers.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';

import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

import 'package:shared_ui_components/inputs.dart';

class ExtraInformation extends StatefulWidget {
  const ExtraInformation();

  @override
  _ExtraInformationState createState() => _ExtraInformationState();
}

class _ExtraInformationState extends State<ExtraInformation> {
  final ExtraInformationObject extraInformation = ExtraInformationObject();
  late String optInEmail;
  String selectedMaritalStatus = MaritalStatus.Unknown.name;

  bool _isEmailOptInSelected = false;
  final GlobalKey<FormState> _extraInfoKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final PatientPayloadHelper currentPatient =
        PatientRegistrationContainer.of(context)!.currentPatient;

    // clear all the data to avoid sending unnecessary sending of foreign data
    this.extraInformation
      ..clear()
      // add the patient ID to update
      ..patientId.add(currentPatient.patientID);
  }

  MaritalStatus _getMaritalStatusFromString(String value) {
    return MaritalStatus.values
        .firstWhere((MaritalStatus status) => status.name == value);
  }

  Future<void> _saveAndNavigate(BuildContext context) async {
    final dynamic result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: updateExtraInformationQueryVariables(
                this.extraInformation.data),
            query: updateExtraInformationMutation,
          );
        });

    if (result != null &&
        result['createUpdatePatientExtraInformation'] != null) {
      publishEvent(registerPatientEvent, context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(extraInfoSaved),
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));

      const int index = PatientRegistrationContainer.completeRegistrationIndex;
      PatientRegistrationContainer.of(context)?.navigate(index);
      return;
    }

    if (result['error'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(UserFeedBackTexts.getErrorMessage(extraInfoText)),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));
    }
  }

  /// Validates any user interactions
  ///
  /// It saves any data entered by the user.
  ///
  /// If no data is entered the whole page will be skipped
  Future<void> _updateOrSkipExtraInfo() async {
    // If any of the information in the form exists, we run the update query
    // otherwise we skip the step

    final dartz.Either<bool, EmailFormStatus> isDataValid =
        validateExtraInformationData(
      data: this.extraInformation.data,
      extraInfoKey: _extraInfoKey,
    );

    isDataValid.fold((bool isMaritalStatusOk) {
      if (isMaritalStatusOk) {
        _saveAndNavigate(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(skippingExtraInfo),
            duration: Duration(seconds: kShortSnackBarDuration),
          ),
        );

        const int index =
            PatientRegistrationContainer.completeRegistrationIndex;
        PatientRegistrationContainer.of(context)?.navigate(index);
      }
    }, (EmailFormStatus emailFormStatus) {
      if (emailFormStatus == EmailFormStatus.ok) {
        _saveAndNavigate(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(extraInfoInvalidEmailText),
            duration: Duration(seconds: kShortSnackBarDuration),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) => Scaffold(
        floatingActionButton: Padding(
          padding: SILResponsiveWidget.isSmallScreen(context)
              ? const EdgeInsets.fromLTRB(40, 20, 10, 10)
              : const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Previous Button
              FloatingActionButton.extended(
                key: AppWidgetKeys.previousBtnKey,
                backgroundColor: healthcloudPrimaryColor,
                onPressed: () {
                  const int index = PatientRegistrationContainer.nhifIndex;
                  PatientRegistrationContainer.of(context)?.navigate(index);
                },
                label: Row(
                  children: const <Widget>[
                    Icon(Icons.arrow_back),
                    Text(previousBtnText),
                  ],
                ),
              ),
              // Finish Button
              FloatingActionButton.extended(
                key: AppWidgetKeys.finishBtnKey,
                backgroundColor: healthcloudPrimaryColor,
                onPressed: () async => _updateOrSkipExtraInfo(),
                label: Row(
                  children: const <Widget>[
                    Text(finishBtnTxt),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              )
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(extraInfoTitle,
                      style: PatientStyles.registerPatientSectionTitle),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(providePatientExtraInfoPrompt,
                        style: PatientStyles.registerPatientSectionSubTitle),
                  ),
                ),
                mediumVerticalSizedBox,

                // marital status select option
                const Align(
                  alignment: Alignment.topLeft,
                  child: TextFormHintText(hintText: maritalStatusTitle),
                ),
                smallVerticalSizedBox,

                SILSelectOptionField(
                  dropDownInputKey: AppWidgetKeys.maritalStatusKey,
                  hintText: maritalStatusHint,
                  value: selectedMaritalStatus,
                  options: MaritalStatus.values
                      .map<String>((MaritalStatus status) => status.name)
                      .toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        selectedMaritalStatus = value;
                      });

                      final MaritalStatus status =
                          _getMaritalStatusFromString(value);
                      extraInformation.maritalStatus.add(status);
                    }
                  },
                ),
                mediumVerticalSizedBox,
                smallVerticalSizedBox,
                largeVerticalSizedBox,

                // email opt in and email input field
                Text(
                  emailCommunicationsPrompt,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SILCheckbox(
                        checkboxKey:
                            AppWidgetKeys.emailCommunicationsCheckboxKey,
                        value: _isEmailOptInSelected,
                        text: emailCommunicationText,
                        onChanged: (bool? value) {
                          setState(() {
                            _isEmailOptInSelected = value!;
                            if (!value) {
                              extraInformation.email.add(null);
                            }
                            extraInformation.emailOptIn.add(value);
                          });
                        },
                      ),
                      smallVerticalSizedBox,
                      if (_isEmailOptInSelected)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: RequiredTextFormHintText(
                              hintText: emailAddressText),
                        ),
                      smallVerticalSizedBox,
                      if (_isEmailOptInSelected)
                        Form(
                          key: _extraInfoKey,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.only(bottom: 70),
                            child: SILFormTextField(
                              key: AppWidgetKeys.emailCommunicationsFieldKey,
                              hintText: enterEmailPrompt,
                              validator: (String? value) =>
                                  InputValidators.validateEmailAddress(value),
                              onChanged: (String value) {
                                extraInformation.email.add(value.trim());
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

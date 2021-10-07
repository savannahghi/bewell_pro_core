// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/patient_payload_helper.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

class NHIF extends StatefulWidget {
  const NHIF({Key? key}) : super(key: key);

  @override
  _NHIFState createState() => _NHIFState();
}

class _NHIFState extends State<NHIF> {
  late double imageWidth;
  late double imageHeight;

  final GlobalKey<FormState> _nHIFFormKey = GlobalKey<FormState>();
  final NHIFInformationObject _nhifInformation = NHIFInformationObject();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final PatientPayloadHelper currentPatient =
        PatientRegistrationContainer.of(context)!.currentPatient;

    this._nhifInformation
      ..patientID.add(currentPatient.patientID)
      // clear the data before doing anything else
      ..frontImageBase64.add(null)
      ..frontImageContentType.add(null)
      ..membershipNumber.add(null);
  }

  void previousNhifNavigationFunction() {
    const int index = PatientRegistrationContainer.nextOfKinIndex;
    PatientRegistrationContainer.of(context)?.navigate(index);
  }

  Future<void> addNhifDetails() async {
    if (_nHIFFormKey.currentState!.validate()) {
      _nHIFFormKey.currentState!.save();
      addNHIF(
        context: context,
        nhifInformation: _nhifInformation,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String userStr = StoreProvider.state<CoreState>(context)!
        .userRegistrationState!
        .userType;
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) => Scaffold(
        floatingActionButton: Padding(
          padding: ResponsiveWidget.isSmallScreen(context)
              ? const EdgeInsets.fromLTRB(40, 20, 10, 10)
              : const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton.extended(
                key: AppWidgetKeys.nHIFPreviousKey,
                backgroundColor: healthcloudPrimaryColor,
                onPressed: () => previousNhifNavigationFunction(),
                label: Row(
                  children: const <Widget>[
                    Icon(Icons.arrow_back),
                    Text(previousBtnText),
                  ],
                ),
              ),
              FloatingActionButton.extended(
                key: AppWidgetKeys.nHIFNextKey,
                backgroundColor: healthcloudPrimaryColor,
                onPressed: () => addNhifDetails(),
                label: Row(
                  children: const <Widget>[
                    Text(skipNextBtnText),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              )
            ],
          ),
        ),
        body: ListView(
          padding: ResponsiveWidget.isSmallScreen(context)
              ? const EdgeInsets.all(20)
              : const EdgeInsets.fromLTRB(20, 20, 100, 20),
          children: <Widget>[
            Form(
              key: _nHIFFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(nhifStepDescription,
                        style: PatientStyles.registerPatientSectionTitle),
                  ),
                  Padding(
                    padding: ResponsiveWidget.isSmallScreen(context)
                        ? const EdgeInsets.only(bottom: 5.0)
                        : const EdgeInsets.only(bottom: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(provideNHIFInfoPrompt(userStr),
                          style: PatientStyles.registerPatientSectionSubTitle),
                    ),
                  ),
                  if (ResponsiveWidget.isSmallScreen(context))
                    smallVerticalSizedBox
                  else
                    mediumVerticalSizedBox,
                  const Align(
                    alignment: Alignment.topLeft,
                    child: TextFormHintText(hintText: nHIFNumber),
                  ),
                  smallVerticalSizedBox,
                  SILFormTextField(
                      key: AppWidgetKeys.memberNoInputKey,
                      hintText: nHIFNumberPrompt,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else if (value.length > 8) {
                          return nhifValidPrompt;
                        } else if (value.length < 8) {
                          return nhifIsShortPrompt;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? v) {
                        if (v != null && v.isNotEmpty) {
                          this._nhifInformation.membershipNumber.add(v);
                        }
                      }),
                  mediumVerticalSizedBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

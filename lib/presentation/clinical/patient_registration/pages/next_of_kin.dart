import 'dart:async';

import 'package:bewell_pro_core/application/clinical/patient_registration/patient_payload_helper.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter/material.dart';

import 'package:bewell_pro_core/application/clinical/patient_registration/next_of_kin_form_manager.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/no_next_of_kin_found.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/next_of_kin_data_validator.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/next_of_kin_result_card.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/self_next_of_kin_search.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class NextOfKin extends StatefulWidget {
  const NextOfKin({Key? key}) : super(key: key);

  @override
  _NextOfKinState createState() => _NextOfKinState();
}

class _NextOfKinState extends State<NextOfKin> {
  final TextEditingController _searchInputController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late StreamSubscription<String> _phoneNumberSubscription;

  final NextOfKinFormManager _formManager = NextOfKinFormManager();

  @override
  void initState() {
    super.initState();
    _phoneNumberSubscription = _formManager.phoneNumber
        .distinct()
        .debounceTime(const Duration(milliseconds: 500))
        .listen((String phoneNumber) {
      _formManager.fetchPotentialNextOfKin(
          phoneNumber: phoneNumber, context: context);
    });
  }

  @override
  void dispose() {
    _phoneNumberSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PatientPayloadHelper currentPatient =
        PatientRegistrationContainer.of(context)!.currentPatient;

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
                key: AppWidgetKeys.previousActionButtonKey,
                backgroundColor: healthcloudPrimaryColor,
                onPressed: () {
                  const int index =
                      PatientRegistrationContainer.basicDetailsIndex;
                  PatientRegistrationContainer.of(context)?.navigate(index);
                },
                label: Row(children: const <Widget>[
                  Icon(Icons.arrow_back),
                  Text(previousBtnText)
                ]),
              ),
              StreamBuilder<bool>(
                  stream: _formManager.isFormValid,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    final bool? isFormValid = snapshot.data;

                    return FloatingActionButton.extended(
                      key: AppWidgetKeys.nextActionButtonKey,
                      backgroundColor: isFormValid != null && isFormValid
                          ? healthcloudPrimaryColor
                          : Colors.grey,
                      onPressed: isFormValid != null && isFormValid
                          ? _showSnackbar
                          : null,
                      label: Row(
                        children: const <Widget>[
                          Text(nextBtnText),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(addNextOfKinHintText,
                          style: PatientStyles.registerPatientSectionTitle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(basicInfoProvision,
                            style:
                                PatientStyles.registerPatientSectionSubTitle),
                      ),
                    ),
                    largeVerticalSizedBox,
                    const Align(
                      alignment: Alignment.topLeft,
                      child: TextFormHintText(hintText: phoneNumberProvision),
                    ),
                    smallVerticalSizedBox,
                    SILPhoneInput(
                      phoneNumberFormatter: formatPhoneNumber,
                      inputController: _searchInputController,
                      labelText: phoneNumberInputLabelText,
                      labelStyle: TextThemes.boldSize16Text(),
                      onChanged: (String? value) {
                        if (value != null) {
                          _formManager.inPhoneNumber.add(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<NextOfKinPhoneState>(
                stream: _formManager.potentialNextOfKin,
                builder: (BuildContext context,
                    AsyncSnapshot<NextOfKinPhoneState> snapshot) {
                  if (snapshot.hasError) {
                    final String patientName = _getPatientName(currentPatient);
                    return NoNextOfKinFound(
                      phoneNumberString: patientName,
                    );
                  }

                  if (snapshot.hasData) {
                    final NextOfKinPhoneState? snapshotData = snapshot.data;

                    if (snapshotData != null && snapshotData.loading) {
                      return const SILPlatformLoader();
                    }

                    if (snapshotData != null && snapshotData.data != null) {
                      final List<PatientEdge?>? edges =
                          snapshotData.data?.edges;
                      if (edges != null && edges.isEmpty) {
                        return NoNextOfKinFound(
                          phoneNumberString: _searchInputController.text,
                        );
                      } else {
                        final String? currentRegisteredPhone =
                            currentPatient.patientPhone;

                        if (NextOfKinValidation.isSelfNextOfKin(
                            currentRegisteredPhone, snapshotData.data)) {
                          /// return an error message that one cannot register themselves
                          /// as their own next of kin
                          return SelfNextOfKinSearch();
                        }

                        if (!NextOfKinValidation.isRecordActive(
                            snapshotData.data)) {
                          return NoNextOfKinFound(
                            phoneNumberString: _searchInputController.text,
                          );
                        }

                        final List<Patient> activePatientRecords =
                            NextOfKinValidation.activePatientRecords(
                                snapshotData.data);

                        final List<Widget> _kins =
                            _populateKins(activePatientRecords);

                        return Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              child: Wrap(
                                children: <Widget>[
                                  Text(
                                    displayResultsText,
                                    style: PatientStyles.resultsTextStyle,
                                  ),
                                  smallHorizontalSizedBox,
                                  Text(_getPatientName(currentPatient),
                                      style:
                                          PatientStyles.resultsTextStyleDarker),
                                ],
                              ),
                            ),
                            mediumVerticalSizedBox,
                            Wrap(
                              spacing: 2.0,
                              children: _kins,
                            )
                          ],
                        );
                      }
                    }
                  }
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(nextOfKinNotAddedText)),
    );
  }

  String _getPatientName(PatientPayloadHelper patient) {
    final String? currentPatientName = patient.patientName;

    if (currentPatientName != null) {
      return titleCase(currentPatientName);
    }

    return 'No Name found';
  }

  List<Widget> _populateKins(List<Patient> activeRecords) {
    final List<Widget> result = <Widget>[];
    for (final Patient patient in activeRecords) {
      result.add(
        NextOfKinResultCard(patient: patient),
      );
      result.add(mediumVerticalSizedBox);
    }
    return result;
  }
}

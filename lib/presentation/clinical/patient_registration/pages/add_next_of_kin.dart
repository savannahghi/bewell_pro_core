// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/domain_objects/value_objects/enums.dart';
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/constants.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/add_next_of_kin_form_manager.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/entities/simple_next_of_kin_input.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/failures/generic_exception.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/gender_picker.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/name_field.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/phone_number_field.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

class AddNextOfKin extends StatefulWidget {
  const AddNextOfKin({Key? key}) : super(key: key);

  @override
  _AddNextOfKinState createState() => _AddNextOfKinState();
}

class _AddNextOfKinState extends State<AddNextOfKin> {
  /// Variables to control form logic
  final GlobalKey<FormState> _registerNextOfKinFormKey = GlobalKey<FormState>();

  final AddNextOfKinFormManager _formManager = AddNextOfKinFormManager();

  final String _selectedRelationship = NextOfKinRelation.Unknown.name;

  bool _nextOfKinExists = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PatientPayload? nextOfKinPayload =
        PatientRegistrationContainer.of(context)!
            .registerNextOfKinPayload
            .patientPayload;

    final String? id = nextOfKinPayload?.patientRecord?.id;
    if (id != null) _formManager.inPatientId.add(id);

    final bool? number = nextOfKinPayload?.patientRecord?.telecom?.isNotEmpty;
    _nextOfKinExists = nextOfKinPayload != null && number != null && number;

    if (_nextOfKinExists) _preFillFields(nextOfKinPayload);

    return ListView(
      children: <Widget>[
        Form(
          key: _registerNextOfKinFormKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    addNextOfKinText,
                    style: PatientStyles.registerPatientSectionTitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(provideNextOfKinBasicInfo,
                        style: PatientStyles.registerPatientSectionSubTitle),
                  ),
                ),

                // First name
                StreamBuilder<String>(
                  stream: _formManager.firstName,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return NameField(
                      controller: _firstNameController,
                      enabled: !_nextOfKinExists,
                      onChanged: (String value) =>
                          _formManager.inFirstName.add(value),
                      fieldHintText: _nextOfKinExists
                          ? nextOfKinFirstNameText
                          : enterNextOfKinFirstName,
                      formFieldKey: AppWidgetKeys.addNextOfKinFirstNameKey,
                      error: (snapshot.hasError)
                          ? (snapshot.error as GenericException?)?.message
                          : null,
                    );
                  },
                ),

                largeVerticalSizedBox,

                // Last name
                StreamBuilder<String>(
                  stream: _formManager.lastName,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return NameField(
                      controller: _lastNameController,
                      enabled: !_nextOfKinExists,
                      onChanged: (String value) =>
                          _formManager.inLastName.add(value),
                      fieldHintText: _nextOfKinExists
                          ? nextOfKinLastNameText
                          : enterNextOfKinLastName,
                      formFieldKey: AppWidgetKeys.addNextOfKinLastNameKey,
                      error: (snapshot.hasError)
                          ? (snapshot.error as GenericException?)?.message
                          : null,
                    );
                  },
                ),

                largeVerticalSizedBox,

                // Phone number
                PhoneNumberFieldWidget(
                  preFilled: _formManager.phoneManager.phoneNumberValue,
                  disabled: true,
                  formManager: _formManager.phoneManager,
                  otpReceiver: nextOfKinStr,
                ),

                largeVerticalSizedBox,

                // Date of birth
                CustomDatePicker(
                  textFieldKey: AppWidgetKeys.addNextOfKinDobTextFieldKey,
                  enabled: !_nextOfKinExists,
                  formManager: _formManager,
                ),

                largeVerticalSizedBox,

                // Gender
                const Align(
                  alignment: Alignment.topLeft,
                  child: RequiredTextFormHintText(hintText: hintGender),
                ),
                smallVerticalSizedBox,
                GenderPicker(
                  enabled: !_nextOfKinExists,
                  hintText: hintSelectNextOfKinGender,
                  dropDownInputKey: AppWidgetKeys.addNextOfKinGenderKey,
                  stream: _formManager.gender,
                  onChanged: (String? value) {
                    if (value != null) {
                      _formManager.inGender.add(getGenderFromString(value));
                    }
                  },
                ),

                largeVerticalSizedBox,

                // Relation
                const Align(
                  alignment: Alignment.topLeft,
                  child: RequiredTextFormHintText(hintText: hintRelationship),
                ),
                smallVerticalSizedBox,
                StreamBuilder<NextOfKinRelation>(
                  stream: _formManager.relationship,
                  builder: (BuildContext context,
                      AsyncSnapshot<NextOfKinRelation> snapshot) {
                    final NextOfKinRelation? relation = snapshot.data;
                    return SILSelectOptionField(
                      dropDownInputKey:
                          AppWidgetKeys.addNextOfKinRelationshipKey,
                      hintText: hintSelectRelationship,
                      value: relation?.name ?? _selectedRelationship,
                      options: NextOfKinRelation.values
                          .map((NextOfKinRelation e) => e.name)
                          .toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          _formManager.inRelationship
                              .add(getRelationFromString(value));
                        }
                      },
                    );
                  },
                ),

                largeVerticalSizedBox,

                // Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SILSecondaryButton(
                      buttonKey: AppWidgetKeys.addNextOfKinCancelButtonKey,
                      onPressed: () {
                        /// return to [NextOfKin]
                        const int index =
                            PatientRegistrationContainer.nextOfKinIndex;
                        PatientRegistrationContainer.of(context)
                            ?.navigate(index);
                      },
                      text: silButtonCancel,
                      buttonColor: white,
                      borderColor: healthcloudAccentColor,
                      textColor: healthcloudAccentColor,
                    ),
                    StreamBuilder<bool>(
                        stream: _formManager.isFormValid,
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          final bool? isValid = snapshot.data;
                          return SILPrimaryButton(
                            buttonKey:
                                AppWidgetKeys.addNextOfKinRegisterButtonKey,
                            buttonColor: isValid != null && isValid
                                ? healthcloudAccentColor
                                : Colors.grey,
                            onPressed: isValid != null && isValid
                                ? () => _addNextOfKin()
                                : null,
                            text: silButtonRegister,
                          );
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getInitialNameValue(String? name) {
    String? initialName;
    if (name != null) {
      initialName = titleCase(name);
    } else {
      initialName = '';
    }
    return initialName;
  }

  Future<void> _addNextOfKin() async {
    final SimpleNextOfKinInput nextOfKinInput = _formManager.submit();

    final dynamic result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return BewellSubmitDialog(
          data: <String, dynamic>{'input': nextOfKinInput.toMap()},
          query: addNewNextOfKinMutation,
        );
      },
    );

    if (result['error'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(UserFeedBackTexts.getErrorMessage(addingNextOfKin)),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));
      return;
    }

    if (result['addNextOfKin'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(nextOfKinAddedSuccessMsg),
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));
      // navigate to nhif page
      const int index = PatientRegistrationContainer.nhifIndex;
      PatientRegistrationContainer.of(context)?.navigate(index);
    }
  }

  void _preFillFields(PatientPayload? nextOfKinPayload) {
    final String? id = nextOfKinPayload!.patientRecord?.id;
    if (id != null) _formManager.inPatientId.add(id);

    final HumanName? name = nextOfKinPayload.patientRecord?.name?.first;
    final String? firstName = name?.given?.first;
    final String? lastName = name?.family;

    _firstNameController.text = _getInitialNameValue(firstName);
    _lastNameController.text = _getInitialNameValue(lastName);

    _formManager.inFirstName.add(_getInitialNameValue(firstName));
    _formManager.inLastName.add(_getInitialNameValue(lastName));

    final String? phoneNumber =
        nextOfKinPayload.patientRecord?.telecom?.first?.value;
    if (phoneNumber != null) {
      _formManager.phoneManager.inPhoneNumber.add(phoneNumber);
    }

    final DateTime date = DateTime.parse(
        nextOfKinPayload.patientRecord?.birthDate ?? defaultDate);
    _formManager.inDateOfBirth.add(date);

    final PatientGenderEnum? gender = nextOfKinPayload.patientRecord?.gender;
    if (gender != null) {
      final Gender genderValueObject =
          getGenderFromString(describeEnum(gender));
      _formManager.inGender.add(genderValueObject);
    }
  }
}

class CustomDatePicker extends StatelessWidget {
  final AddNextOfKinFormManager formManager;
  final bool enabled;
  final Key textFieldKey;

  const CustomDatePicker({
    required this.formManager,
    required this.textFieldKey,
    bool? enabled,
  }) : enabled = enabled ?? true;

  void _onChangedCallback(String? value) {
    if (value != null) {
      final DateTime date = formManager.parseDateString(value);
      formManager.inDateOfBirth.add(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final StreamBuilder<DateTime> datePicker = StreamBuilder<DateTime>(
      stream: formManager.dateOfBirth,
      builder: (BuildContext context, AsyncSnapshot<DateTime> snapshot) {
        String? dateString;
        if (snapshot.hasData) {
          dateString = formManager.dateToString(snapshot.data!);
        }
        return SILDatePickerField(
          enabled: enabled,
          gestureDateKey: AppWidgetKeys.addNextOfKinDobGestureDetectorKey,
          textFieldDateKey: textFieldKey,
          hintText: enterNextOfKinDob,
          allowCurrentYear: true,
          controller: TextEditingController(text: dateString),
          keyboardType: TextInputType.datetime,
          onChanged: enabled ? _onChangedCallback : null,
        );
      },
    );

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: !enabled
              ? const TextFormHintText(hintText: 'Next of kin date of birth')
              : const RequiredTextFormHintText(hintText: hintDob),
        ),
        smallVerticalSizedBox,
        datePicker,
      ],
    );
  }
}

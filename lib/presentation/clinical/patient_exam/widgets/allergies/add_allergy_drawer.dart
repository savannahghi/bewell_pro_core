import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_bottom_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_results.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_selected_item.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:misc_utilities/misc.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class AddAllergy extends StatefulWidget {
  @override
  _AddAllergyState createState() => _AddAllergyState();
}

class _AddAllergyState extends State<AddAllergy> {
  AddAllergyObject addAllergyObject = AddAllergyObject();
  bool isAllergyConfirmed = true;
  bool isAllergySelected = false;
  bool isManifestationSelected = false;
  bool isSubstanceSelected = false;

  final GlobalKey<FormState> _allergyDescriptionFormKey =
      GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _substanceController = TextEditingController();
  final GlobalKey<FormState> _substanceFormKey = GlobalKey<FormState>();
  late StreamController<dynamic> _substanceSearchStreamController;
  late Stream<dynamic> _substanceStream;

  @override
  void initState() {
    super.initState();

    _substanceController.addListener(_substanceControllerListener);
    _descriptionController.addListener(_descriptionControllerListener);

    _substanceSearchStreamController = StreamController<dynamic>.broadcast();
    _substanceStream = _substanceSearchStreamController.stream;

    final PatientInfo _patientInfo = getPatientInfo();

    addAllergyObject
      ..patientRef.add(_patientInfo.patientReference)
      ..patientName.add(_patientInfo.patientName)
      ..encounterRef.add(_patientInfo.encounterReference)
      ..dateRecorded.add(DateTime.now().toIso8601String().split('T')[0])
      ..substanceConfirmationStatus.add('Confirmed');
  }

  void _substanceControllerListener() {
    if (_substanceController.text.length <= 2) return;
    genericSearchFunction(
        searchParam: _substanceController.text,
        conceptClass: ConceptClass.drug,
        client: AppWrapperBase.of(context)!.graphQLClient,
        streamController: _substanceSearchStreamController);
  }

  void _descriptionControllerListener() {
    addAllergyObject.description.add(_descriptionController.text);
  }

  Future<void> _saveAllergy() async {
    if (_substanceFormKey.currentState!.validate() &&
        _allergyDescriptionFormKey.currentState!.validate()) {
      if (isAllergyConfirmed == true) {
        addAllergyObject.substanceConfirmationStatus.add('Confirmed');
      } else {
        addAllergyObject.substanceConfirmationStatus.add('Unconfirmed');
      }

      addAllergyObject.recordingDoctor.add(getRecordingDoctor(context));
      final dynamic result = await showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: addAllergyVariables(addAllergyObject.data),
            query: addAllergyMutation,
          );
        },
      );

      if (result['createFHIRAllergyIntolerance'] != null) {
        ExamChangeObject().onAddAllergyListener.add(true);
        PrimaryBannerInfoObject().patientBannerChangeListener.add(true);
        ExamChangeObject().onAddProblemListener.add(true);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Allergy added'),
          duration: const Duration(seconds: kShortSnackBarDuration),
          action: dismissSnackBar('close', white, context),
        ));

        // close drawer
        //todo: add event log
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addAllergyDrawerTitle),

        // Body
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Form(
                      key: _substanceFormKey,
                      child: DrawerSearchInput(
                        key: AppWidgetKeys.addAllergyDrawerSearchInputKey,
                        isItemSelected: isSubstanceSelected,
                        labelText: substanceText,
                        controller: _substanceController,
                        streamController: _substanceSearchStreamController,
                        suffixIconCallback: () {
                          isSubstanceSelected = false;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              SizedBox(
                height: !isSubstanceSelected ? 250 : 150,
                child: isSubstanceSelected
                    ? DrawerSelectedItem(
                        onCancelCallback: () {
                          setState(() {
                            isSubstanceSelected = false;
                          });
                        },
                        selectedItemTitleString: substanceText,
                        selectedItem:
                            this.addAllergyObject.substanceDisplayName.value)
                    : DrawerSearchResults(
                        resultsStream: _substanceStream,
                        helpWidgetItemName: allergyText,
                        storeItemID: addAllergyObject.substanceID,
                        storeItemName: addAllergyObject.substanceName,
                        storeItemDisplay: addAllergyObject.substanceDisplayName,
                        onSelectCallback: () {
                          setState(() {
                            isSubstanceSelected = true;
                          });
                        }),
              ),
              mediumVerticalSizedBox,
              SILCheckbox(
                checkboxKey: AppWidgetKeys.allergyConfirmationCheckbox,
                value: isAllergyConfirmed,
                text: isAllergyConfirmedString,
                onChanged: (bool? value) {
                  setState(() {
                    isAllergyConfirmed = value!;
                  });
                },
              ),
              mediumVerticalSizedBox,
              Form(
                key: _allergyDescriptionFormKey,
                child: SILFormTextField(
                  key: AppWidgetKeys.allergyDescriptionInputKey,
                  labelText: allergyDescription,
                  maxLines: 4,
                  hintText: allergyDescriptionHint,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return allergyDescriptionHint;
                    }
                    return null;
                  },
                  controller: _descriptionController,
                ),
              ),
              mediumVerticalSizedBox,
            ],
          ),
        ),

        // the save/cancel options
        DrawerBottomBar(saveButtonCallback: _saveAllergy)
      ],
    );
  }
}

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_results.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_selected_item.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_bottom_bar.dart';

class AddDiagnosis extends StatefulWidget {
  @override
  _AddDiagnosisState createState() => _AddDiagnosisState();
}

class _AddDiagnosisState extends State<AddDiagnosis> {
  final TextEditingController diagnosisDateController = TextEditingController();
  bool isConfirmed = true;
  bool isDiagnosisSelected = false;
  SidePaneDiagnosisStore sidePaneDiagnosisStore = SidePaneDiagnosisStore();

  final GlobalKey<FormState> _diagnosisFormKey = GlobalKey<FormState>();
  final ScrollController _diagnosisListScrollController = ScrollController();
  late Stream<dynamic> _diagnosisSearchStream;
  late StreamController<dynamic> _diagnosisSearchStreamController;
  final TextEditingController _searchInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._searchInputController.addListener(this.diagnosisControllerListener);

    _diagnosisSearchStreamController = StreamController<dynamic>.broadcast();
    _diagnosisSearchStream = _diagnosisSearchStreamController.stream;

    sidePaneDiagnosisStore.reset();
  }

  Future<void> diagnosisControllerListener() async {
    if (this._searchInputController.text.length <= 2) return;
    await genericSearchFunction(
      searchParam: _searchInputController.text,
      conceptClass: ConceptClass.diagnosis,
      client: AppWrapperBase.of(context)!.graphQLClient,
      streamController: _diagnosisSearchStreamController,
    );
  }

  String getRecordedDate() {
    if (sidePaneDiagnosisStore.recorderDate.value!.isEmpty) {
      return DateTime.now().toIso8601String().split('T')[0];
    }
    return sidePaneDiagnosisStore.recorderDate.value!;
  }

  Future<void> _saveDiagnosis() async {
    // handle form validation and saving of the diagnosis
    if (_diagnosisFormKey.currentState!.validate()) {
      final PatientInfo patientInfo = getPatientInfo();

      final String recordingDoctor = getRecordingDoctor(context)!;

      final String dateRecorded = getRecordedDate();

      final String selectedCondition =
          sidePaneDiagnosisStore.diagnosisName.value!;

      final String? doctorNotes = sidePaneDiagnosisStore.diagnosisNotes.value;

      const String clinicalStatus = 'Active';

      final dynamic result = await showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: addDiagnosisVariables(
              clinicalStatus: clinicalStatus,
              dateRecorded: dateRecorded,
              selectedDiagnosis: selectedCondition,
              recordingDoctor: recordingDoctor,
              doctorNotes: doctorNotes,
              patientReference: patientInfo.patientReference!,
              encounterReference: patientInfo.encounterReference!,
              diagnosisCode: '',
            ),
            query: addConditionMutation,
          );
        },
      );

      if (result['createFHIRCondition'] != null) {
        ExamChangeObject().onDiagnosisChangeListener.add(true);

        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(diagnosisAddedSuccessMsg),
          duration: const Duration(seconds: kShortSnackBarDuration),
          action: dismissSnackBar('Close', white, context),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const SILDrawerHeader(title: diagnosisDrawerTitle),
        mediumVerticalSizedBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Form(
                      key: _diagnosisFormKey,
                      child: DrawerSearchInput(
                        key: AppWidgetKeys.diagnosisInputKey,
                        isItemSelected: isDiagnosisSelected,
                        labelText: diagnosisText,
                        controller: _searchInputController,
                        streamController: _diagnosisSearchStreamController,
                        suffixIconCallback: () {
                          isDiagnosisSelected = false;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              SizedBox(
                height: !isDiagnosisSelected
                    ? isProblemNotSelectedHeight
                    : isProblemSelectedHeight,
                child: isDiagnosisSelected
                    ? DrawerSelectedItem(
                        onCancelCallback: () {
                          setState(() {
                            isDiagnosisSelected = false;
                          });
                        },
                        selectedItemTitleString: diagnosisText,
                        selectedItem:
                            sidePaneDiagnosisStore.diagnosisName.value)
                    : DrawerSearchResults(
                        scrollController: _diagnosisListScrollController,
                        resultsStream: _diagnosisSearchStream,
                        helpWidgetItemName: diagnosisText,
                        storeItemID: sidePaneDiagnosisStore.diagnosisID,
                        storeItemName: sidePaneDiagnosisStore.diagnosisName,
                        storeItemDisplay: null,
                        onSelectCallback: () {
                          setState(() {
                            isDiagnosisSelected = true;
                            FocusScope.of(context).unfocus();
                          });
                        }),
              ),
              mediumVerticalSizedBox,
              SILCheckbox(
                checkboxKey: AppWidgetKeys.diagnosisConfirmCheckbox,
                value: isConfirmed,
                text: 'Confirmed?',
                onChanged: (bool? value) {
                  setState(() {
                    isConfirmed = value!;
                  });

                  if (value == true) {
                    sidePaneDiagnosisStore.diagnosisConfirmationClinicalStatus
                        .add('Active');
                  } else if (value == false) {
                    sidePaneDiagnosisStore.diagnosisConfirmationClinicalStatus
                        .add('Unconfirmed');
                  }
                },
              ),
              mediumVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SILDatePickerField(
                  gestureDateKey: AppWidgetKeys.diagnosisDatePickerKey,
                  allowCurrentYear: true,
                  labelText: addDiagnosisDatePickerLabel,
                  hintText: addDiagnosisDatePickerHint,
                  controller: diagnosisDateController,
                  keyboardType: TextInputType.datetime,
                  onChanged: (String? value) {
                    if (value != null) {
                      final DateTime date =
                          DateFormat('d MMM yyyy').parse(value);
                      diagnosisDateController.text = value;
                      sidePaneDiagnosisStore.recorderDate
                          .add(date.toIso8601String().split('T')[0]);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        largeVerticalSizedBox,
        // the save dialog
        DrawerBottomBar(saveButtonCallback: _saveDiagnosis),
      ],
    );
  }
}

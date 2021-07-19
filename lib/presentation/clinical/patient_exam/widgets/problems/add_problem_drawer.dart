import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_bottom_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_results.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_selected_item.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/inputs.dart';

class AddProblem extends StatefulWidget {
  const AddProblem({required this.conditionCategory});

  final ConditionCategory conditionCategory;

  @override
  _AddProblemState createState() => _AddProblemState();
}

class _AddProblemState extends State<AddProblem> {
  bool hasSearchParam = false;
  bool isConfirmed = true;
  bool isProblemSelected = false;
  SidePaneProblemStore sidePaneProblemStore = SidePaneProblemStore();

  final TextEditingController _conditionController = TextEditingController();
  final GlobalKey<FormState> _conditionDescriptionFormKey =
      GlobalKey<FormState>();

  final ScrollController _problemListScrollController = ScrollController();
  late StreamController<dynamic> _problemsSearchStreamController;
  final GlobalKey<FormState> _searchConditionFormKey = GlobalKey<FormState>();
  late Stream<dynamic> _stream;

  @override
  void initState() {
    super.initState();
    this._conditionController.addListener(this.problemControllerListener);

    _problemsSearchStreamController = StreamController<dynamic>.broadcast();
    _stream = _problemsSearchStreamController.stream;
  }

  void problemControllerListener() {
    if (this._conditionController.text.length <= 2) return;
    genericSearchFunction(
        searchParam: _conditionController.text,
        conceptClass: ConceptClass.diagnosis,
        client: AppWrapperBase.of(context)!.graphQLClient,
        streamController: _problemsSearchStreamController);
  }

  Future<void> _saveCondition(
      {required bool isCondition,
      required ConditionCategory conditionCategory}) async {
    /// Set the value of the clinical status based on the value of the checkbox
    /// It defaults to true but offers a mechanism to edit
    _conditionDescriptionFormKey.currentState!.save();

    if (_conditionDescriptionFormKey.currentState!.validate() &&
        _searchConditionFormKey.currentState!.validate()) {
      if (isConfirmed == true) {
        sidePaneProblemStore.problemConfirmationStatus.add('Active');
      } else {
        sidePaneProblemStore.problemConfirmationStatus.add('unconfirmed');
      }

      final String recordingDoctor = getRecordingDoctor(context)!;
      final String dateRecorded =
          DateTime.now().toIso8601String().split('T')[0];

      final String selectedCondition = sidePaneProblemStore.problemName.value!;

      final String clinicalStatus =
          sidePaneProblemStore.problemConfirmationStatus.value.toString();

      final String doctorNotes = sidePaneProblemStore.problemNotes.value!;

      final PatientInfo patientInfo = getPatientInfo();

      final dynamic result = await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BewellSubmitDialog(
              data: addProblemsVariables(
                encounterReference: patientInfo.encounterReference,
                clinicalStatus: clinicalStatus,
                dateRecorded: dateRecorded,
                selectedCondition: selectedCondition,
                recordingDoctor: recordingDoctor,
                doctorNotes: doctorNotes,
                patientName: patientInfo.patientName,
                patientReference: patientInfo.patientReference,
                conditionCategory: conditionCategory,
              ),
              query: addConditionMutation,
            );
          });

      if (result != null && result['createFHIRCondition'] != null) {
        if (isCondition) {
          ExamChangeObject().onAddPatientHistoryListener.add(true);
        }

        PrimaryBannerInfoObject().patientBannerChangeListener.add(true);
        ExamChangeObject().onAddProblemListener.add(true);

        /// Closes drawer
        Navigator.pop(context);

        /// Give feedback
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text((isCondition == true)
              ? UserFeedBackTexts.getSuccessfulAddMessage(chiefComplaint)
              : UserFeedBackTexts.getSuccessfulAddMessage(problem)),
          duration: const Duration(seconds: kShortSnackBarDuration),
        ));
      } else {
        /// Give feedback
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            UserFeedBackTexts.getErrorMessage(addProblemSuccessMsg),
          ),
          duration: const Duration(seconds: kShortSnackBarDuration),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isCondition =
        widget.conditionCategory == ConditionCategory.encounterDiagnosis;

    return Column(
      children: <Widget>[
        const SILDrawerHeader(title: addProblemDrawerTitle),
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
                      key: _searchConditionFormKey,
                      child: DrawerSearchInput(
                          key: AppWidgetKeys.addProblemDrawerSearchInputKey,
                          isItemSelected: isProblemSelected,
                          labelText: condition,
                          controller: _conditionController,
                          streamController: _problemsSearchStreamController,
                          suffixIconCallback: () {
                            isProblemSelected = false;
                          }),
                    ),
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              SizedBox(
                height: !isProblemSelected
                    ? isProblemNotSelectedHeight
                    : isProblemSelectedHeight,
                child: isProblemSelected
                    ? DrawerSelectedItem(
                        onCancelCallback: () {
                          setState(() {
                            isProblemSelected = false;
                          });
                        },
                        selectedItemTitleString: problem,
                        selectedItem: sidePaneProblemStore.problemName.value)
                    : DrawerSearchResults(
                        scrollController: _problemListScrollController,
                        resultsStream: _stream,
                        helpWidgetItemName: problem,
                        storeItemID: SidePaneProblemStore().problemID,
                        storeItemName: SidePaneProblemStore().problemName,
                        storeItemDisplay: null,
                        onSelectCallback: () {
                          setState(() {
                            isProblemSelected = true;
                          });
                        }),
              ),
              mediumVerticalSizedBox,
              SILCheckbox(
                checkboxKey: AppWidgetKeys.problemConfirmationCheckbox,
                value: isConfirmed,
                text: confirmedText,
                onChanged: (bool? value) {
                  setState(() {
                    isConfirmed = value!;
                  });
                },
              ),
              mediumVerticalSizedBox,
              Form(
                key: _conditionDescriptionFormKey,
                child: SILFormTextField(
                  key: AppWidgetKeys.problemDescriptionInputKey,
                  maxLines: 4,
                  labelText: notesTitle,
                  hintText: elaborateProblemHint,
                  onChanged: (String value) {
                    setState(() {
                      sidePaneProblemStore.problemNotes.add(value);
                    });
                  },
                ),
              ),
              mediumVerticalSizedBox,
            ],
          ),
        ),
        // save widget of side pane
        DrawerBottomBar(
          saveButtonCallback: () => _saveCondition(
            conditionCategory: widget.conditionCategory,
            isCondition: isCondition,
          ),
        )
      ],
    );
  }
}

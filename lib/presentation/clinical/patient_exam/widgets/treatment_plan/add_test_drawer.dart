// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/shared_themes/constants.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_results.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_selected_item.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';

class AddTestDrawer extends StatefulWidget {
  const AddTestDrawer();

  @override
  _AddTestDrawerState createState() => _AddTestDrawerState();
}

class _AddTestDrawerState extends State<AddTestDrawer> {
  bool isConfirmed = true;
  bool isTestSelected = false;
  AddTestStore sidePaneTestStore = AddTestStore();
  AddTestObject testData = AddTestObject();

  final TextEditingController _controller = TextEditingController();
  late Stream<dynamic> _testResultsStream;
  final GlobalKey<FormState> _testFormKey = GlobalKey<FormState>();
  final ScrollController _testListScrollController = ScrollController();
  final GlobalKey<FormState> _testNotesFormKey = GlobalKey<FormState>();

  late StreamController<dynamic> _testSearchResultsStreamController;

  @override
  void initState() {
    super.initState();
    this._controller.addListener(this.problemControllerListener);

    sidePaneTestStore.testStatus.add(activeText);

    _testSearchResultsStreamController = StreamController<dynamic>.broadcast();
    _testResultsStream = _testSearchResultsStreamController.stream;
  }

  void problemControllerListener() {
    if (this._controller.text.length <= 2) return;
    genericSearchFunction(
        searchParam: _controller.text,
        conceptClass: ConceptClass.test,
        client: AppWrapperBase.of(context)!.graphQLClient,
        streamController: _testSearchResultsStreamController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SILDrawerHeader(title: addTestsTitle),
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
                    key: _testFormKey,
                    child: DrawerSearchInput(
                        key: AppWidgetKeys.addTestsSearchInputKey,
                        isItemSelected: isTestSelected,
                        labelText: testTitle,
                        controller: _controller,
                        streamController: _testSearchResultsStreamController,
                        suffixIconCallback: () {
                          isTestSelected = false;
                        }),
                  ),
                ),
              ],
            ),
            mediumVerticalSizedBox,
            SizedBox(
              height: !isTestSelected ? 250 : 150,
              child: isTestSelected
                  ? DrawerSelectedItem(
                      onCancelCallback: () {
                        setState(() {
                          isTestSelected = false;
                        });
                      },
                      selectedItemTitleString: testItem,
                      selectedItem: sidePaneTestStore.testName.value.toString())
                  : DrawerSearchResults(
                      scrollController: _testListScrollController,
                      resultsStream: _testResultsStream,
                      helpWidgetItemName: diagnosisText,
                      storeItemID: sidePaneTestStore.testCode,
                      storeItemName: sidePaneTestStore.testName,
                      storeItemDisplay: null,
                      onSelectCallback: () {
                        setState(() {
                          isTestSelected = true;
                        });
                      }),
            ),
            mediumVerticalSizedBox,
            SILCheckbox(
              checkboxKey: AppWidgetKeys.testConfirmationCheckboxKey,
              value: isConfirmed,
              text: confirmedText,
              onChanged: (bool? value) {
                setState(() {
                  isConfirmed = value!;
                });

                if (value == true) {
                  sidePaneTestStore.testStatus.add(activeText);
                } else if (value == false) {
                  sidePaneTestStore.testStatus.add(unconfirmedText);
                }
              },
            ),
            mediumVerticalSizedBox,
            Form(
              key: _testNotesFormKey,
              child: SILFormTextField(
                key: AppWidgetKeys.addTestsNotesKey,
                maxLines: 4,
                labelText: notesTitle,
                hintText: elaborateProblemHint,
                onChanged: (String value) {},
                onSaved: (String? value) =>
                    sidePaneTestStore.testNotes.add(value),
              ),
            ),
            mediumVerticalSizedBox,
          ],
        ),
      ),

      mediumVerticalSizedBox,

      // the save dialog
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: const Color(0xfff4f4f4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SILSecondaryButton(
              buttonKey: AppWidgetKeys.silSecondaryButton,
              onPressed: () => Navigator.of(context).pop(),
              text: silButtonCancel,
            ),
            DrawerSaveButton(
              callback: () async {
                // handle form validation and saving of the problems
                if (_testFormKey.currentState!.validate() &&
                    _testNotesFormKey.currentState!.validate()) {
                  /// Save form value
                  _testFormKey.currentState!.save();
                  _testNotesFormKey.currentState!.save();

                  final PatientInfo patientInfo = getPatientInfo();

                  final String recordingDoctor = getRecordingDoctor(context)!;

                  final String testName = sidePaneTestStore.testName.value!;
                  final String testStatus = sidePaneTestStore.testStatus.value!;
                  final String testCode = sidePaneTestStore.testCode.value!;
                  final String dateRecorded =
                      DateTime.now().toIso8601String().split('T')[0];

                  final dynamic result = await showDialog(
                    context: context,
                    useRootNavigator: false,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return BewellSubmitDialog(
                        data: addTestMutationVariables(
                          testName: testName,
                          testCode: testCode,
                          testStatus: testStatus,
                          recordingDoctor: recordingDoctor,
                          patientReference: patientInfo.patientReference!,
                          patientName: patientInfo.patientName!,
                          encounterReference: patientInfo.encounterReference!,
                          dateRecorded: dateRecorded,
                          diagnosisID: testData.diagnosisID.value!,
                          diagnosisName: testData.diagnosisName.value!,
                        ),
                        query: addTestMutation,
                      );
                    },
                  );

                  if (result['createFHIRServiceRequest'] != null) {
                    ExamChangeObject().onAddTestListener.add(true);
                    //   close drawer
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(addTestsSuccessMsg),
                      duration: Duration(seconds: kShortSnackBarDuration),
                    ));
                  }
                }
              },
            ),
          ],
        ),
      )
    ]);
  }
}

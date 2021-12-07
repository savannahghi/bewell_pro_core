// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/quick_access_item.dart';

// the type of quick access item
enum QuickAccessType { test, medication, diagnosis }

/// [QuickAccessTypeEx] extends [QuickAccessType] enum to get the values as
/// strings
extension QuickAccessTypeEx on QuickAccessType {
  String get name {
    switch (this) {
      case QuickAccessType.test:
        return testsText;
      default:
        return diagnosisText;
    }
  }
}

class QuickAccessItemModal extends StatelessWidget {
  const QuickAccessItemModal(
      {required this.test,
      required this.diagnosisID,
      required this.diagnosisName,
      required this.type});

  final String diagnosisID;
  final String diagnosisName;
  final QuickAccessItem test;
  final QuickAccessType type;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return GestureDetector(
      key: AppWidgetKeys.aliasKey,
      onTap: () => quickAccessAddModal(
          context: context,
          diagnosisID: diagnosisID,
          diagnosisName: diagnosisName,
          name: test.name,
          code: test.code,
          type: type),
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 10),
        padding: isSmallScreen
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            border: Border.all(color: healthcloudAccentColor.withOpacity(0.5)),
            color: healthcloudAccentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          test.alias,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: healthcloudAccentColor),
        ),
      ),
    );
  }
}

Future<void> saveTestOrDiagnosis({
  required BuildContext context,
  required String name,
  required String code,
  required String diagnosisID,
  required String diagnosisName,
  required QuickAccessType type,
}) async {
  Navigator.pop(context);

  // handle form validation and saving of the problems
  const String testStatus = 'active';
  const String diagnosisStatus = 'Active';
  final String recordingDoctor = getRecordingDoctor(context)!;
  final String dateRecorded = DateTime.now().toIso8601String().split('T')[0];
  final PatientInfo patientInfo = getPatientInfo();
  final String? encounterReference = getPatientInfo().encounterReference;

  Map<String, dynamic> _variables;
  if (type == QuickAccessType.test) {
    _variables = addTestMutationVariables(
      testName: name,
      testCode: code,
      testStatus: testStatus,
      recordingDoctor: recordingDoctor,
      patientReference: patientInfo.patientReference!,
      patientName: patientInfo.patientName!,
      encounterReference: encounterReference!,
      dateRecorded: dateRecorded,
      diagnosisID: diagnosisID,
      diagnosisName: diagnosisName,
    );
  } else {
    _variables = addDiagnosisVariables(
      clinicalStatus: diagnosisStatus,
      dateRecorded: dateRecorded,
      selectedDiagnosis: diagnosisName,
      recordingDoctor: recordingDoctor,
      patientReference: patientInfo.patientReference!,
      encounterReference: encounterReference!,
      diagnosisCode: code,
    );
  }

  final dynamic result = await showDialog(
    context: context,
    useRootNavigator: false,
    builder: (BuildContext context) {
      return BewellSubmitDialog(
        data: _variables,
        query: type == QuickAccessType.test
            ? addTestMutation
            : addConditionMutation,
      );
    },
  );

  if (result['createFHIRCondition'] != null ||
      result['createFHIRServiceRequest'] != null) {
    type == QuickAccessType.test
        ? ExamChangeObject().onAddTestListener.add(true)
        : ExamChangeObject().onDiagnosisChangeListener.add(true);

    Navigator.of(context).pop();

    // success snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(type == QuickAccessType.test
            ? addTestsSuccessMsg
            : diagnosisAddedSuccessMsg),
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: dismissSnackBar('close', white, context),
      ),
    );
  } else {
    // error snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(UserFeedBackTexts.getErrorMessage()),
      duration: const Duration(seconds: kLongSnackBarDuration),
      action: dismissSnackBar(closeBtnText, white, context),
    ));
  }
}

Future<dynamic> quickAccessAddModal({
  required BuildContext context,
  required String name,
  required String code,
  required String diagnosisID,
  required String diagnosisName,
  required QuickAccessType type,
}) {
  final String? patientName = getPatientInfo().patientName;
  final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: isSmallScreen
                ? const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
                : const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    smallVerticalSizedBox,
                    Text(
                      'Add ${type.name}',
                      style: isSmallScreen
                          ? Theme.of(context).textTheme.subtitle2
                          : Theme.of(context).textTheme.headline6,
                    ),
                    if (isSmallScreen)
                      smallVerticalSizedBox
                    else
                      mediumVerticalSizedBox,
                    Divider(height: 0.5, color: Colors.grey[500]),
                    if (isSmallScreen)
                      smallVerticalSizedBox
                    else
                      mediumVerticalSizedBox,
                    RichText(
                      text: TextSpan(
                          style: isSmallScreen
                              ? Theme.of(context).textTheme.bodyText1
                              : Theme.of(context).textTheme.subtitle2,
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'You are about to ${type.name == 'test' ? 'order' : 'add'} a '),
                            TextSpan(
                                text: name,
                                style: TextThemes.heavySize14Text()),
                            TextSpan(text: ' ${type.name} for '),
                            TextSpan(
                                text: patientName,
                                style: TextThemes.heavySize14Text()),
                            const TextSpan(text: '?'),
                          ]),
                    ),
                    SizedBox(height: isSmallScreen ? 15 : 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SILSecondaryButton(
                          buttonKey: AppWidgetKeys.silSecondaryButton,
                          text: silButtonCancel,
                          borderColor: Colors.transparent,
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                        ),
                        SILPrimaryButton(
                          buttonKey: AppWidgetKeys.silPrimaryButtonKey,
                          text: confirmBtnText,
                          onPressed: () => saveTestOrDiagnosis(
                            context: context,
                            name: name,
                            code: code,
                            diagnosisID: diagnosisID,
                            diagnosisName: diagnosisName,
                            type: type,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 0.1)
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

List<QuickAccessItem> quickAccessItemTests = <QuickAccessItem>[
  QuickAccessItem('Fasting glucose (mmol/l)',
      'Fasting glucose [Moles/volume] in Blood', '76629-5'),
  QuickAccessItem(
      'HBA1C (%)', 'Hemoglobin A1c/Hemoglobin.total in Blood', '4548-4'),
  QuickAccessItem('Random glucose (lab, mmol/l)',
      'Glucose [Moles/volume] in Serum, Plasma or Blood', '77135-2'),
  QuickAccessItem('Microalbumin in urine',
      'Microalbumin [Mass/volume] in Urine', '14957-5'),
  QuickAccessItem('Random glucose (glucometer, mg/dl)',
      'Glucose [Mass/volume] in Capillary blood by Glucometer', '41653-7'),
  QuickAccessItem('Urine ketones presence (test strip)',
      'Ketones [Presence] in Urine by Test strip', '2514-8'),
  QuickAccessItem('Urine glucose presence (test strip)',
      'Glucose [Mass/volume] in Urine by Test strip', '5792-7'),
  QuickAccessItem(
      'Urea (urine)', 'Urea nitrogen [Moles/volume] in Urine', '14938-5'),
  QuickAccessItem(
      'Urea (blood)', 'Urea nitrogen [Moles/volume] in Blood', '59570-2'),
  QuickAccessItem(
      'eGFR',
      'Isotopic Glomerular filtration rate/1.73 sq M'
          ' [Volume Rate/Area] in Urine and Serum or Plasma',
      '78006-4'),
  QuickAccessItem('Creatinine in serum, plasma or blood',
      'Creatinine [Moles/volume] in Serum, Plasma or Blood', '77140-2'),
  QuickAccessItem(
      'Glucose 2h post 75g dose',
      'Glucose [Mass/volume] in Serum or Plasma --2 hours post 75 g glucose PO',
      '14995-5')
];

List<QuickAccessItem> quickAccessItemDiagnoses = <QuickAccessItem>[
  QuickAccessItem('Diabetes Mellitus', 'Diabetes Mellitus', '175'),
  QuickAccessItem('Chronic Kidney Disease', 'Chronic Kidney Disease', '145438'),
  QuickAccessItem('Chronic Congestive Heart Failure',
      'Chronic Congestive Heart Failure', '145464'),
  QuickAccessItem('Benign Hypertensive Renal Disease With Renal Failure',
      'Benign Hypertensive Renal Disease With Renal Failure', '117381'),
];

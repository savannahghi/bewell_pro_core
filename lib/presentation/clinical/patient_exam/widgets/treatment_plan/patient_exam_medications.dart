import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_edge.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/medication_item_large_screen.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/medication_item_small_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';

class PatientExamMedications extends StatefulWidget {
  const PatientExamMedications(
      {required this.recordedDiagnosisID, required this.recordedDiagnosis});

  final String recordedDiagnosis;
  final String recordedDiagnosisID;

  @override
  _PatientExamMedicationsState createState() => _PatientExamMedicationsState();
}

class _PatientExamMedicationsState extends State<PatientExamMedications> {
  late StreamController<dynamic> _medicationStreamController;
  final BehaviorSubject<String?> _retireReason = BehaviorSubject<String>();
  late Stream<dynamic> _stream;

  @override
  void initState() {
    super.initState();

    _medicationStreamController = StreamController<dynamic>.broadcast();
    _stream = _medicationStreamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback(
      (Duration timeStamp) async {
        await genericFetchFunction(
          logTitle: 'Patient Existing Medication',
          queryString: findPatientExistingMedicationQuery,
          variables: findPatientExistingMedicationVariables(),
          context: context,
          streamController: _medicationStreamController,
        );
      },
    );

    final StreamView<dynamic> refreshController =
        StreamView<dynamic>(ExamChangeObject().onAddMedicationListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await genericFetchFunction(
            logTitle: 'Patient Existing Medication',
            queryString: findPatientExistingMedicationQuery,
            variables: findPatientExistingMedicationVariables(),
            context: context,
            streamController: _medicationStreamController);
      }
    });
  }

  Future<void> _retireMedication({
    required String medicationName,
    required String patientName,
    required String medicationId,
  }) async {
    final Map<String, dynamic> _variables = <String, dynamic>{
      'id': medicationId
    };

    await createRetireModal(
      context: context,
      retireItemName: medicationName,
      section: SectionType.medication,
      patientName: patientName,
      onChangeReasonField: (String? v) {
        this._retireReason.add(v);
      },
      onMedicationRetireCallback: () async {
        final dynamic result = await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BewellSubmitDialog(
              data: _variables,
              query: retireMedicationMutation,
            );
          },
        );

        if (result['deleteFHIRMedicationRequest'] != null &&
            result['deleteFHIRMedicationRequest'] == true) {
          ExamChangeObject().onAddMedicationListener.add(true);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                UserFeedBackTexts.getSuccessfulRetireMessage(medicationTitle)),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ));
        }

        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = ResponsiveWidget.isLargeScreen(context);

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        // Medication Title and Button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const PatientExamCardTitle(title: medicationTitle),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ExamItemAddButton(
                  buttonText: addMedication,
                  drawerType: DrawerType.medication,
                  diagnosisName: widget.recordedDiagnosis,
                  diagnosisID: widget.recordedDiagnosisID,
                ),
              ),
            ],
          ),
        ),
        smallVerticalSizedBox,
        StreamBuilder<dynamic>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return const GenericZeroStateWidget(
                title: addMedication,
                subtitle: prescribeMedicationsPrompt,
              );
            }

            //show the loader before data is displayed
            if (snapshot.hasData) {
              if (snapshot.data is Map<String, dynamic> &&
                  snapshot.data['loading'] != null &&
                  snapshot.data['loading'] == true) {
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const SILPlatformLoader());
              }

              final MedicationRelayConnection _medicationRelayConnection =
                  MedicationRelayConnection.fromJson(
                      snapshot.data['searchFHIRMedicationRequest']
                          as Map<String, dynamic>);

              final List<MedicationEdgeRelay?>? _patientRecordEdges =
                  _medicationRelayConnection.edges;

              if (_patientRecordEdges == null ||
                  _patientRecordEdges.isEmpty == true) {
                return const GenericZeroStateWidget(
                  title: addMedication,
                  subtitle: prescribeMedicationsPrompt,
                );
              }

              final String? encounterReference =
                  getPatientInfo().encounterReference;

              final List<Medication?> _patientMedicationRecords =
                  _patientRecordEdges
                      .map((MedicationEdgeRelay? e) => e!.node)
                      .toList()
                      .where((Medication? element) {
                if (element!.supportingInformation != null) {
                  return element.status == MedicationStatusEnum.active &&
                      element.supportingInformation!.first!.reference ==
                          encounterReference &&
                      (element.supportingInformation!.first!.display ==
                              widget.recordedDiagnosis &&
                          element.supportingInformation!.first!.id ==
                              widget.recordedDiagnosisID);
                }
                return false;
              }).toList();

              // check if the Stream<dynamic> has error in data
              if (_patientMedicationRecords.isEmpty) {
                return const GenericZeroStateWidget(
                  title: addMedication,
                  subtitle: prescribeMedicationsPrompt,
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _patientMedicationRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  final Medication record = _patientMedicationRecords[index]!;

                  final String medicationName =
                      record.medicationCodeableConcept!.text ?? '';
                  final String requester = record.requester!.display ?? '';
                  final String patientName = record.subject!.display ?? '';
                  final String prescription =
                      record.dosageInstruction!.first!.text ?? '';
                  final String? medicationId = record.id;

                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      if (isLargeScreenDevice)
                        MedicationItemLargeScreen(
                          requester: requester,
                          prescription: prescription,
                          medicationName: medicationName,
                          retireMedicationFunc: () async {
                            await _retireMedication(
                              medicationName: medicationName,
                              patientName: patientName,
                              medicationId: medicationId!,
                            );
                          },
                        )
                      else
                        MedicationItemSmallScreen(
                          requester: requester,
                          medicationName: medicationName,
                          prescription: prescription,
                          retireMedicationFunc: () async {
                            await _retireMedication(
                              medicationName: medicationName,
                              patientName: patientName,
                              medicationId: medicationId!,
                            );
                          },
                        )
                    ],
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

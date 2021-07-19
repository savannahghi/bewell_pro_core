import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/medication_search_result_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/medication_prescription_form.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';

import 'package:intl/intl.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:app_wrapper/app_wrapper.dart';

import 'package:shared_themes/spaces.dart';

/// Drawer used to add medication details for patients
///
/// 1. => Renders [MedicationPrescriptionForm] if a medication is selected
/// 2. => Renders [MedicationSearchResults] if a medication is not selected.
/// [MedicationSearchResults] Facilitates search suggestions for medications and allows selection
class AddMedication extends StatefulWidget {
  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  AddMedicationObject addMedicationObject = AddMedicationObject();

  final GlobalKey<FormState> _medicationFormKey = GlobalKey<FormState>();

  final TextEditingController _medicationController = TextEditingController();

  final List<String> routeOptions = <String>[
    'Oral',
    'Capsules',
    'Injection',
    'Sublingual',
    'Nasal',
    'ml',
    'mg'
  ];

  String? administerAtFrequency;
  final TextEditingController _startDate = TextEditingController();
  TextEditingController timeController = TextEditingController();
  late StreamController<dynamic> _medicationSearchController;
  late Stream<dynamic> _medicationStream;
  bool isMedicationSelected = false;

  @override
  void initState() {
    super.initState();
    this._medicationSearchController = StreamController<dynamic>.broadcast();
    this._medicationStream = _medicationSearchController.stream;
    this._medicationController.addListener(this._medicationControllerListener);

    final PatientInfo _patientInfo = getPatientInfo();
    this.addMedicationObject
      ..patientRef.add(_patientInfo.patientReference)
      ..patientName.add(_patientInfo.patientName)
      ..encounterRef.add(_patientInfo.encounterReference)
      ..dateRecorded.add(DateTime.now().toIso8601String().split('T')[0]);
  }

  void _medicationControllerListener() {
    if (this._medicationController.text.length <= 4) return;
    genericSearchFunction(
        searchParam: this._medicationController.text,
        conceptClass: ConceptClass.drug,
        client: AppWrapperBase.of(context)!.graphQLClient,
        streamController: _medicationSearchController);
  }

  @override
  Widget build(BuildContext context) {
    _startDate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Form(
      key: _medicationFormKey,
      child: Column(
        children: <Widget>[
          const SILDrawerHeader(title: addMedicationTitle),

          /// Search medication
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DrawerSearchInput(
                key: AppWidgetKeys.addMedicationSearchInputKey,
                isItemSelected: isMedicationSelected,
                labelText: medicationTitle,
                controller: _medicationController,
                streamController: _medicationSearchController,
                suffixIconCallback: () {
                  isMedicationSelected = false;
                }),
          ),

          mediumVerticalSizedBox,
          Container(
            child: isMedicationSelected
                ? MedicationPrescriptionForm(
                    onMedicationCancel: () {
                      setState(() {
                        this.isMedicationSelected = false;
                        this._medicationController.clear();
                        this._medicationSearchController.add(null);
                      });
                    },
                  )
                : MedicationSearchResults(
                    medicationStream: _medicationStream,
                    updateMedicationSelectionStatus: () {
                      setState(() {
                        isMedicationSelected = true;
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/patient_payload_helper.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/patient_registration_step_manager.dart';

import '../patient_registration_helper.dart';
import 'add_next_of_kin.dart';
import 'basic_details.dart';
import 'complete_registration_page/complete_registration_page.dart';
import 'extra_information.dart';
import 'next_of_kin.dart';
import 'nhif.dart';

class PatientRegistrationContainer extends InheritedWidget {
  static final List<Widget> _tabs = <Widget>[
    const BasicDetailsWidget(),
    const NextOfKin(),
    const AddNextOfKin(),
    const NHIF(),
    const ExtraInformation(),
    const CompleteRegistrationPage(),
  ];

  static const int basicDetailsIndex = 0;
  static const int nextOfKinIndex = 1;
  static const int addNextOfKinIndex = 2;
  static const int nhifIndex = 3;
  static const int extraInformationIndex = 4;
  static const int completeRegistrationIndex = 5;

  static int _currentIndex = 0;

  final TabController _tabController;
  final PatientPayloadHelper _currentRegisteredPatient = PatientPayloadHelper();
  final PatientPayloadHelper _registerNextOfKinPayload = PatientPayloadHelper();

  final PatientRegistrationStepManager _stepManager =
      PatientRegistrationStepManager();

  PatientRegistrationContainer({
    Key? key,
    required TabController tabController,
    required Widget child,
    this.shouldNotify = false,
  })  : _tabController = tabController,
        super(key: key, child: child);

  final bool shouldNotify;

  List<Widget> get tabs => _tabs;

  int get currentIndex => _currentIndex;

  PatientPayloadHelper get currentPatient => _currentRegisteredPatient;

  PatientPayloadHelper get registerNextOfKinPayload =>
      _registerNextOfKinPayload;

  Stream<int> get stepManager => _stepManager.steps;
  List<PatientRegistrationStep> get patientSteps => _stepManager.patientSteps;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return shouldNotify;
  }

  static PatientRegistrationContainer? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PatientRegistrationContainer>();
  }

  void navigate(int index) {
    _tabController.animateTo(index);
    _currentIndex = index;
    _stepManager.updateIndex(index);
  }
}

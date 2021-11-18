// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';

/// ViewModel for the [StartContinueVisitWidget]
class StartContinueVisitViewModel extends Vm {
  StartContinueVisitViewModel({
    required this.patientEdge,
    required this.startVisit,
    required this.continueVisit,
    required this.isWaiting,
  }) : super(equals: <dynamic>[patientEdge, isWaiting]);

  final OnStartVisit startVisit;

  final void Function(BuildContext context) continueVisit;
  final bool isWaiting;
  final PatientEdge? patientEdge;
}

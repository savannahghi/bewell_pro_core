// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';

class BewellPatientProfileViewModel extends Vm {
  final OnStartVisit onStartVisit;

  BewellPatientProfileViewModel({required this.onStartVisit});
}

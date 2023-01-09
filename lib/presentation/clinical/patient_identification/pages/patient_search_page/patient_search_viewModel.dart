// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/misc_utilities/misc.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_widget.dart';

/// Holds data that is used by the widget [PatientIdentification]
class PatientSearchViewModel extends Vm {
  PatientSearchViewModel({
    required this.searchPatientFunction,
    required this.patientEdgeList,
    required this.searchResult,
    required this.onFieldSubmit,
  }) : super(equals: <dynamic>[patientEdgeList, searchResult]);

  final Function(BuildContext, String) searchPatientFunction;
  final Function(BuildContext, String) onFieldSubmit;

  final List<PatientEdge?>? patientEdgeList;
  final SearchResultWidgetEnum searchResult;

  void validateAndSearch(
    BuildContext context,
    String searchTerm,
    GlobalKey<FormState> patientSearchFormKey,
  ) {
    if (patientSearchFormKey.currentState?.validate() == null) {
      return;
    } else if (patientSearchFormKey.currentState?.validate() == false) {
      return;
    } else {
      searchPatientFunction(context, searchTerm);
    }
  }

  String? phoneNumberFormValidator(String? searchParam) {
    if (searchParam == null) return enterValidPhonePrompt;

    /// Remove Whitespace from search param
    final String param = trimWhitespace(searchParam);

    /// Check if phone number is a valid `KE`, `UK`, `USA` or `Belgium` PhoneNumber
    final bool isValidPhoneNumber = validatePhoneNumber(param);

    if (param.isEmpty) {
      return enterPhoneToSearchPrompt;
    } else if (!isValidPhoneNumber) {
      return enterValidPhonePrompt;
    }

    return null;
  }
}

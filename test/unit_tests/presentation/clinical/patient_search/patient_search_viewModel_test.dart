// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_viewModel.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_widget.dart';
import '../../../../mocks/mocks.dart';

void main() {
  final PatientSearchViewModel patientSearchViewModel = PatientSearchViewModel(
    searchPatientFunction: (BuildContext context, String searchTerm) =>
        <dynamic>{},
    patientEdgeList: null,
    searchResult: SearchResultWidgetEnum.searchGuide,
    onFieldSubmit: (BuildContext context, String searchTerm) => <dynamic>{},
  );

  group('patient search phone number form validator', () {
    test('when phone number is correct', () {
      final String? result =
          patientSearchViewModel.phoneNumberFormValidator('0712345678');
      expect(result, null);
    });

    test('when phone number is null', () {
      final String? result =
          patientSearchViewModel.phoneNumberFormValidator(null);
      expect(result, enterValidPhonePrompt);
    });

    test('when phone number is empty', () {
      final String? result =
          patientSearchViewModel.phoneNumberFormValidator('');
      expect(result, enterPhoneToSearchPrompt);
    });

    test('when phone number is invalid', () {
      final String? result =
          patientSearchViewModel.phoneNumberFormValidator('0712s');
      expect(result, enterValidPhonePrompt);
    });

    test('when phone number is short', () {
      final String? result =
          patientSearchViewModel.phoneNumberFormValidator('0712345');
      expect(result, enterValidPhonePrompt);
    });
  });

  group('validate and search', () {
    test('passes validation and searches', () {
      bool searched = false;
      final PatientSearchViewModel patientSearchViewModel =
          PatientSearchViewModel(
        searchPatientFunction: (BuildContext context, String searchTerm) =>
            searched = true,
        patientEdgeList: null,
        searchResult: SearchResultWidgetEnum.searchGuide,
        onFieldSubmit: (BuildContext context, String searchTerm) => <dynamic>{},
      );

      final MockFormState mockFormState = MockFormState(validation: true);
      final GlobalKeyMock patientSearchFormKey =
          GlobalKeyMock(mockFormState: mockFormState);

      patientSearchViewModel.validateAndSearch(
          MockBuildContext(), '0712345678', patientSearchFormKey);

      expect(searched, true);
    });

    test('fails validation and does not search', () {
      bool searched = false;
      final PatientSearchViewModel patientSearchViewModel =
          PatientSearchViewModel(
        searchPatientFunction: (BuildContext context, String searchTerm) =>
            searched = true,
        patientEdgeList: null,
        searchResult: SearchResultWidgetEnum.searchGuide,
        onFieldSubmit: (BuildContext context, String searchTerm) => <dynamic>{},
      );

      final MockFormState mockFormState = MockFormState(validation: false);

      final GlobalKeyMock patientSearchFormKey =
          GlobalKeyMock(mockFormState: mockFormState);

      patientSearchViewModel.validateAndSearch(
          MockBuildContext(), '0712345678', patientSearchFormKey);

      expect(searched, false);
    });

    test('fails validation and when currentState is null', () {
      bool searched = false;
      final PatientSearchViewModel patientSearchViewModel =
          PatientSearchViewModel(
        searchPatientFunction: (BuildContext context, String searchTerm) =>
            searched = true,
        patientEdgeList: null,
        searchResult: SearchResultWidgetEnum.searchGuide,
        onFieldSubmit: (BuildContext context, String searchTerm) => <dynamic>{},
      );

      final GlobalKeyMock patientSearchFormKey = GlobalKeyMock();

      patientSearchViewModel.validateAndSearch(
          MockBuildContext(), '0712345678', patientSearchFormKey);

      expect(searched, false);
    });
  });
}

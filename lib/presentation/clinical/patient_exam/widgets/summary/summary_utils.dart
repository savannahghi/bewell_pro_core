/// Filters the provided list of medications, based on the diagnosis provided
///
/// Returns a list of medications for a specific diagnosis or an empty list if
/// there are none
List<dynamic> medicationsForADiagnosis(
    {required List<dynamic> serviceRequests, required String diagnosisID}) {
  final List<dynamic> medicationsForThisDiagnosis =
      serviceRequests.where((dynamic element) {
    assert(element != null);
    if (element['supportingInformation'] != null) {
      return element['supportingInformation'][0]['id'] == diagnosisID &&
          element['status'] == 'active';
    }
    return false;
  }).toList();
  return medicationsForThisDiagnosis;
}

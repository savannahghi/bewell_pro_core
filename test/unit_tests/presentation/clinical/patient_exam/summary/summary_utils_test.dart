// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_utils.dart';

void main() {
  test('medicationsForADiagnosis List should throw asssertion error', () {
    expect(
        () async => medicationsForADiagnosis(
            diagnosisID: 'diagnosisID', serviceRequests: <dynamic>[null]),
        throwsAssertionError);
  });
}

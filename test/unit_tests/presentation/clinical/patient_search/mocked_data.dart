import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';

class PatientMockData {
  static final List<PatientEdge> activeRecords = <PatientEdge>[
    PatientEdge(
      hasOpenEpisodes: true,
      node: Patient(
        id: 'a_unique_id',
        active: true,
      ),
    )
  ];
}

import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';

/// Logic for validating the next of kin data
class NextOfKinValidation {
  // check if the users phone number has been input as the next of kin
  static bool isSelfNextOfKin(
      String? currentPhoneNumber, PatientConnection? patientConnection) {
    if (patientConnection == null) return false;
    // create a list of patients that are in the PatientConnection
    final List<PatientEdge?>? patients = patientConnection.edges;
    if (patients == null) {
      return false;
    }
    // for each patient check if the phone number is the same as the user's
    // current phone number
    for (int i = 0; i < patients.length; ++i) {
      final PatientEdge? patientEdge = patients[i];
      final List<ContactPoint?>? contactPoints = patientEdge?.node?.telecom;
      if (contactPoints == null) return false;
      for (int j = 0; j < contactPoints.length; ++j) {
        final ContactPoint? contactPoint = contactPoints[j];
        final String? phoneNumber = contactPoint!.value;
        if (phoneNumber == currentPhoneNumber) return true;
      }
    }
    return false;
  }

  /// check if there is any active record
  static bool isRecordActive(PatientConnection? patientConnection) {
    if (activePatientRecords(patientConnection).isEmpty) return false;
    return true;
  }

  /// search for a patients active records
  static List<Patient> activePatientRecords(
      PatientConnection? patientConnection) {
    final List<Patient> patientList = List<Patient>.empty(growable: true);

    if (patientConnection == null) return patientList;
    final List<PatientEdge?>? patients = patientConnection.edges;
    if (patients == null) return patientList;
    for (int i = 0; i < patients.length; ++i) {
      final PatientEdge? patientEdge = patients[i];
      if (patientEdge == null) return patientList;
      final Patient? patient = patientEdge.node;
      if (patient == null) return patientList;
      if (patient.active == null) return patientList;
      final bool? active = patient.active;
      if (active == null) return patientList;

      // there is an active record. Return true
      if (active) {
        patientList.add(patient);
      }
    }
    return patientList;
  }
}

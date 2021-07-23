import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/attachment.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';

class BeWellPrimaryPatientBannerViewModel extends Vm {
  final String patientName;
  final String patientAge;
  final String patientDob;
  final String patientGender;
  final String patientPhoneNumber;
  final List<Attachment>? photo;

  BeWellPrimaryPatientBannerViewModel({
    required this.patientName,
    required this.patientAge,
    required this.patientDob,
    required this.patientGender,
    required this.patientPhoneNumber,
    required this.photo,
  }) : super(equals: <Object?>[
          patientName,
          patientAge,
          patientDob,
          patientGender,
          patientPhoneNumber,
          photo,
        ]);

  static BeWellPrimaryPatientBannerViewModel fromStore(Store<CoreState> store) {
    final Patient? patientRecord =
        store.state.clinicalState?.patientPayload?.patientRecord;

    return BeWellPrimaryPatientBannerViewModel(
      patientName: patientRecord?.name?.first?.text ?? '',
      patientAge: _getPatientAge(patientRecord?.birthDate),
      patientDob: patientRecord?.birthDate ?? defaultDate,
      patientGender: _getPatientGender(patientRecord?.gender),
      patientPhoneNumber: patientRecord?.telecom?.first?.value ?? '',
      photo: patientRecord?.photo,
    );
  }

  static String _getPatientAge(String? birthDate) {
    if (birthDate != null) {
      final DateTime dob = DateTime.parse(birthDate);
      final Duration durationInHours = DateTime.now().difference(dob);
      return (durationInHours.inDays / 365).floor().toString();
    } else {
      return '';
    }
  }

  static String _getPatientGender(PatientGenderEnum? gender) {
    if (gender != null) {
      return describeEnum(gender);
    } else {
      return '';
    }
  }
}

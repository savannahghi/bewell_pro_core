// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';

typedef UpdatePatientHistoryPayload = Function(
    HistoryPayloadType type, String? value);

typedef FormFieldCallback = void Function(String? value);

typedef TakePhotoCallback = void Function(
    {required ImageDocumentType documentType});

typedef OnChangedString = void Function(String);

typedef NavigateToSearchResult = dynamic Function(BuildContext context);

/// resend OTP
typedef ResendOTPCallback = Function(int step);

typedef OnStartVisit = void Function(
    BuildContext context, StartVisitType startVisitType);

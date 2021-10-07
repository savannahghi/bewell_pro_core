// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

enum CompositionTypeTitle {
  patientHistory,
  generalExamination,
  reviewOfSystems
}

extension CompositionTypeTitleEx on CompositionTypeTitle {
  String get name {
    switch (this) {
      case CompositionTypeTitle.patientHistory:
        return patientHistoryTitle;
      case CompositionTypeTitle.generalExamination:
        return generalExaminationTitle;
      case CompositionTypeTitle.reviewOfSystems:
        return reviewOfSystemsTitle;
    }
  }
}

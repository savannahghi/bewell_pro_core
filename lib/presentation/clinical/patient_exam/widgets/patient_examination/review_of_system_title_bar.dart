// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/retire_composition_button.dart';

class ReviewOfSystemTitleBar extends StatelessWidget {
  final String title;
  final StreamController<dynamic> streamController;
  final String compositionTitle;
  final bool isGeneralExam;
  final Function? generalExamCallback;

  const ReviewOfSystemTitleBar({
    required this.title,
    required this.streamController,
    required this.compositionTitle,

    /// For customized deletion of the general exam component
    this.isGeneralExam = false,
    this.generalExamCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: isGeneralExam == true ? 5 : 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    toBeginningOfSentenceCase(title)!,
                    style: TextThemes.veryBoldSize20Text(titleBlack),
                  ),
                ],
              ),
              if (this.isGeneralExam == true)
                SILSecondaryButton(
                  borderColor: redAccent,
                  buttonColor: redAccent,
                  onPressed: generalExamCallback,
                  textColor: redAccent,
                  text: retireText,
                )
              else
                RetireCompositionButton(
                  title: title,
                  compositionTypeTitle: compositionTitle,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

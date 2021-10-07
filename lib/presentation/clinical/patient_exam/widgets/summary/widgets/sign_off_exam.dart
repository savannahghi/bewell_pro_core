// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/summary_exam_button.dart';

class SignOffExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 5 : 10, horizontal: isSmallScreen ? 5 : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SILSecondaryButton(
            buttonKey: AppWidgetKeys.signOffExamPreviousButton,
            onPressed: () => Navigator.of(context).pop(),
            text: previousBtnText,
            textColor: healthcloudPrimaryColor,
            buttonColor: transparent,
            borderColor: healthcloudPrimaryColor,
          ),
          const SaveExamSummaryButton(),
        ],
      ),
    );
  }
}

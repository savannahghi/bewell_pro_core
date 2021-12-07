// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

Future<dynamic> createRetireModal({
  required BuildContext context,
  required String? retireItemName,
  required SectionType section,
  required String? patientName,
  required FormFieldCallback onChangeReasonField,
  VoidCallback? onProblemRetireCallback,
  VoidCallback? onAllergiesRetireCallback,
  VoidCallback? onTestRetireCallback,
  VoidCallback? onMedicationRetireCallback,
  VoidCallback? onDiagnosisRetireCallback,
  VoidCallback? onRetireReviewOfSystemCallback,
  VoidCallback? onRetireGeneralExamCallback,
}) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
          width: isSmallScreen
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * 0.5,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: isSmallScreen
                  ? const EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                  : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 31.0,
                      backgroundColor: white,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: cautionColor.withOpacity(0.1),
                        child: Icon(Icons.warning,
                            size: 38, color: cautionColor.withOpacity(1)),
                      ),
                    ),
                    smallHorizontalSizedBox,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          retireText,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        verySmallHorizontalSizedBox,
                        Text(
                          toBeginningOfSentenceCase(section.name)!,
                          // 'Retire $heading',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    )
                  ],
                ),
                smallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: <TextSpan>[
                          const TextSpan(text: retirePrompt),
                          TextSpan(
                            text: patientName,
                          ),
                          const TextSpan(text: '\'s '),
                          TextSpan(
                            text: retireItemName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  ' ${section.name}. Please provide a reason'),
                        ]),
                  ),
                ),
                mediumVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const RequiredTextFormHintText(
                        hintText: reasonTitle,
                      ),
                      smallVerticalSizedBox,
                      SILFormTextField(
                        key: AppWidgetKeys.retireReasonFormField,
                        maxLines: 3,
                        hintText:
                            'Why do you want to retire the ${section.name}?',
                        validator: (String? v) {
                          if (v == null || v == '') {
                            return reasonPrompt;
                          }
                          return null;
                        },
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        onChanged: (String value) => onChangeReasonField(value),
                      ),
                    ],
                  ),
                ),
                mediumVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SILSecondaryButton(
                          buttonKey: AppWidgetKeys.retireCancelButtonKey,
                          text: silButtonCancel,
                          borderColor: Colors.transparent,
                          buttonColor: healthcloudAccentColor,
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                        ),
                      ),
                      SILSecondaryButton(
                        buttonKey: AppWidgetKeys.retireHelperButtonKey,
                        borderColor: redAccent,
                        text: isSmallScreen ? retireText : retireAndSignPrompt,
                        textColor: redAccent,
                        onPressed: () => clinicalRetireFunctionHelper(
                          onAllergiesRetireCallback: onAllergiesRetireCallback,
                          section: section,
                          onProblemRetireCallback: onProblemRetireCallback,
                          onTestRetireCallback: onTestRetireCallback,
                          onMedicationRetireCallback:
                              onMedicationRetireCallback,
                          onDiagnosisRetireCallback: onDiagnosisRetireCallback,
                          onRetireReviewOfSystemCallback:
                              onRetireReviewOfSystemCallback,
                          onRetireGeneralExamCallback:
                              onRetireGeneralExamCallback,
                          formKey: _formKey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

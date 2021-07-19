import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class MedicationItemLargeScreen extends StatelessWidget {
  final String requester;
  final String prescription;
  final Function retireMedicationFunc;
  final String medicationName;

  const MedicationItemLargeScreen({
    required this.medicationName,
    required this.requester,
    required this.prescription,
    required this.retireMedicationFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: white,
        border: Border(
          bottom: BorderSide(color: grey.withOpacity(0.4)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 6,
                      child: Text(
                        toBeginningOfSentenceCase(
                            medicationName.toString().toLowerCase())!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: orderedByText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: requester,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: orderedOnText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: date,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                smallVerticalSizedBox,
                Text(
                  prescription,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: grey, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                SILSecondaryButton(
                  buttonKey: AppWidgetKeys.retireMedicationsLargeScreen,
                  onPressed: () => retireMedicationFunc(),
                  text: retireText,
                  textColor: redAccent,
                  borderColor: redAccent,
                  buttonColor: transparent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

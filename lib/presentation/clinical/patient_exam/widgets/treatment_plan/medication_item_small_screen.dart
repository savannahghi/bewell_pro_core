import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class MedicationItemSmallScreen extends StatelessWidget {
  final String medicationName;
  final String requester;
  final String prescription;
  final Function retireMedicationFunc;

  const MedicationItemSmallScreen({
    required this.medicationName,
    required this.requester,
    required this.prescription,
    required this.retireMedicationFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        border: Border(
          bottom: BorderSide(color: grey.withOpacity(0.4)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 4,
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
                  child: Column(
                    children: <Widget>[
                      SILSecondaryButton(
                        buttonKey: AppWidgetKeys.retireMedicationSmallScreen,
                        onPressed: () => retireMedicationFunc(),
                        borderColor: redAccent,
                        textColor: redAccent,
                        text: retireText,
                      ),
                    ],
                  ),
                ),
              ]),
          size15VerticalSizedBox,
          Text(
            orderedByText,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            requester,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          size15VerticalSizedBox,
          Text(
            orderedOnText,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            date,
            style: Theme.of(context).textTheme.bodyText2,
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
    );
  }
}

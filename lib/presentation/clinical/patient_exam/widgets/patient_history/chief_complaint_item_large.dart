// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class ChiefComplaintItemLarge extends StatelessWidget {
  const ChiefComplaintItemLarge({
    Key? key,
    required this.problemName,
    required this.recorder,
    required this.recordedDate,
    required this.clinicalStatus,
    required this.retireCompositionFunction,
  }) : super(key: key);

  final String clinicalStatus;
  final String problemName;
  final String recordedDate;
  final String recorder;
  final void Function() retireCompositionFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(problemName, style: Theme.of(context).textTheme.bodyText1),
            Text(
              recorder,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(color: black54),
            )
          ],
        ),
        Text(
          'Date: $recordedDate',
          style: Theme.of(context).textTheme.caption!.copyWith(color: black54),
        ),
        smallVerticalSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  statusText,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: black54),
                ),
                Text(
                  clinicalStatus,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: SILSecondaryButton(
            buttonKey: AppWidgetKeys.retireChiefComplaintLargeButtonKey,
            borderColor: redAccent,
            onPressed: () => retireCompositionFunction(),
            text: retireText,
            textColor: redAccent,
          ),
        ),
      ],
    );
  }
}

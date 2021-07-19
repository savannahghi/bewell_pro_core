import 'package:flutter/material.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

class NoNextOfKinFound extends StatelessWidget {
  final String phoneNumberString;

  const NoNextOfKinFound({
    required this.phoneNumberString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: AppWidgetKeys.noNextOfKinContainerKey,
      width: double.infinity,
      height: 400,
      decoration:
          BoxDecoration(border: Border.all(color: black.withOpacity(0.16))),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: <Widget>[
          largeVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                      image: AssetImage(notFoundSpaceIcon),
                      height: 100.0,
                      width: 100.0),
                  size15VerticalSizedBox,
                  Column(
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                                text: foundNoMatches,
                                style: Theme.of(context).textTheme.subtitle1),
                            TextSpan(
                                text: ' $phoneNumberString',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: green))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              SILPrimaryButton(
                buttonKey: AppWidgetKeys.registerKinKey,
                onPressed: () {
                  const int index =
                      PatientRegistrationContainer.addNextOfKinIndex;
                  PatientRegistrationContainer.of(context)!.navigate(index);
                },

                /// go to [AddNextOfKin]
                buttonColor: healthcloudAccentColor,
                text: registerNextOfKin,
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

import 'package:shared_themes/spaces.dart';

class ResultsNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Image(
              image: AssetImage(notFoundSpaceIcon),
              height: 100.0,
              width: 100.0),
          Column(
            children: <Widget>[
              Text(resultsNotFoundFirstMsg,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w600)),
              smallVerticalSizedBox,
              Text(
                resultsNotFoundSecondMsg,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

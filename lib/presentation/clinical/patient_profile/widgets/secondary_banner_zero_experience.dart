// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

class SecondaryBannerZeroState extends StatelessWidget {
  const SecondaryBannerZeroState({required this.currentTabName});

  final String currentTabName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          const Image(
              image: AssetImage(notFoundSpaceIcon),
              height: 100.0,
              width: 100.0),
          Column(
            children: <Widget>[
              Text('The patient has no recorded $currentTabName yet.',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w600)),
              smallVerticalSizedBox,
              Text(
                'Tap on Start Exam to add $currentTabName',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

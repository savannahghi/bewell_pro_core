// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

class NotRecordedIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(Icons.warning, color: grey),
        smallHorizontalSizedBox,
        Text('Not recorded', style: TextThemes.boldSize16Text())
      ],
    );
  }
}

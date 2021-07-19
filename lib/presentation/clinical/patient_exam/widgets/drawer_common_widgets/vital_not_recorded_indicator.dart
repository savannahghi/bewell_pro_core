import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

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

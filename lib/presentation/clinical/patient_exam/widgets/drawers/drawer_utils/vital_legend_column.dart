import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class VitalLegendColumn extends StatefulWidget {
  const VitalLegendColumn({
    Key? key,
    required this.title,
    required this.unit,
    required this.vitalValue,
  }) : super(key: key);

  final String title;
  final String unit;
  final String? vitalValue;

  @override
  _VitalLegendColumnState createState() => _VitalLegendColumnState();
}

class _VitalLegendColumnState extends State<VitalLegendColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.title),
        smallVerticalSizedBox,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
                (widget.vitalValue == null || widget.vitalValue!.isEmpty)
                    ? '0'
                    : widget.vitalValue!,
                style: TextThemes.boldSize18Text(healthcloudPrimaryColor)),
            Text(widget.unit, style: TextThemes.boldSize12Text(grey))
          ],
        ),
      ],
    );
  }
}

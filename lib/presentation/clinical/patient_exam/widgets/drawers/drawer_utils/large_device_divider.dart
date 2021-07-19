import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';

class LargeDeviceDivider extends StatefulWidget {
  const LargeDeviceDivider({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  _LargeDeviceDividerState createState() => _LargeDeviceDividerState();
}

class _LargeDeviceDividerState extends State<LargeDeviceDivider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(width: 1, height: 95, color: grey),
        Text('OR', style: widget.textTheme.headline6),
        Container(width: 1, height: 95, color: grey),
      ],
    );
  }
}

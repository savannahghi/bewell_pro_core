import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class LargeDeviceReading extends StatelessWidget {
  const LargeDeviceReading(
      {Key? key, required this.value, required this.readingImage})
      : super(key: key);

  final String value;
  final AssetImage readingImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: healthcloudPrimaryColor, width: 3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              smallVerticalSizedBox,
              Image(image: readingImage, height: 50, width: 50),
              smallVerticalSizedBox,
              Text(
                value,
                style: TextThemes.veryBoldSize32Text(healthcloudPrimaryColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}

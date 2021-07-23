import 'package:flutter/material.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class GuideBox extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;

  const GuideBox(
      {required this.iconData, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    const double dimension = 15;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: ResponsiveWidget.isSmallScreen(context) ? 20 : 45),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xfff7f7f9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // The icon container with the dotted borders
          SizedBox(
            width: 40,
            height: 40,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  width: dimension,
                  height: dimension,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                        left:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  width: dimension,
                  height: dimension,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                        right:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: dimension,
                  height: dimension,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                        left:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  width: dimension,
                  height: dimension,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                        right:
                            BorderSide(width: 2, color: healthcloudAccentColor),
                      ),
                    ),
                  ),
                ),
                Center(
                    child:
                        Icon(iconData, color: healthcloudAccentColor, size: 22))
              ],
            ),
          ),
          smallVerticalSizedBox,
          Text(
            title,
            style: TextThemes.veryBoldSize15Text(),
            textAlign: TextAlign.center,
          ),
          smallVerticalSizedBox,
          Text(
            description,
            style: TextThemes.normalSize13Text(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

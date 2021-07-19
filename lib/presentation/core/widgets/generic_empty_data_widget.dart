import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class GenericEmptyData extends StatelessWidget {
  const GenericEmptyData({required this.item, this.customMessage});

  final String? customMessage;
  final String item;

  @override
  Widget build(BuildContext context) {
    final String noDataText =
        'You have no ${item.toLowerCase()}. Check back later for more.';
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(emptyDataUrl, height: 100),
            mediumVerticalSizedBox,
            Text(
              customMessage ?? noDataText,
              style: TextThemes.boldSize16Text(Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

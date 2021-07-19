import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_themes/colors.dart';

class EmptyTasks extends StatelessWidget {
  final String? item;

  const EmptyTasks({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: white),
      child: Center(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(emptyIconUrl),
            mediumVerticalSizedBox,
            Text(
              (item != null)
                  ? 'You have no ${item!.toLowerCase()}. Check back later for more'
                  : '',
              style: TextThemes.boldSize16Text(grey),
            )
          ],
        ),
      ),
    );
  }
}

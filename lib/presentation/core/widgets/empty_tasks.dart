// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

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

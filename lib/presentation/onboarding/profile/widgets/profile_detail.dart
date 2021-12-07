// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import '../profile_contact_details.dart';
import '../profile_page_items.dart';

/// Used for [detail view] in master detail UI
class ProfileDetail extends StatelessWidget {
  const ProfileDetail({Key? key, required ValueNotifier<ProfileItem> selection})
      : _selection = selection,
        super(key: key);

  final ValueNotifier<ProfileItem> _selection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<ProfileItem>(
        valueListenable: _selection,
        builder:
            (BuildContext context, ProfileItem profileItem, Widget? child) {
          /// returns default page detail when profile is open for the first time
          if (profileItem.text == contactInfo) {
            return Column(
              children: <Widget>[
                veryLargeVerticalSizedBox,
                Text(profileItem.text),
                veryLargeVerticalSizedBox,
                BuildContactProvider(),
              ],
            );
          }

          /// Returns coming soon text if profile item is not ready
          if (profileItem.isComingSoon == true) {
            return const Center(child: Text(comingSoonText));
          }

          if (profileItem.tabletWidget == null) {
            return const SizedBox();
          }

          /// Returns profile page detail when profile item is clicked
          return Column(
            children: <Widget>[
              veryLargeVerticalSizedBox,
              Text(profileItem.text),
              largeVerticalSizedBox,
              profileItem.tabletWidget!,
            ],
          );
        },
      ),
    );
  }
}

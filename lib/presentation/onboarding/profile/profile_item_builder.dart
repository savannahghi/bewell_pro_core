import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

class ProfileItemBuilder extends StatelessWidget {
  const ProfileItemBuilder({
    required this.section,
    required this.onSelect,
  });

  final ValueChanged<ProfileItem> onSelect;
  final ProfileItemType section;

  @override
  Widget build(BuildContext context) {
    final ProfileSubject profileSubject = ProfileSubject();
    return Container(
      color: Colors.grey.withOpacity(0.1),
      child: Column(
        children: <Widget>[
          ...profileItems
              .where((ProfileItem item) => item.section == section)
              .toList()
              .map(
                (ProfileItem profileItem) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 1.0),
                  color:
                      (profileSubject.selectedTile.value == profileItem.text &&
                              ResponsiveWidget.deviceType(context) !=
                                  DeviceScreensType.Mobile)
                          ? profileSubject.color.valueOrNull
                          : Colors.white,
                  child: ListTile(
                      key: Key(profileItem.text),
                      selectedTileColor: profileSubject.color.valueOrNull,
                      dense: true,
                      title: Text(
                        profileItem.text,
                        style: TextThemes.boldSize14Text(),
                      ),
                      trailing: profileItem.isComingSoon
                          ? null
                          : const Icon(CupertinoIcons.chevron_right, size: 20),
                      subtitle: profileItem.isComingSoon
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                comingSoonText,
                                style: TextStyle(
                                    color: subtitleGrey,
                                    fontStyle: FontStyle.italic),
                              ),
                            )
                          : const SizedBox(),
                      onTap: () async =>

                          /// Navigate to item page
                          onSelect(profileItem)),
                ),
              )
        ],
      ),
    );
  }
}

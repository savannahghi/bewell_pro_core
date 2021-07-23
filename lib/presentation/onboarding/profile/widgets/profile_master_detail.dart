import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/theme/colors.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_item_builder.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/event_bus.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/profile_banner.dart';
import 'build_profile_footer.dart';

/// used for [master view] in master detail ui
class ProfileMasterDetail extends StatefulWidget {
  const ProfileMasterDetail({Key? key, required this.selection})
      : super(key: key);

  final ValueNotifier<ProfileItem> selection;

  @override
  _ProfileMasterDetailState createState() => _ProfileMasterDetailState();
}

class _ProfileMasterDetailState extends State<ProfileMasterDetail> {
  ProfileSubject profileSubject = ProfileSubject();

  @override
  Widget build(BuildContext context) {
    final UserProfile userProfile =
        StoreProvider.state<AppState>(context)!.userState!.userProfile!;

    final BioData bioData = userProfile.userBioData!;
    final String firstName =
        toBeginningOfSentenceCase(bioData.firstName?.getValue()) ?? 'Hey';
    final String lastName =
        toBeginningOfSentenceCase(bioData.lastName?.getValue()) ?? 'You';
    final String userName = '$firstName $lastName';

    return Column(
      children: <Widget>[
        /// [ProfileBanner] section
        Hero(
          tag: 'profile_banner',
          child: Material(
            child: SILProfileBanner(
              editable: true,
              backgroundImagePath: doctorIcon,
              userPhotoUrl: (userProfile.photoUploadID != null)
                  ? userProfile.photoUploadID!
                  : UNKNOWN,
              userName: userName,
              primaryPhone: userProfile.primaryPhoneNumber!.getValue(),
              profileRoute: editUserProfileRoute,
            ),
          ),
        ),
        veryLargeVerticalSizedBox,
        mediumVerticalSizedBox,

        /// [Account] section
        const ProfileSeparator(text: accountSection),

        ProfileItemBuilder(
          onSelect: (ProfileItem val) async {
            if (SILResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile) {
              navigateToProfileItemPage(context: context, profileItem: val);
            } else {
              final Map<String, dynamic> eventPayload = <String, dynamic>{
                'route': val.onTapRoute
              };

              AppWrapperBase.of(context)!
                  .eventBus
                  .fire(TriggeredEvent(navigationEvent, eventPayload));
              if (val.onTapRoute == pinVerificationRoute) {
                /// dispatch action to set [isChangingPin] to true
                await Navigator.of(context).pushNamed(
                  pinVerificationRoute,
                  arguments: PinVerificationType.pinChange,
                );
              }

              if (val.text != changePINText &&
                  val.text != termsOfServiceSettings) {
                setState(() {
                  widget.selection.value = val;
                });

                profileSubject.selectedTile.add(val.text);
              }

              profileSubject.color.add(Colors.purple[100]!);
            }
          },
          section: ProfileItemType.account,
        ),

        /// [Legal] section

        const ProfileSeparator(text: legalSection),

        ProfileItemBuilder(
          onSelect: (ProfileItem val) async {
            if (SILResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile) {
              navigateToProfileItemPage(context: context, profileItem: val);
            } else {
              profileSubject.color.add(Colors.purple[100]!);

              if (val.onTapRoute == webViewRoute) {
                await triggerNavigationEvent(
                    context: context, route: val.onTapRoute);
              }
            }
          },
          section: ProfileItemType.legal,
        ),
        BuildProfileFooter(),
      ],
    );
  }
}

class ProfileSeparator extends StatelessWidget {
  const ProfileSeparator({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 15, 22, 5),
      decoration: const BoxDecoration(color: profileSeparatorBackgroundColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text.toUpperCase(),
          style: TextThemes.boldSize12Text()
              .copyWith(color: Theme.of(context).accentColor, fontSize: 8),
        ),
      ),
    );
  }
}
